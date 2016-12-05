<%@ include file="template/header.jsp" %>
    <body id="mypage">
        <div class="container-fluid">

            <%@ include file="template/navbar.jsp" %>

            <!-- main row -->
            <div class="row">

                <!-- post area -->
                <div class="col-md-9" id="post-area">

                    <div class="row post">
                        <div class="col-md-12">
                            <h3>
                                <a href="blogWithComments/1" class="post-title">Recent Post 1 </a>
                            </h3>
                            <small class="dim-text">By: Brumpo Tungus</small>
                            <small class="pull-right dim-text">11/11/1111</small>
                            <br/>
                            <div class="post-content well">

                                Lorem ipsum dolor sit amet, <strong>consectetur adipiscing elit</strong>. Aliquam eget sapien sapien. Curabitur in metus urna. In hac habitasse platea dictumst. Phasellus eu sem sapien, sed <a href="#">#vestibulum</a> velit. Nam purus nibh, lacinia non faucibus et, pharetra in dolor. Sed iaculis posuere diam ut cursus. <em>Morbi commodo sodales nisi id sodales. Proin consectetur, nisi id <a href="#" class="tag">#commodo</a> imperdiet, metus nunc consequat lectus, id bibendum diam velit et dui.</em> Proin massa magna, vulputate nec bibendum nec, <a href="#" class="tag">#posuere</a> nec lacus. <small>Aliquam mi erat, aliquam vel luctus eu, pharetra quis elit. Nulla euismod ultrices massa, et feugiat ipsum consequat eu.</small>
                            </div>
                            <small class="dim-text">Comments(0)</small>
                            <small class="pull-right dim-text">Tags: <span class="tag"><a href="#">#vestibulum</a> <a href="#">#commodo</a> <a href="#">#posuere</a></span></small>
                        </div>
                    </div>

                    <div class="row post">
                        <div class="col-md-12">
                            <h3>
                                <a href="#" class="post-title">Lorem ipsum dolor sit amet.</a>
                            </h3>
                            <small class="dim-text">By: Brumpo Tungus</small>
                            <small class="pull-right dim-text">11/11/1111</small>
                            <br/>
                            <div class="post-content well">
                                Lorem ipsum dolor sit amet, <strong>consectetur adipiscing elit</strong>. Aliquam eget sapien sapien. Curabitur in metus urna. In hac habitasse platea dictumst. Phasellus eu sem sapien, sed <a href="#">#vestibulum</a> velit. Nam purus nibh, lacinia non faucibus et, pharetra in dolor. Sed iaculis posuere diam ut cursus. <em>Morbi commodo sodales nisi id sodales. Proin consectetur, nisi id <a href="#" class="tag">#commodo</a> imperdiet, metus nunc consequat lectus, id bibendum diam velit et dui.</em> Proin massa magna, vulputate nec bibendum nec, <a href="#" class="tag">#posuere</a> nec lacus. <small>Aliquam mi erat, aliquam vel luctus eu, pharetra quis elit. Nulla euismod ultrices massa, et feugiat ipsum consequat eu.</small>
                            </div>
                            <small class="dim-text">Comments(0)</small>
                            <small class="pull-right dim-text">Tags: <span class="tag"><a href="#">#vestibulum</a> <a href="#">#commodo</a> <a href="#">#posuere</a></span></small>
                        </div>
                    </div>

                    <div class="row post">
                        <div class="col-md-12">
                            <h3>
                                <a href="#" class="post-title">Lorem ipsum dolor sit amet.</a>
                            </h3>
                            <small class="dim-text">By: Brumpo Tungus</small>
                            <small class="pull-right dim-text">11/11/1111</small>
                            <br/>
                            <div class="post-content well">
                                Lorem ipsum dolor sit amet, <strong>consectetur adipiscing elit</strong>. Aliquam eget sapien sapien. Curabitur in metus urna. In hac habitasse platea dictumst. Phasellus eu sem sapien, sed <a href="#">#vestibulum</a> velit. Nam purus nibh, lacinia non faucibus et, pharetra in dolor. Sed iaculis posuere diam ut cursus. <em>Morbi commodo sodales nisi id sodales. Proin consectetur, nisi id <a href="#" class="tag">#commodo</a> imperdiet, metus nunc consequat lectus, id bibendum diam velit et dui.</em> Proin massa magna, vulputate nec bibendum nec, <a href="#" class="tag">#posuere</a> nec lacus. <small>Aliquam mi erat, aliquam vel luctus eu, pharetra quis elit. Nulla euismod ultrices massa, et feugiat ipsum consequat eu.</small>
                            </div>
                            <small class="dim-text">Comments(0)</small>
                            <small class="pull-right dim-text">Tags: <span class="tag"><a href="#">#vestibulum</a> <a href="#">#commodo</a> <a href="#">#posuere</a></span></small>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <!--<textarea></textarea>-->
                        </div>
                    </div>
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

        <%@ include file="template/footer.jsp" %>
    </body>
</html>

