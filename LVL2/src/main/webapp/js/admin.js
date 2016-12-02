
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

    $("#edit-post-button").click(function (event) {
        event.preventDefault();
        editPost();
    });

    $("#delete").click(function (event) {
        deletePost();
    });

});


//functions

function clearPost() {
    $('#new-post-form input').val("");
    tinymce.get('new-post-content').setContent("");
}

function clearPage() {
    $('#new-static-page-form input').val("");
    tinymce.get('new-page-content').setContent("");
}

function fillAllPostTable(data, status) {
    clearAllPostTable();
    $.each(data, function (index, post) {
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
                .append($('<td>').text(post.datePosted))
                .append($('<td>').append($('<a>')
                        .attr({
                            'href': 'edit/' + post.id
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

function loadAllPosts() {
    $.ajax({
        url: "posts"
    }).done(function (data) {
        fillAllPostTable(data, status);
    });
}

function clearAllPostTable() {
    $('#allPosts').empty();
}

function addPost() {
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

// </script> 
