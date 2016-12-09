
// <script> 
//register events
$(document).ready(function () {

    $("#post-preview-modal").on('show.bs.modal', function (event) {
        var element = $(event.relatedTarget);
        var postId = element.data('post-id');
        fillPreviewModal(postId);
    });

});


    function clearTable(table) {
        $(table).empty();
    }
function createTagLinks(postId) {
    $.ajax({
        url: '/LVL2/post/' + postId + '/tags',
        type: 'GET'
    }).done(function (data) {
        $.each(data, function (index, x) {
            $.ajax({
                url: '/LVL2/tagName/' + x,
                type: 'GET'
            }).done(function (y) {
                $('#tagLink').append($('<a>').attr({'onClick': 'searchPostsByTag(' + x + ')'}).text(y + "  "));
            });

        });
    });
}

//// simply a list of tag numbers, maybe empty
//            $.ajax({
//                url: '/LVL2/tagName/' + x,
//                type: 'GET'
//            }).done(function (y) {
//            $('#tagLink').append($('</a>').attr({
//                'onClick': 'searchPostsByTag(' + x + ')'}).text(y));
//        });

//
function retreiveTagName(tagId) {
    $.ajax({
        url: '/LVL2/tagName/' + tagId,
        type: 'GET',
    });
}


//function displayTagLinks(postId) {
//    $.ajax({
//        type: 'GET',
//        url: '/LVL2/post/' + postId,
//        headers: {
//            'Accept': 'application/json'
//        }
//    }).done(function (post) {
//
//        // post.tags is an array of tags
//        $('#tagLink').append(
//                $.each(post.tags, function (index, x) {
//                    $('#tagLink').append($('<td>')).append($('<a>'))
//                            .attr({
//                                'onClick': ('searchPostsByTag(' + x + ')').text(tagName)
//                            });
//    });
//}
function searchPostsByTag(tagId) {
    $.ajax({
        type: 'GET',
        url: '/LVL2/tags/' + tagId,
        headers: {
            'Accept': 'application/json'
        }
    }).done(function (data) {  // what to do when the data come back?

        clearTable('#tagSearchResults');
        $.each(data, function (index, post) {
            var datePosted = new Date(post.datePosted).toLocaleDateString();
            if (post.dateScheduled === null) {
                var dateScheduled = null;
            } else {
                var dateScheduled = new Date(post.dateScheduled).toLocaleString();
            }

            $('#tagSearchResults').append($('<tr>')
                    .append($('<td>').append($('<a>')
                            .attr({
                                'data-post-id': post.id,
                                'data-toggle': 'modal',
                                'data-target': '#post-preview-modal'
                            })
                            .text(post.title)
                            ))
                    .append($('<td>').text(post.author))
                    .append($('<td>').text(datePosted)))
        });

    }).done(function (data) {
        $.ajax({
            type: 'GET',
            url: '/LVL2/tagSearch/' + tagId
        });
    });
}

function fillPreviewModal(postId) {
    $.ajax({
        type: 'GET',
        url: '/LVL2/post/' + postId,
        headers: {
            'Accept': 'application/json'
        }
    }).done(function (post) {
        $('#preview-post-content').html(post.content);
        $('#preview-post-author').text(post.author + " - " + (new Date(post.datePosted).toLocaleString()));
        $('#preview-post-title').text(post.title);
    });
}



