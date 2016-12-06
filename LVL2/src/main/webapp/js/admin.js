
// <script> 
//register events
$(document).ready(function () {

    loadAllPosts();
    loadAllPages();

    $("#page-layout").change(function () {
        if ($("#page-layout").val() == 1) {
            $("#column1").css("display", "block");
            $("#column2").css("display", "none");
            $("#column3").css("display", "none");
        } else if ($("#page-layout").val() == 2) {
            $("#column1").css("display", "block");
            $("#column2").css("display", "block");
            $("#column3").css("display", "none");
        } else if ($("#page-layout").val() == 3) {
            $("#column1").css("display", "block");
            $("#column2").css("display", "block");
            $("#column3").css("display", "block");
        }
    });

    $(".clear-button").click(function () {
        event.preventDefault();
        clearPost();
    });

    $(".clear-page-button").click(function () {
        event.preventDefault();
        clearPage();
    });

    $(".nav-pills a").click(function () {
        event.preventDefault();
        $(this).tab('show');
    });

    $("#new-post-button").click(function (event) {
        event.preventDefault();
        addPost();
    });

    $("#new-static-page-button").click(function (event) {
        event.preventDefault();
        addPage();
    });

    $("#new-preview-button").click(function (event) {
        event.preventDefault();
    });

    $("#new-save-button").click(function (event) {
        event.preventDefault();
        savePost();
    });

    $("#post-edit-modal").on('show.bs.modal', function (event) {
        var element = $(event.relatedTarget);
        var postId = element.data('post-id');
        fillEditModal(postId);
    });

    $("#post-preview-modal").on('show.bs.modal', function (event) {
        var element = $(event.relatedTarget);
        var postId = element.data('post-id');
        fillPreviewModal(postId);
    });

    $("#delete").click(function (event) {
        deletePost();
    });

    $("#post-scheduled").change(function () {
        valueChanged();
    });

    // This function would be for admin or employee comments
    $("#add-comment-button").click(function (event) {
        event.preventDefault();
        addComment();
    });

    // This function would be for reader or guest comments
    $("#submit-comment-button").click(function (event) {
        event.preventDefault();
        submitComment();
    });



});


//functions

function clearPost() {
    $('#new-post-form')[0].reset();
    tinymce.get('new-post-content').setContent("");
}

function clearPage() {
    $('#new-static-page-form input').val("");
    tinymce.get('new-page-content1').setContent("");
    tinymce.get('new-page-content2').setContent("");
    tinymce.get('new-page-content3').setContent("");
}

function fillAllPostTable(data, status) {
    clearTable('#allPosts');
    $.each(data, function (index, post) {
        var datePosted = new Date(post.datePosted).toLocaleDateString();
        if (post.dateScheduled === null) {
            var dateScheduled = null;
        } else {
            var dateScheduled = new Date(post.dateScheduled).toLocaleString();
        }

        $('#allPosts').append($('<tr>').attr({'class': (post.status === 10 ? 'pendingDelete' : ' ')})
                .append($('<td>').append($('<a>')
                        .attr({
                            'data-post-id': post.id,
                            'data-toggle': 'modal',
                            'data-target': '#post-preview-modal'
                        })
                        .text(post.title)
                        ))
                .append($('<td>').text(post.author))
                .append($('<td>').text(datePosted))
                .append($('<td>').text(dateScheduled))
                .append($('<td>').append($('<a>')
                        //<a data-toggle="modal" data-target="#post-edit-modal" data-post-id="0">Edit</a
                        .attr({
                            'data-toggle': 'modal',
                            'data-target': '#post-edit-modal',
                            'data-post-id': post.id
                        })
                        .text('Edit')
                        ))
                .append($('<td>').append($('<a>')
                        .attr({
                            'onClick': (post.status === 10 ? '' : 'deletePost(' + post.id + ')')
                        })
                        .text(post.status === 10 ? 'Pending' : 'Delete')
                        ))
                );
    });
}

function fillScheduleTable(data, status) {
    clearTable('#scheduledPosts');
    $.each(data, function (index, post) {
        var datePosted = new Date(post.datePosted).toLocaleDateString();
        if (post.dateScheduled === null) {

        } else {
            var dateScheduled = new Date(post.dateScheduled).toLocaleString();
            $('#scheduledPosts').append($('<tr>').attr({'class': (post.status === 10 ? 'pendingDelete' : ' ')})
                    .append($('<td>').append($('<a>')
                            .attr({
                                'data-post-id': post.id,
                                'data-toggle': 'modal',
                                'data-target': '#post-preview-modal'
                            })
                            .text(post.title)
                            ))
                    .append($('<td>').text(post.author))
                    .append($('<td>').text(datePosted))
                    .append($('<td>').text(dateScheduled))
                    .append($('<td>').append($('<a>')
                            //<a data-toggle="modal" data-target="#post-edit-modal" data-post-id="0">Edit</a
                            .attr({
                                'data-toggle': 'modal',
                                'data-target': '#post-edit-modal',
                                'data-post-id': post.id
                            })
                            .text('Edit')
                            ))
                    .append($('<td>').append($('<a>')
                            .attr({
                                'onClick': (post.status === 10 ? '' : 'deletePost(' + post.id + ')')
                            })
                            .text(post.status === 10 ? 'Pending' : 'Delete')
                            ))
                    );
        }


    });
function fillAllPageTable(data, status) {
    clearAllPageTable();
    if (document.getElementById("allPagesAdmin")) {
        $.each(data, function (index, page) {
            $('#allPagesAdmin').append($('<tr>').attr({'id': (page.status === 10 ? 'pendingDelete' : ' ')})
                    .append($('<td>').text(page.title))
                    .append($('<td>')
                            .append($('<a>').attr({
                                'onClick': 'deletePage(' + page.id + ')'
                            }).text((page.status === 10 ? 'Really Delete' : 'Delete')))))
        });
    } else if (document.getElementById("allPagesEmployee")) {
        $.each(data, function (index, page) {
            $('#allPagesEmployee').append($('<tr>').attr({'id': (page.status === 10 ? 'pendingDelete' : ' ')})
                    .append($('<td>').text(page.title))
                    .append($('<td>')
                            .append($('<a>').attr({
                                'onClick': (page.status === 10 ? '' : 'deletePage(' + page.id + ')') 
                            }).text((page.status === 10 ? 'Flagged For Deletion' : 'Flag For Deletion')))))
        });
    }
    
}

function loadAllPosts() {
    $.ajax({
        url: "posts"
    }).done(function (data) {
        fillAllPostTable(data, status);
        fillScheduleTable(data, status);
    });
}

function loadAllPages() {
    $.ajax({
        url: "pages"
    }).done(function (data) {
        fillAllPageTable(data, status);
    });
}

function clearAllPostTable() {
    $('#allPosts').empty();

function clearTable(table) {
    $(table).empty();
}

function clearAllPageTable() {
    $('#allPagesAdmin').empty();
    $('#allPagesEmployee').empty();
}

function addPost() {
    var postTitle = $("#post-title").val();
    var postContent = tinymce.get('new-post-content').getContent();

    if ($('#post-scheduled').is(":checked")) {
        document.getElementById("post-date").stepUp(new Date().getTimezoneOffset());
        var postDate = Date.parse($("#post-date").val());
    } else {
        var postDate;
    }
    $.ajax({
        url: 'blog',
        type: 'POST',
        headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json'
        },
        'dataType': 'json',
        data: JSON.stringify({
            title: postTitle,
            dateScheduled: postDate,
            content: postContent,
            status: -1
        })
    }).done(function (data) { //success is deprecated, were supposed to use done now
        alert("success!");
        clearPost();
        loadAllPosts();
    });
}

function addPage() {
    var pageTitle = $("#page-title").val();
    var pageLayout = $("#page-layout").val();
    var pageContent1 = tinymce.get('new-page-content1').getContent();
    var pageContent2 = tinymce.get('new-page-content2').getContent();
    var pageContent3 = tinymce.get('new-page-content3').getContent();

    $.ajax({
        url: 'staticpage',
        type: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        data: JSON.stringify({
            title: pageTitle,
            content1: pageContent1,
            content2: pageContent2,
            content3: pageContent3,
            status: 15,
            layout: pageLayout
        })
    }).done(function (data) {
        clearPage();
        loadAllPages();
        alert("success!");
    });
}

function savePost() {
    var postTitle = $("#post-title").val();
    var postDate = $("#post-date").val();
    var postContent = tinymce.get('new-post-content').getContent();

    $.ajax({
        url: 'blog',
        type: 'POST',
        headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json'
        },
        'dataType': 'json',
        data: JSON.stringify({
            title: postTitle,
            datePosted: postDate,
            content: postContent,
            status: 9
        })
    }).done(function (data) { //success is deprecated, were supposed to use done now
        alert("success!");
        loadAllPosts();
    });
}


function editPost() {
    var postTitle = $("#edit-post-title").val();
    var postDate = $("#edit-post-date").val();
    var postContent = tinymce.get('edit-post-content').getContent();
    var postId = $("#edit-post-id").val();
    var postAuthor = $("#edit-post-author").val();
    var postStatus = $("#edit-post-status").val();

    $.ajax({
        url: '/LVL2/edit/' + postId,
        type: 'POST',
        headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json'
        },
        'dataType': 'json',
        data: JSON.stringify({
            title: postTitle,
            datePosted: postDate,
            content: postContent,
            author: postAuthor,
            status: postStatus,
            id: postId
        })
    }).done(function (data) { //success is deprecated, were supposed to use done now
        alert("success!");
    });
}

function deletePost(postId) {
    $.ajax({
        url: 'blog/' + postId,
        type: 'DELETE'
    }).done(function (data) { //success is deprecated, were supposed to use done now
        alert("success!");
        loadAllPosts();
    });
}

function deletePage(pageId) {
    $.ajax({
        url: 'staticpage/' + pageId,
        type: 'DELETE'
    }).done(function (data) { //success is deprecated, were supposed to use done now
        alert("success!");
        loadAllPages();
    });
}

function fillEditModal(postId) {
    $.ajax({
        type: 'GET',
        url: 'post/' + postId,
        headers: {
            'Accept': 'application/json'
        }
    }).done(function (post) {
        $('#post-edit-modal .modal-title').text(post.title);
        $('#edit-post-author').text(post.author + " - " + post.datePosted);
        $('#edit-post-id').val(post.id);
        $('#edit-post-status').val(post.status);
        $('#edit-post-title').val(post.title);
        $('#edit-post-date').val(post.datePosted);
        tinyMCE.activeEditor.setContent(post.content);
    });
}

function fillPreviewModal(postId) {
    $.ajax({
        type: 'GET',
        url: 'post/' + postId,
        headers: {
            'Accept': 'application/json'
        }
    }).done(function (post) {
        $('#preview-post-content').html(post.content);
        $('#preview-post-author').text(post.author + " - " + post.datePosted);
        $('#preview-post-title').text(post.title);
    });
}

function addComment() {
    var displayName = $("#comment-display-name").val();
    var postId = $("#postId").text();
    var commentContent = tinymce.get('#comment-content').getContent();

    $.ajax({
        url: 'comment',
        type: 'POST',
        headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json'
        },
        'dataType': 'json',
        data: JSON.stringify({
            postId: postId,
            name: displayName,
            comment: commentContent,
            status: 5
        })
    }).done(function (data) { //success is deprecated, were supposed to use done now
        alert("success!");
    });
}
function sumbitComment() {
    var displayName = $("#comment-display-name").val();
    var postId = $("#postId").text();
    var commentContent = tinymce.get('#comment-content').getContent();

    $.ajax({
        url: 'comment',
        type: 'POST',
        headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json'
        },
        'dataType': 'json',
        data: JSON.stringify({
            postId: postId,
            name: displayName,
            comment: commentContent,
            status: 6
        })
    }).done(function (data) { //success is deprecated, were supposed to use done now
        alert("success!");
    });
}

function deleteComment(commentId) {
    $.ajax({
        url: 'comment/' + commentId,
        type: 'DELETE',
    }).done(function (data) { //success is deprecated, were supposed to use done now
        alert("success!");
    });
}

function approveComment(commentId) {
    $.ajax({
        url: 'comment/approve' + commentId,
        type: 'PUT'
    }).done(function (data) { //success is deprecated, were supposed to use done now
        alert("success!");
    });
}

function declineComment(commentId) {
    $.ajax({
        url: 'comment/decline' + commentId,
        type: 'PUT'
    }).done(function (data) { //success is deprecated, were supposed to use done now
        alert("success!");
    });
}

function loadCommentsByPostId(postId) {
    $.ajax({
        url: 'comments/' + postId,
        method: 'GET'
    }).done(function (data) {
        displayComments(data, status);
    });
}
function displayComments(data, status) {
    $.each(data, function (index, comment) {
        $('#blogComments').append($('<tr>')
                .append($('<td>').text(comment.name))
                .append($('<td>').text(comment.content))
                );
    });
}


function pullTag() {

}

function assignTagId(tagName) {

}

function populateBridgeTable(postId) {

}
// </script> 
