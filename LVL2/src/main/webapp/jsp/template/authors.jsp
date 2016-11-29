<%@ include file="header.jsp" %>
<body id="mypage">
    <div class="container-fluid">

        <%@ include file="navbar.jsp" %>

        <!-- main row -->
        <div class="row">

            <!-- post area -->
            <div class="col-md-9" id="post-area">
                <c:forEach items="${authorPosts}" var="post">
                    <div class="row post">
                        <div class="col-md-12">
                            <h3>
                                <a href="#" class="post-title">${post.title}</a>
                            </h3>
                            <small class="dim-text"><a href="${pageContext.request.contextPath}/author/${post.author}">By: ${author}</a></small>
                            <small class="pull-right dim-text">${post.datePosted}</small>
                            <br/>
                            <div class="post-content well">
                                ${post.content}
                            </div>
                            <small class="dim-text">Comments(0)</small>
                            <small class="pull-right dim-text">Tags: <span class="tag"><a href="#">#vestibulum</a> <a href="#">#commodo</a> <a href="#">#posuere</a></span></small>
                        </div>
                    </div>
                </c:forEach>
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

    <%@ include file="footer.jsp" %>
</body>
</html>

