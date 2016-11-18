//register events
$(document).ready(function () {
    

    /*
    $("#search-button").click(function(event){
        // Stop the button, if it is trying to submit, from submitting
        event.preventDefault();
        searchPets(); // Then do OUR thing.
    });
    
    // Find the pet details modal, and register a "on show" event listener function
    $("#pet-details-modal").on('show.bs.modal', function(event){
        var element = $(event.relatedTarget); // Hey, go find the thing that made this event happen
        var petId = element.data('pet-id'); // found the a tag, now get the data-pet-id value
        petDetails(petId);
    });
    */

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