<%-- 
    Document   : editModal
    Created on : Dec 2, 2016, 1:57:58 PM
    Author     : Dan Whitlow
--%>

<div id="post-edit-modal" class="modal fade" role="dialog">
    <div class="modal-dialog modal-lg">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Post Title</h4>
                <span id="edit-post-author" class="dim-text">Author</span> - <span id="post-edit-date" class="dim-text">Author</span>
            </div>
            <div class="modal-body">
                <form id="edit-form">
                    <form id="edit-post-form" class="test">
                        <div class="form-group row col-md-12">
                            <input type="hidden" id="edit-post-id">
                            <input type="hidden" id="edit-post-status">
                            <label for="edit-post-title">Title:</label>
                            <input type="text" class="form-control clear-form" id="edit-post-title" name="editPostTitle">
                        </div>
                        <div class="form-group row col-md-3">
                            <label for="edit-post-scheduled">Schedule Post</label>
                            <input type="checkbox" class="form-control clear-form" id="edit-post-scheduled" name="isPostScheduled">
                            <label for="edit-post-date">Date:</label>
                            <input type="datetime-local" class="form-control clear-form" id="edit-post-date" name="editPostDate">
                        </div>
                        <div class="form-group row col-md-12">
                            <textarea class="form-control clear-form" id="edit-post-content" name="editPostContent">
                                ${content}
                            </textarea>
                        </div>
                        <div class="form-group pull-right row col-xs-4">
                            <button class="btn btn-default clear-button">Clear</button>
                            <button class="btn btn-default">Preview</button>
                            <button class="btn btn-default">Save</button>
                            <button id="edit-post-button" class="btn btn-primary">Post</button>
                        </div>
                    </form>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>

    </div>
</div>
