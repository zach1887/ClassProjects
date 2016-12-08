
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

    $("#edit-page-layout").change(function () {
        setNumberOfTinyMceEdit();
    });

    $(".clear-button").click(function () {
        event.preventDefault();
        clearPost();
    });

    $(".clear-page-button").click(function () {
        event.preventDefault();
        clearPage();
    });

    $(".clear-page-button-modal").click(function () {
        event.preventDefault();
        clearPageModal();
    });

    $(".nav-pills a").click(function () {
        event.preventDefault();
        $(this).tab('show');
    });

    $("#new-post-button").click(function (event) {
        event.preventDefault();
        storeTags();
        tinymce.activeEditor.uploadImages();
        addPost();
    });

    $("#edit-post-button").click(function (event) {
        event.preventDefault();
        editPost();
    });

    $("#edit-page-button-modal").click(function (event) {
        event.preventDefault();
        editPage();
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
        storeTags();
        savePost();
    });

    $("#extractedTags").focus(function (event) {
        extractTags();
    });


    $("#extract-tags-button").click(function (event) {
        event.preventDefault();
        alert("Just write something to the screen!");
    });

    $("#edit-tags-button").click(function (event) {
        event.preventDefault();
        alert("Just write something to the screen!");
    });


    $("#edit-post-button").click(function (event) {
        event.preventDefault();
        editPost();
    });

    $("#post-edit-modal").on('show.bs.modal', function (event) {
        var element = $(event.relatedTarget);
        var postId = element.data('post-id');
        fillEditModal(postId);
    });

    $("#page-edit-modal").on('show.bs.modal', function (event) {
        var element = $(event.relatedTarget); // Hey, go find the thing that made this event happen
        var pageId = element.data('page-id'); // found the a tag, now get the data-post-id value
        fillEditPageModal(pageId);
    });

    $("#post-preview-modal").on('show.bs.modal', function (event) {
        var element = $(event.relatedTarget);
        var postId = element.data('post-id');
        fillPreviewModal(postId);
    });

    $("#tag-preview-modal").on('show.bs.modal', function (event) {
        var element = $(event.relatedTarget);
        tagPreviewModal();
    });

    $("#tag-edit-modal").on('show.bs.modal', function (event) {
    });

    $("#post-scheduled").change(function () {
        valueChanged();
    });

    // This function would be for admin or employee comments
    $("#add-comment-button").click(function (event) {
        event.preventDefault();
        addComment();
    });

    $("#delete").click(function (event) {
        deletePost();
    });

});


//functions

function setNumberOfTinyMceEdit() {
    if ($("#edit-page-layout").val() == 1) {
        $("#editColumn1").css("display", "block");
        $("#editColumn2").css("display", "none");
        $("#editColumn3").css("display", "none");
    } else if ($("#edit-page-layout").val() == 2) {
        $("#editColumn1").css("display", "block");
        $("#editColumn2").css("display", "block");
        $("#editColumn3").css("display", "none");
    } else if ($("#edit-page-layout").val() == 3) {
        $("#editColumn1").css("display", "block");
        $("#editColumn2").css("display", "block");
        $("#editColumn3").css("display", "block");
    }
}

function clearPost() {
    $("#new-post-schedule").hide();
    $('#new-post-form')[0].reset();
    tinymce.get('new-post-content').setContent("");
}

function clearPage() {
    $('#new-static-page-form input').val("");
    tinymce.get('new-page-content1').setContent("");
    tinymce.get('new-page-content2').setContent("");
    tinymce.get('new-page-content3').setContent("");
}

function clearPageModal() {
    $('#edit-page-form input').val("");
    tinymce.get('edit-page-content1').setContent("");
    tinymce.get('edit-page-content2').setContent("");
    tinymce.get('edit-page-content3').setContent("");
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

        $('#allPosts').append($('<tr>').attr({'id': (post.status === 10 ? 'pendingDelete' : ' ')})
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
        if (post.dateScheduled !== null) {
            var dateScheduled = new Date(post.dateScheduled);//.toLocaleString();
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

function fillAllPageTable(data, status) {
    clearAllPageTable();
    if (document.getElementById("allPagesAdmin")) {
        $.each(data, function (index, page) {
            $('#allPagesAdmin').append($('<tr>').attr({'id': (page.status === 10 ? 'pendingDelete' : ' ')})
                    .append($('<td>')
                            .append($('<a>').attr({
                                'href': ('static/' + page.id)
                            }).text(page.title)))
                    .append($('<td>')
                            .append($('<a>').attr({
                                'onClick': 'deletePage(' + page.id + ')'
                            }).text((page.status === 10 ? 'Really Delete' : 'Delete'))))
                    .append($('<td>')
                            .append($('<a>').attr({
                                'data-toggle': 'modal',
                                'data-target': '#page-edit-modal',
                                'data-page-id': page.id
                            }).text('Edit'))))
        });
    } else if (document.getElementById("allPagesEmployee")) {
        $.each(data, function (index, page) {
            $('#allPagesEmployee').append($('<tr>').attr({'id': (page.status === 10 ? 'pendingDelete' : ' ')})
                    .append($('<td>')
                            .append($('<a>').attr({
                                'href': ('static/' + page.id)
                            }).text(page.title)))
                    .append($('<td>')
                            .append($('<a>').attr({
                                'onClick': (page.status === 10 ? '' : 'deletePage(' + page.id + ')')
                            }).text((page.status === 10 ? 'Flagged For Deletion' : 'Flag For Deletion'))))
                    .append($('<td>')
                            .append($('<a>').attr({
                                'data-toggle': 'modal',
                                'data-target': '#page-edit-modal',
                                'data-page-id': page.id
                            }).text('Edit'))))
        });
    }
}

function fillDeleteTable(data, status) {
    clearTable('#deletedPosts');
    $.each(data, function (index, post) {

        if (post.status === 10) {
            var datePosted = new Date(post.datePosted).toLocaleDateString();
            if (post.dateScheduled === null) {
                var dateScheduled = null;
            } else {
                var dateScheduled = new Date(post.dateScheduled).toLocaleString();
            }

            $('#deletedPosts').append($('<tr>').attr({'class': (post.status === 10 ? 'pendingDelete' : ' ')})
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
                            .attr({
                                'onClick': 'undelete(' + post.id + ')'
                            })
                            .text('Undelete')
                            ))
                    .append($('<td>').append($('<a>')
                            //<a data-toggle="modal" data-target="#post-edit-modal" data-post-id="0">Edit</a
                            .attr({
                                'data-toggle': 'modal',
                                'data-target': '#post-edit-modal',
                                'data-post-id': post.id
                            })
                            .text('Edit')
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
        fillDeleteTable(data, status);
    });
}

function loadAllPages() {
    $.ajax({
        url: "pages"
    }).done(function (data) {
        fillAllPageTable(data, status);
    });
}


function clearTable(table) {
    $(table).empty();
}

function clearAllPageTable() {
    $('#allPagesAdmin').empty();
    $('#allPagesEmployee').empty();
}

function valueChanged()
{
    if ($('#post-scheduled').is(":checked"))
        $("#new-post-schedule").show();
    else
        $("#new-post-schedule").hide();
}

function addPost() {
    var finalTags = $('#extractedTags').val();
    var finalArray = (finalTags.match(/#(\w+)/g));
    var postTitle = $("#post-title").val();
    var postContent = tinymce.get('new-post-content').getContent();

    if ($('#post-scheduled').is(":checked")) {
        document.getElementById("post-date").stepUp(new Date($("#post-date").val()).getTimezoneOffset());
        var postDate = new Date($("#post-date").val());
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
            status: -1,
            tags: finalArray
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

function editPage() {
    var pageTitle = $("#edit-page-title").val();
    var pageId = $("#edit-page-id").val();
    var pageStatus = $("#edit-page-status").val();
    var pageLayout = $("#edit-page-layout").val();
    var pageContent1 = tinymce.get('edit-page-content1').getContent();
    var pageContent2 = tinymce.get('edit-page-content2').getContent();
    var pageContent3 = tinymce.get('edit-page-content3').getContent();

    $.ajax({
        url: 'staticpage/' + pageId,
        type: 'PUT',
        headers: {
            'Content-Type': 'application/json'
        },
        data: JSON.stringify({
            title: pageTitle,
            content1: pageContent1,
            content2: pageContent2,
            content3: pageContent3,
            status: pageStatus,
            layout: pageLayout,
            id: pageId
        })
    }).done(function (data) {
        $("#edit-modal-close-button").click();
        loadAllPages();
        alert("success!");
    });
}

function savePost() {
    var finalTags = $('#extractedTags').val();
    var finalArray = (finalTags.match(/#(\w+)/g));
    var postTitle = $("#post-title").val();
    if ($('#post-scheduled').is(":checked")) {
        document.getElementById("post-date").stepUp(new Date($("#post-date").val()).getTimezoneOffset());
        var postDate = new Date($("#post-date").val());
    } else {
        var postDate;
    }
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
            status: 9,
            tags: finalArray
        })
    }).done(function (data) { //success is deprecated, were supposed to use done now
        alert("success!");
        clearPost();
        loadAllPosts();
    });
}


function editPost() {
    var postTitle = $("#edit-post-title").val();
    var postDate = $("edit-post-date").val();
    if ($('#edit-post-scheduled').is(":checked")) {
        document.getElementById("edit-post-date").stepUp(new Date($("#edit-post-date").val()).getTimezoneOffset());
        var postSched = new Date($("#edit-post-date").val());
    } else {
        var postSched;
    }
    var postContent = tinymce.get('edit-post-content').getContent();
    var postId = $("#edit-post-id").val();
    var postAuthor = $("#edit-post-author").text();
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
            dateScheduled: postSched,
            id: postId
        })
    }).done(function (data) { //success is deprecated, were supposed to use done now
        alert("success!");
        clearPost();
        loadAllPosts();
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
        if (post.dateScheduled !== null) {
            $('#edit-post-scheduled').prop("checked", true);
        }
        $('#post-edit-modal .modal-title').text(post.title);
        $('#edit-post-author').text(post.author);
        $('#edit-post-date').val(new Date(post.dateScheduled).toLocaleString());
        $('#edit-post-id').val(post.id);
        $('#edit-post-status').val(post.status);
        $('#edit-post-title').val(post.title);
        $('#edit-post-date').val(post.datePosted);
        tinymce.activeEditor.setContent(post.content);
    });
}

function fillEditPageModal(pageId) {
    $.ajax({
        type: 'GET',
        url: 'page/' + pageId,
        headers: {
            'Accept': 'application/json'
        }
    }).done(function (page) {
        $('#page-edit-modal .modal-title').text(page.title);
        $('#edit-page-id').val(page.id);
        $('#edit-page-layout').val(page.layout);
        $('#edit-page-status').val(page.status);
        $('#edit-page-title').val(page.title);
        setNumberOfTinyMceEdit();
        tinymce.get('edit-page-content1').setContent(page.content1);
        tinymce.get('edit-page-content2').setContent(page.content2);
        tinymce.get('edit-page-content3').setContent(page.content3);
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
        $('#preview-post-author').text(post.author + " - " + (new Date(post.datePosted).toLocaleString()));
        $('#preview-post-title').text(post.title);
    });
}


function extractTags() {

    var postContent = tinymce.get('new-post-content').getContent();

    var hashArray = (postContent.match(/#(\w+)/g));

    $('#extractedTags').val(hashArray);


    // fill Edit Modal 
}

function storeTags() {

    var finalTags = $('#extractedTags').val();

    var finalArray = (finalTags.match(/#(\w+)/g));


    $('#extractedTags').text(finalArray);

}

function displayTagLinks(postId) {
    $.ajax({
        type: 'GET',
        url: 'post/' + postId,
        headers: {
            'Accept': 'application/json'
        }
    }).done(function (post) {

        // post.tags is an array of tags

        $.each(post.tags, function (index, x) {
            $('#tagLink').append($('<td>')).append($('<a>'))
                    .attr({
                        'onClick': ('searchPostsByTag(' + x + ')').text("inactiveLink")
                    });

        });
    });
}
function searchPostsByTag(tag) {
    $.ajax({
        type: 'GET',
        url: 'tag/' + tag,
        headers: {
            'Accept': 'application/json'
        }
    }).done(function (posts) {
        alert("This function is complete.");
    });
}



function uploadImages(blobInfo, success, failure) {
    $.ajax({
        url: 'uploadFile',
        type: 'POST',
        headers: {
            'Accept': 'application/json',
            'Content-Type': 'multipart/formdata'
        },
        'dataType': 'formdata',
        data: "fd" 
   });
    
//    tinymce.activeEditor.uploadImages(function (success) {
//        $.post('uploadFile', tinymce.activeEditor.getContent()).done(function () {
//            console.log("Uploaded images and posted content as an ajax request.");
//        });
//    });
}
