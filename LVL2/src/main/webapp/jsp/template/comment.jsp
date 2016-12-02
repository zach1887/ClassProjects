<%@ include file="header.jsp" %>
<body id="mypage">

    <div class="container-fluid">
        <%@ include file="navbar.jsp" %>
        <div class="tab-pane fade in active" id="b1">
            <br>
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
                    <sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_EMPLOYEE') ">
                        <button id="new-post-button" class="btn btn-primary">Post</button>
                    </sec:authorize>
                    <sec:authorize access="!hasAnyRole('ROLE_ADMIN','ROLE_EMPLOYEE') ">
                        <button id="new-post-button" class="btn btn-primary">Submit</button>
                    </sec:authorize>
                </div>
            </form>
        </div>

        <div class="row col-lg-12 text-center dim-text myfooter">
            ©2016 lvl2
        </div>
    </div>
        
     <script type='text/javascript' src="http://cdn.tinymce.com/4/tinymce.min.js"></script>   
    <script>tinymce.init({selector: 'textarea'});</script>
    <%@ include file="footer.jsp" %>
    <script>$("#nav-other").addClass("active")</script>
</body>
</html>
