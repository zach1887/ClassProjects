<%@ include file="header.jsp" %>
<body id="mypage">

    <div class="container-fluid">
        <%@ include file="navbar.jsp" %>
        <div class="tab-pane fade in active" id="b1">
            <br>
              <sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_EMPLOYEE') ">  
            <form id="new-comment-form" class="test">
                <div class="form-group row col-md-12">
                    <label for="comment-displayName">Display Name:</label>
                    <input type="text" class="form-control clear-form" id="comment-displayName" name="displayName">
                </div>
                <div class="form-group row col-md-12">
                    <label for="new-comment-content">Comment:</label>
                    <textarea class="form-control clear-form" id=new-comment-content name="newCommentContent"></textarea>
                </div>
                <div class="form-group pull-right row col-xs-4">     
                    
                        <button id="add-comment-button" class="btn btn-primary">Post</button>
                        <button id="cancel-comment-button" class="btn btn-primary">Cancel</button>
                </div>
            </form>
            </sec:authorize>
              <sec:authorize access="!hasAnyRole('ROLE_ADMIN','ROLE_EMPLOYEE') ">  
            <form id="new-comment-form" class="test">
                <div class="form-group row col-md-12">
                    <label for="comment-displayName">Display Name:</label>
                    <input type="text" class="form-control clear-form" id="comment-displayName" name="displayName">
                </div>
                <div class="form-group row col-md-12">
                    <label for="new-comment-content">Comment (comments must be approved before they are posted):</label>
                    <textarea class="form-control clear-form" id=new-comment-content name="newCommentContent"></textarea>
                </div>
                <div class="form-group pull-right row col-xs-4">     
                    
                        <button id="submit-comment-button" class="btn btn-primary">Submit</button>
                        <button id="cancel-comment-button" class="btn btn-primary">Cancel</button>
                </div>
            </form>
            </sec:authorize>
        </div>

        <div class="row col-lg-12 text-center dim-text myfooter">
            ©2016 lvl2
        </div>
    </div>
        
     <script type='text/javascript' src="http://cdn.tinymce.com/4/tinymce.min.js"></script>   
    <script>tinymce.init({selector: 'textarea'});</script>
        <script src="${pageContext.request.contextPath}/js/admin_forComments.js"></script>
    <%@ include file="footer.jsp" %>
    <script>$("#nav-other").addClass("active")</script>
</body>
</html>
