
<div id="page-edit-modal" class="modal fade" role="dialog">
    <div class="modal-dialog modal-lg">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Page Title</h4>
            </div>
            <div class="modal-body">
                <!--<form id="edit-form">-->
                <form id="edit-page-form" class="test">
                    <div class="form-group row col-md-12">
                        <input type="hidden" id="edit-page-id">
                        <input type="hidden" id="edit-page-status">
                        <label for="edit-page-title">Title:</label>
                        <input type="text" class="form-control clear-form" id="edit-page-title" name="editPageTitle" value="${title}">
                    </div>

                    <div class="form-group row col-md-12">
                        <label for="edit-page-layout">Layout:</label>
                        <select id="edit-page-layout">
                            <option value="1">One Column</option>
                            <option value="2">Two Columns</option>
                            <option value="3">Three Columns</option>
                        </select>
                    </div>
                    <div class="form-group row col-md-12" id="editColumn1">
                        <label for="edit-page-content-one">Column One:</label>
                        <textarea class="form-control clear-form" id=edit-page-content1 name="editPageContent1"></textarea>
                    </div>
                    <div class="form-group row col-md-12" id="editColumn2">
                        <label for="edit-page-content-two">Column Two:</label>
                        <textarea class="form-control clear-form" id=edit-page-content2 name="editPageContent2"></textarea>
                    </div>
                    <div class="form-group row col-md-12" id="editColumn3">
                        <label for="edit-page-content-three">Column Three:</label>
                        <textarea class="form-control clear-form" id=edit-page-content3 name="editPageContent3"></textarea>
                    </div>

                    
                    <div class="form-group pull-right row col-xs-6" id="buttons">
                        <button class="btn btn-default clear-button col-xs-2 clear-page-button-modal">Clear</button>
<!--                        <button class="btn btn-default col-xs-2">Preview</button>
                        <button class="btn btn-default col-xs-2">Save</button>-->
                        <button id="edit-page-button-modal" class="btn btn-primary col-xs-2">Post</button>
                    </div>
                </form>
                <!--</form>-->
            </div>
            <div class="modal-footer">
                <button type="button" id="edit-modal-close-button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>

    </div>
</div>