
// <script> 

//register events
$(document).ready(function () {

    var postId = $("#postId").val();
    loadCommentsByPostId(postId);

    $(".nav-pills a").click(function () {
        event.preventDefault();
        $(this).tab('show');
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

    $("#clear-comment-button").click(function (event) {
        event.preventDefault();
        clearCommentForm();
    });
});


//functions
function clearCommentForm() {
    $('#new-comment-form input').val("");
    tinymce.get('new-comment-content').setContent("");
}
function clearPost() {
    $('#new-post-form input').val("");
    tinymce.get('new-post-content').setContent("");
}

function clearPage() {
    $('#new-static-page-form input').val("");
    tinymce.get('new-page-content').setContent("");
}


function addComment() {
    var displayName = $("#comment-displayName").val();
    var postId = $("#postId").val();
    var commentContent = tinymce.get('new-comment-content').getContent();

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
        clearCommentForm();
    });
}
function submitComment() {
    var displayName = $("#comment-displayName").val();
    var postId = $("#postId").val();
    var commentContent = tinymce.get('new-comment-content').getContent();

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
        clearCommentForm();
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
    var numOfComments = 0;
    $.each(data, function (index, comment) {
        if (comment.status == 5 || comment.status == 7) {  // only displays approved comments
            $('#blogComments').append($('<tr>')
                    .append($('<td>').text(comment.name))
                    .append($('<td>').text(comment.comment))
                    );
            numOfComments++;
        }
    });
    $('#numOfComments').text(numOfComments);
}


function pullTag() {

}

function assignTagId(tagName) {

}

function populateBridgeTable(postId) {

}
// </script> 
