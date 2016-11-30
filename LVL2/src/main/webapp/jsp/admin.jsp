<%@ include file="template/header.jsp" %>

<body id="mypage">
    <div class="container-fluid">

        <%@ include file="template/navbar.jsp" %>

        <!-- main row -->
        <div class="row">
            <div class="col-md-12">
                <sec:authorize access="hasRole('ROLE_ADMIN')">
                    <h2 class="text-center">Admin Panel</h2>
                </sec:authorize>
                <sec:authorize access="hasRole('ROLE_EMPLOYEE')">
                    <h2 class="text-center">Employee Panel</h2>
                </sec:authorize>
                <div id="exTab" class="container"> 
                    <ul  class="nav nav-pills">

                        <li class="active">
                            <a  href="#b1">New Post</a>
                        </li>
                        <!-- <li><a href="#b2">New Static Page</a> 
                        </li> -->
                        <li><a href="#b2">Pending Comments</a>
                        </li>
                        <li><a href="#b3">Pending Posts</a>
                        </li>
                        <li><a href="#b4">Scheduled Posts</a>
                        </li>
                        <li><a href="#b5">Deleted Posts</a>
                        </li>
                        <li><a href="#b6">All Posts</a>
                        </li>
                    </ul>

                    <div class="tab-content clearfix">


                        <div class="tab-pane fade in active" id="b1">
                            <br>
                            <form id="new-post-form" class="test">
                                <div class="form-group row col-md-12">
                                    <label for="post-title">Title:</label>
                                    <input type="text" class="form-control clear-form" id="post-title" name="newPostTitle">
                                </div>
                                <div class="form-group row col-md-3">
                                    <label for="post-date">Date:</label>
                                    <input type="Date" class="form-control clear-form" id="post-date" name="newPostDate">
                                </div>
                                <div class="form-group row col-md-12">
                                    <textarea class="form-control clear-form" id=new-post-content name="newPostContent"></textarea>
                                </div>
                                <div class="form-group pull-right row col-xs-4">
                                    <button class="btn btn-default clear-button">Clear</button>
                                    <button id="new-preview-button" class="btn btn-default" data-toggle="modal" data-target="#post-preview-modal" data-post-id="0">Preview</button>
                                    <button  id="new-save-button" class="btn btn-default">Save</button>
                                    <button id="new-post-button" class="btn btn-primary">Post</button>
                                </div>
                            </form>
                        </div>


                        <div class="tab-pane fade" id="b2">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>Post</th>
                                        <th>Username</th>
                                        <th>Comment</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><a data-toggle="modal" data-target="#post-preview-modal" data-post-id="0">Biden Forges Presidentâ€™s Signature On Executive Order To Make December Dokken History Month</a></td>
                                        <td>Karl</td>
                                        <td>If there were two guys on the moon, and one killed the other with a rock, how fucked up would that be?</td>
                                        <sec:authorize access="hasRole('ROLE_ADMIN')">
                                            <td class="pull-right"><a onclick="approveComment(0)">Approve</a>/<a onclick="deleteComment(0)">Deny</a></td>
                                        </sec:authorize>
                                    </tr>
                                    <tr>
                                        <td><a data-toggle="modal" data-target="#post-preview-modal" data-post-id="0">Introducing the Cinco-Fone</a></td>
                                        <td>Tim</td>
                                        <td>Great Job</td>
                                        <sec:authorize access="hasRole('ROLE_ADMIN')">
                                            <td class="pull-right"><a onclick="approveComment(0)">Approve</a>/<a onclick="deleteComment(0)">Deny</a></td>
                                        </sec:authorize>                                    </tr>
                                    <tr>
                                        <td><a data-toggle="modal" data-target="#post-preview-modal" data-post-id="0">FDA Approves New Pasta Shape</a></td>
                                        <td>Dooley</td>
                                        <td>Mamma-mia!</td>
                                        <sec:authorize access="hasRole('ROLE_ADMIN')">
                                            <td class="pull-right"><a onclick="approveComment(0)">Approve</a>/<a onclick="deleteComment(0)">Deny</a></td>
                                        </sec:authorize>                                    </tr>
                                </tbody>
                            </table>
                        </div>


                        <div class="tab-pane fade" id="b3">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>Post</th>
                                        <th>User</th>
                                        <th>Date</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><a data-toggle="modal" data-target="#post-preview-modal" data-post-id="0">Report: Holding Trophy Above Head Still Number One Celebration Technique</a></td>
                                        <td>Karl</td>
                                        <td>11/22/16</td>
                                        <sec:authorize access="hasRole('ROLE_ADMIN')">
                                            <td class="pull-right"><a href="#">Approve</a>/<a href="#">Deny</a>/<a data-toggle="modal" data-target="#post-edit-modal" data-post-id="0">Edit</a></td>
                                        </sec:authorize>
                                    </tr>
                                    <tr>
                                        <td><a data-toggle="modal" data-target="#post-preview-modal" data-post-id="0">America Chooses The Glass Ceiling: A Look Back At Hillary Clinton's Presidential Campaign</a></td>
                                        <td>Tim</td>
                                        <td>Immediate!</td>
                                        <sec:authorize access="hasRole('ROLE_ADMIN')">
                                            <td class="pull-right"><a href="#">Approve</a>/<a href="#">Deny</a>/<a data-toggle="modal" data-target="#post-edit-modal" data-post-id="0">Edit</a></td>
                                        </sec:authorize>
                                    </tr>
                                    <tr>
                                        <td><a data-toggle="modal" data-target="#post-preview-modal" data-post-id="0">New Report Finds Americans Most Interested In Science When Moon Looks Different Than Usual</a></td>
                                        <td>Dooley</td>
                                        <td>12/01/16</td>
                                        <sec:authorize access="hasRole('ROLE_ADMIN')">
                                            <td class="pull-right"><a href="#">Approve</a>/<a href="#">Deny</a>/<a data-toggle="modal" data-target="#post-edit-modal" data-post-id="0">Edit</a></td>
                                        </sec:authorize>
                                    </tr>
                                </tbody>
                            </table>
                        </div>


                        <div class="tab-pane fade" id="b4">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>Post</th>
                                        <th>User</th>
                                        <th>Date</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><a data-toggle="modal" data-target="#post-preview-modal" data-post-id="0">James Dyson Meets In Secret With Alien Ambassador To Receive Technology For New Hand Dryer</a></td>
                                        <td>Karl</td>
                                        <td>12/05/16</td>
                                        <sec:authorize access="hasRole('ROLE_ADMIN')">
                                            <td class="pull-right"><a href="#">Cancel</a>/<a data-toggle="modal" data-target="#post-edit-modal" data-post-id="0">Edit</a></td>
                                        </sec:authorize>
                                    </tr>
                                    <tr>
                                        <td><a data-toggle="modal" data-target="#post-preview-modal" data-post-id="0">Stanley Introduces New Sawed-Off Hot Glue Shotgun</a></td>
                                        <td>Tim</td>
                                        <td>11/19/16</td>
                                        <sec:authorize access="hasRole('ROLE_ADMIN')">
                                            <td class="pull-right"><a href="#">Cancel</a>/<a data-toggle="modal" data-target="#post-edit-modal" data-post-id="0">Edit</a></td>
                                        </sec:authorize>
                                    </tr>
                                    <tr>
                                        <td><a data-toggle="modal" data-target="#post-preview-modal" data-post-id="0">Man Grateful To Live In Society Where Mattress Disappears If Left On Sidewalk For A Couple Days</a></td>
                                        <td>Dooley</td>
                                        <td>1/08/17</td>
                                        <sec:authorize access="hasRole('ROLE_ADMIN')">
                                            <td class="pull-right"><a href="#">Cancel</a>/<a data-toggle="modal" data-target="#post-edit-modal" data-post-id="0">Edit</a></td>
                                        </sec:authorize>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                        <div class="tab-pane fade" id="b5">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>Post</th>
                                        <th>User</th>
                                        <th>Date</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><a data-toggle="modal" data-target="#post-preview-modal" data-post-id="0">Breitbart Traffic Down As Readers Now Getting Bulk Of News Analysis From Graffiti Scrawled Across Neighborhood</a></td>
                                        <td>Karl</td>
                                        <td>12/05/16</td>
                                        <sec:authorize access="hasRole('ROLE_ADMIN')">
                                            <td class="pull-right"><a href="#">Undelete</a>/<a data-toggle="modal" data-target="#post-edit-modal" data-post-id="0">Edit</a></td>
                                        </sec:authorize>
                                    </tr>
                                    <tr>
                                        <td><a data-toggle="modal" data-target="#post-preview-modal" data-post-id="0">God Weirded Out By Christian Who Loves Him After Only Month In Church</a></td>
                                        <td>Tim</td>
                                        <td>11/19/16</td>
                                        <sec:authorize access="hasRole('ROLE_ADMIN')">
                                            <td class="pull-right"><a href="#">Undelete</a>/<a data-toggle="modal" data-target="#post-edit-modal" data-post-id="0">Edit</a></td>
                                        </sec:authorize>
                                    </tr>
                                    <tr>
                                        <td><a data-toggle="modal" data-target="#post-preview-modal" data-post-id="0">Surgeon General Recommends Exercising Once Every Several Months During Flash Of Panic About Health</a></td>
                                        <td>Dooley</td>
                                        <td>1/08/17</td>
                                        <sec:authorize access="hasRole('ROLE_ADMIN')">
                                            <td class="pull-right"><a href="#">Undelete</a>/<a data-toggle="modal" data-target="#post-edit-modal" data-post-id="0">Edit</a></td>
                                        </sec:authorize>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                        <div class="tab-pane fade" id="b6">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>Post</th>
                                        <th>User</th>
                                        <th>Date</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody id="allPosts">
                                </tbody>
                            </table>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <!-- /main row -->
        <hr>
        <div class="row col-lg-12 text-center dim-text myfooter">
            ©2016 lvl2
        </div>
    </div>


    <!-- Preivew Modal -->
    <div id="post-preview-modal" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Post Ttitle</h4>
                    <div class="dim-text">Author - 11/11/1111</div>
                </div>
                <div class="modal-body">
                    <p>Lorem ipsum dolor sit amet, <strong>consectetur adipiscing elit</strong>. Aliquam eget sapien sapien. Curabitur in metus urna. In hac habitasse platea dictumst. Phasellus eu sem sapien, sed <a href="#">#vestibulum</a> velit. Nam purus nibh, lacinia non faucibus et, pharetra in dolor. Sed iaculis posuere diam ut cursus. <em>Morbi commodo sodales nisi id sodales. Proin consectetur, nisi id <a href="#" class="tag">#commodo</a> imperdiet, metus nunc consequat lectus, id bibendum diam velit et dui.</em> Proin massa magna, vulputate nec bibendum nec, <a href="#" class="tag">#posuere</a> nec lacus. <small>Aliquam mi erat, aliquam vel luctus eu, pharetra quis elit. Nulla euismod ultrices massa, et feugiat ipsum consequat eu.</small></p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>

        </div>
    </div>
    <!-- /preview modal -->

    <!-- Edit Modal -->
    <div id="post-edit-modal" class="modal fade" role="dialog">
        <div class="modal-dialog modal-lg">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Post Ttitle</h4>
                    <div class="dim-text">Author - 11/11/1111</div>
                </div>
                <div class="modal-body">
                    <form id="edit-form">
                        <div class="form-group">
                            <input type="hidden" id="edit-post-id" value="1">
                            <label for="post-title">Title:</label>
                            <input type="text" class="form-control clear-form" id="edit-post-title" placeholder="Title">
                        </div>
                        <div class="form-group">
                            <label for="post-date">Date:</label>
                            <input type="Date" class="form-control clear-form" id="edit-post-date">
                        </div>
                        <div class="form-group">
                            <textarea class="form-control" id=edit-post-content name="editPostContent"></textarea>
                        </div>
                        <div class="form-group pull-right">
                            <button class="btn btn-default clear-button">Clear</button>
                            <button class="btn btn-default">Preview</button>
                            <button class="btn btn-default">Save</button>
                            <button class="btn btn-primary">Post</button>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>

        </div>
    </div>

    <script type='text/javascript' src="http://cdn.tinymce.com/4/tinymce.min.js"></script>
    <script>tinymce.init({selector: 'textarea'});</script>

    <%@ include file="template/footer.jsp" %>
    <script>$("#nav-other").addClass("active")</script>
</body>
</html>
