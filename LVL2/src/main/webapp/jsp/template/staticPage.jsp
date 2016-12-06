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
            <c:if test="${layout==1}">
                <div class="col-md-8 col-md-offset-2" id="content-area">
                    ${content1}
                </div>
            </c:if>
            <c:if test="${layout==2}">
                <div class="col-md-6">
                    ${content1}
                </div>
                <div class="col-md-6" id="content-area">
                    ${content2}
                </div>
            </c:if>
            <c:if test="${layout==3}">
                <div class="col-md-4">
                    ${content1}
                </div>
                <div class="col-md-4" id="content-area">
                    ${content2}
                </div>
                <div class="col-md-4">
                    ${content3}
                </div>
            </c:if>
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