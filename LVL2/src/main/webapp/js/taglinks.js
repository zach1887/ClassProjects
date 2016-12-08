
// <script> 
//register events
$(document).ready(function () {
     postTags();

    $("#post-preview-modal").on('show.bs.modal', function (event) {
        var element = $(event.relatedTarget);
        var postId = element.data('post-id');
        fillPreviewModal(postId);
    });


});

function postTags(post) {

    $.ajax({
        url: 'post/' + post.postId + '/tags',
        type: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        'dataType': 'json',
        data: JSON.stringify({
            tags: post.tags
        })
    });
}

function createTagLinks(postId) {
    $.ajax({
        url: 'post/' + post.postId + '/tags',
        type: 'GET'
    }).done(function (data) {  // simply a list of tag numbers, maybe empty
        $.each(data, function (index, x) {
            var tagName = retreiveTagName(x);
            $('#blogLinks').append($('</a>').attr({
                'onClick': 'searchPostsByTag(' + x + ')'}).text(tagName))
        })
    });
}


function retreiveTagName(tagId) {
    $.ajax({
        url: 'tagName/' + tagId,
        type: 'GET'
    });
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
function searchPostsByTag(tagId) {
    $.ajax({
        type: 'GET',
        url: 'tag/' + tagId,
        headers: {
            'Accept': 'application/json'
        }
    }).done(function (data) {  // what to do when the data come back?

        clearTable('tagSearchResults');
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
    });
}



