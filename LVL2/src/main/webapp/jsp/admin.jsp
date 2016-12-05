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
                        <li><a href="#b2">New Static Page</a> 
                        </li> 
                        <li><a href="#b3">Static Pages</a> 
                        </li> 
                        <li><a href="#b4">Pending Comments</a>
                        </li>
                        <li><a href="#b5">Pending Posts</a>
                        </li>
                        <li><a href="#b6">Scheduled Posts</a>
                        </li>
                        <li><a href="#b7">Deleted Posts</a>
                        </li>
                        <li><a href="#b8">All Posts</a>
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

                        <div class="tab-pane fade in" id="b2">
                            <br>
                            <form id="new-static-page-form" class="test">
                                <div class="form-group row col-md-12">
                                    <label for="page-title">Title:</label>
                                    <input type="text" class="form-control clear-form" id="page-title" name="newPageTitle">
                                </div>
                                <div class="form-group row col-md-12">
                                    <label for="page-layout">Layout:</label>
                                    <select id="page-layout">
                                        <option value="1">One Column</option>
                                        <option value="2">Two Columns</option>
                                        <option value="3">Three Columns</option>
                                    </select>
                                </div>
                                <div class="form-group row col-md-12" id="column1">
                                    <label for="page-content-one">Column One:</label>
                                    <textarea class="form-control clear-form" id=new-page-content1 name="newPageContent1"></textarea>
                                </div>
                                <div class="form-group row col-md-12" id="column2">
                                    <label for="page-content-two">Column Two:</label>
                                    <textarea class="form-control clear-form" id=new-page-content2 name="newPageContent2"></textarea>
                                </div>
                                <div class="form-group row col-md-12" id="column3">
                                    <label for="page-content-three">Column Three:</label>
                                    <textarea class="form-control clear-form" id=new-page-content3 name="newPageContent3"></textarea>
                                </div>
                                <div class="form-group pull-right row col-xs-4">
                                    <button class="btn btn-default clear-page-button">Clear</button>
                                    <button id="new-preview-button" class="btn btn-default" data-toggle="modal" data-target="#post-preview-modal" data-post-id="0">Preview</button>
                                    <button id="new-save-button" class="btn btn-default">Save</button>
                                    <button id="new-static-page-button" class="btn btn-primary">Post</button>
                                </div>
                            </form>
                        </div>

                        <div class="tab-pane fade" id="b3">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>Title</th>
                                    </tr>
                                </thead>
                                <tbody id="allPages">
                                </tbody>
                            </table>
                        </div>

                        <div class="tab-pane fade" id="b4">
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

                        <div class="tab-pane fade" id="b7">
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

                        <div class="tab-pane fade" id="b8">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>Post</th>
                                        <th>User</th>
                                        <th>Date</th>
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

    <%@include file="template/previewModal.jsp" %>
    <%@include file="template/editModal.jsp" %>

    <script type='text/javascript' src="http://cdn.tinymce.com/4/tinymce.min.js"></script>
    <script>

                                                tinymce.init({
                                                    selector: 'textarea',
                                                    plugins: 'image'
                                                });

    </script>

    <%@ include file="template/footer.jsp" %>
    <script>$("#nav-other").addClass("active")</script>
</body>
</html>
