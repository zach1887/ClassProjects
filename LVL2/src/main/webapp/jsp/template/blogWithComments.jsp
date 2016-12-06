<%@ include file="header.jsp" %>
<body id="mypage">
    <div class="container-fluid">

        <%@ include file="navbar.jsp" %>

        <!-- main row -->
        <div class="row">

            <!-- post area -->
            <div class="col-md-9" id="post-area">

                <div class="row post">
                    <div class="col-md-12">
                        <h3>
                            <a href="#" class="post-title">${title}</a>
                            <input type="hidden" id="postId" value="${id}" />
                        </h3>
                        <small class="dim-text"><a href="${pageContext.request.contextPath}/author/${author}">By: ${author}</a></small>
                        <small class="pull-right dim-text">${datePosted}</small>
                        <br/>
                        <div class="post-content well">
                            ${content}
                        </div>
                        <small class="dim-text">Comments(<span id="numOfComments"> </span>)</small>
                        <small class="pull-right dim-text">Tags: <span class="tag"><a href="#">#vestibulum</a> <a href="#">#commodo</a> <a href="#">#posuere</a></span></small>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <!--<textarea></textarea>-->
                    </div>
                </div>

                <div>            
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>Display Name</th>
                                <th>Comment</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody id="blogComments">
                        </tbody>
                    </table>
                </div>

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

                            <button id="add-comment-button" class="btn btn-primary" type = "submit">Post</button>
                            <button id="clear-comment-button" class="btn btn-primary">Clear</button>
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

                            <button id="submit-comment-button" type = "submit" class="btn btn-primary">Submit</button>
                            <button id="clear-comment-button" class="btn btn-primary">Clear</button>
                        </div>
                    </form>
                </sec:authorize>   
            </div>
            <!-- /post area -->

            <!-- sidebar -->
            <div class="col-md-3" id="sidebar">

                <!-- post history -->
                <h2>Recent Posts</h2>
                <div class="row well" id="post-history">

                    <div>
                        <h3>October</h3>
                        <ul>
                            <li>
                                <a href="#">Post 1</a>
                            </li>
                            <li>
                                <a href="#">Post 2</a>
                            </li>
                            <li>
                                <a href="#">Post 3</a>
                            </li>
                        </ul>
                    </div>

                    <div>
                        <h3>November</h3>
                        <ul>
                            <li>
                                <a href="#">Post 1</a>
                            </li>
                            <li>
                                <a href="#">Post 2</a>
                            </li>
                            <li>
                                <a href="#">Post 3</a>
                            </li>
                        </ul>
                    </div>

                </div>
                <!-- /post history -->

                <!-- tags -->
                <div class="row" id="tag-cloud">
                    <h2>Tags</h2>
                    <div class="well">
                        <table class="table-condensed">
                            <tr>
                                <td><a href="#" class="tag">#tag1</a></td>
                                <td><a href="#" class="tag">#tag2</a></td>
                                <td><a href="#" class="tag">#tag3</a></td>
                                <td><a href="#" class="tag">#tag4</a></td>
                                <td><a href="#" class="tag">#tag5</a></td>
                            </tr>
                            <tr>
                                <td><a href="#" class="tag">#tag6</a></td>
                                <td><a href="#" class="tag">#tag7</a></td>
                                <td><a href="#" class="tag">#tag8</a></td>
                                <td><a href="#" class="tag">#tag9</a></td>
                                <td><a href="#" class="tag">#tag10</a></td>
                            </tr>
                        </table>
                    </div>
                </div>
                <!-- /tags -->
            </div> 
            <!-- /sidebar -->
        </div>
        <!-- /main row -->
        <hr>
        <div class="row col-lg-12 text-center dim-text myfooter">
            ©2016 lvl2
        </div>
    </div>

    <script type='text/javascript' src="http://cdn.tinymce.com/4/tinymce.min.js"></script>   
    <script>tinymce.init({selector: 'textarea'});</script>
    <script src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/admin_forComments.js"></script>
    <%@ include file="footer.jsp" %>
</body>
</html>

