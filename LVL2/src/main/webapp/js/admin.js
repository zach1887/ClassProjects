
// <script> 

//register events
$(document).ready(function () {

    loadAllPosts();

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

});


//functions

function clearPost() {
    $('#new-post-form')[0].reset();
    tinymce.get('new-post-content').setContent("");
}

function clearPage() {
    $('#new-static-page-form')[0].reset();
    tinymce.get('new-page-content').setContent("");
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
}

function loadAllPosts() {
    $.ajax({
        url: "posts"
    }).done(function (data) {
        fillAllPostTable(data, status);
        fillScheduleTable(data, status);
    });
}


function clearTable(table) {
    $(table).empty();
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
    }).done(function (data) { //success is depreciated, were supposed to use done now
        alert("success!");
        clearPost();
        loadAllPosts();
    });
}

function addPage() {
    var pageTitle = $("#page-title").val();
    var pageContent = tinymce.get('new-page-content').getContent();

    $.ajax({
        url: 'staticpage',
        type: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        data: JSON.stringify({
            title: pageTitle,
            content: pageContent,
            status: 1
        })
    }).done(function (data) {
        clearPage();
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
    }).done(function (data) { //success is depreciated, were supposed to use done now
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
    }).done(function (data) { //success is depreciated, were supposed to use done now
        alert("success!");
    });
}

function deletePost(postId) {
    $.ajax({
        url: 'blog/' + postId,
        type: 'DELETE'
    }).done(function (data) { //success is depreciated, were supposed to use done now
        alert("success!");
        loadAllPosts();
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


function valueChanged()
{
    if ($('#post-scheduled').is(":checked"))
        $("#new-post-schedule").show();
    else
        $("#new-post-schedule").hide();
}
// </script> 