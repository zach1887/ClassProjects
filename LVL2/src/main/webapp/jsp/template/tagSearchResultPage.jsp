<%@ include file="header.jsp" %>
    <body id="mypage">
        
        <div class="container-fluid">
        <%@ include file="navbar.jsp" %>
        
                                    <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>Post</th>
                                        <th>User</th>
                                        <th>Date Created</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody id="tagSearchResults">
                                </tbody>
                            </table>
            <div class="row col-lg-12 text-center dim-text myfooter">
                ©2016 lvl2
            </div>
        </div>

        <%@ include file="footer.jsp" %>
        <script>$("#nav-other").addClass("active")</script>
    </body>
</html>
