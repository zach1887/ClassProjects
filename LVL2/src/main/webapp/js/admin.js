//register events
$(document).ready(function () {

    $(".clear-button").click(function(){
        event.preventDefault();
        $('#new-post-form input').val("");
        tinymce.get('new-post-content').setContent("");
    });

    $(".nav-pills a").click(function(){
        event.preventDefault();
        $(this).tab('show');
    });
    
    $("#new-post-button").click(function(event){
        event.preventDefault();
        addPost();
    });
    
    $("#edit-post-button").click(function(event){
        event.preventDefault();
        editPost();
    });
    
    $("#delete").click(function(event){
        deletePost();
    });
    
});


//functions

function addPost(){
    var postTitle = $("#post-title").val();
    var postDate = $("#post-date").val();
    var postContent = tinymce.get('new-post-content').getContent();
    
    $.ajax({
        url : 'blog',
        type : 'POST',
        headers : {
            'Accept' : 'application/json',
            'Content-Type' : 'application/json'
        },
        'dataType' : 'json',
        data : JSON.stringify({
            title : postTitle,
            datePosted : postDate,
            content : postContent,
            author : "Brumpo Tungus",
            status : 1
        })
    }).done(function(data){ //success is depreciated, were supposed to use done now
        alert("success!");
    });
}

function editPost(){
    var postTitle = $("#edit-post-title").val();
    var postDate = $("#edit-post-date").val();
    var postContent = tinymce.get('edit-post-content').getContent();
    var postId = $("#edit-post-id").val();
    var postAuthor = $("#edit-post-author").val();
    var postStatus = $("#edit-post-status").val();
    
    $.ajax({
        url : 'edit',
        type : 'POST',
        headers : {
            'Accept' : 'application/json',
            'Content-Type' : 'application/json'
        },
        'dataType' : 'json',
        data : JSON.stringify({
            title : postTitle,
            datePosted : postDate,
            content : postContent,
            author : postAuthor,
            status : postStatus,
            id : postId
        })
    }).done(function(data){ //success is depreciated, were supposed to use done now
        alert("success!");
    });
}

function deletePost(){
    var postId = $("#delete").data("postId");
    
    $.ajax({
        url : 'blog/' + postId,
        type : 'DELETE'
    }).done(function(data){ //success is depreciated, were supposed to use done now
        location.reload();
    });
}