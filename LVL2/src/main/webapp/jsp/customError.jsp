<%@ include file="template/header.jsp" %>

    <body id="mypage">
        <div class="container-fluid">

            <%@ include file="template/navbar.jsp" %>

            <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-8">
                    <h1>Something went wrong!</h1>
                    <h2>
                        ${errorMessage}
                    </h2>
                </div>
                <div class="col-md-2"></div>
            </div>
            <hr>
            <div class="row col-lg-12 text-center dim-text myfooter">
                ©2016 lvl2
            </div>
        </div>

        <%@ include file="template/footer.jsp" %>
    </body>
</html>