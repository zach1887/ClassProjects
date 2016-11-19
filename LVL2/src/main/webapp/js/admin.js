//register events
$(document).ready(function () {

    $(".clear-button").click(function(){
        event.preventDefault();
        $(this).parent().parent().find("input").val("");
        tinymce.get($(this).parent().parent().find("textarea").attr('id')).setContent('');
    });

    $(".nav-pills a").click(function(){
        event.preventDefault();
        $(this).tab('show');
    });

    
});