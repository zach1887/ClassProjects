<!--
    Just using this page to test edit functionality, I'll integrate it into the
    admin page later.
                    -Dan
-->
<%@ include file="template/header.jsp" %>
    <body id="mypage">
        
        <div class="container-fluid">
        <%@ include file="template/navbar.jsp" %>
        
            <div class="row col-md-8">
                <form id="edit-post-form" class="test">
                    <div class="form-group row col-md-12">
                        <input type="hidden" id="edit-post-id" value="${id}">
                        <input type="hidden" id="edit-post-author" value="${author}">
                        <input type="hidden" id="edit-post-status" value="${status}">
                        <label for="edit-post-title">Title:</label>
                        <input type="text" class="form-control clear-form" id="edit-post-title" name="editPostTitle" value="${title}">
                    </div>
                    <div class="form-group row col-md-3">
                        <label for="edit-post-date">Date:</label>
                        <input type="Date" class="form-control clear-form" id="edit-post-date" name="editPostDate" value="${datePosted}">
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
            </div>
            
            <div class="row col-lg-12 text-center dim-text myfooter">
                ©2016 lvl2
            </div>
            
        </div>
        
        <script type='text/javascript' src="${pageContext.request.contextPath}/js/admin.js" defer='defer'></script>
        <script type='text/javascript' src="http://cdn.tinymce.com/4/tinymce.min.js"></script>
        <script>tinymce.init({selector: 'textarea'});</script>
        <%@ include file="template/footer.jsp" %>
    </body>
</html>
