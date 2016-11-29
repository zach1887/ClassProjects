<%-- 
    Document   : staticPage
    Created on : Nov 28, 2016, 1:16:18 AM
    Author     : Dan Whitlow
--%>

<%@ include file="header.jsp" %>
    <body id="mypage">
        <div class="container-fluid">
            <%@ include file="navbar.jsp" %>
            <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-8" id="content-area">
                    ${content}
                </div>
                <div class="col-md-2"></div>
            </div>

            <hr>
            <div class="row col-lg-12 text-center dim-text myfooter">
                ©2016 lvl2
            </div>
        </div>

        <%@ include file="footer.jsp" %>
        <script>$("#nav-static").addClass("active");</script>
    </body>
</html>