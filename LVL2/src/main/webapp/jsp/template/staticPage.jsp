<%-- 
    Document   : staticPage
    Created on : Nov 28, 2016, 1:16:18 AM
    Author     : Dan Whitlow
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
    <head>
        <title>${title}</title>
        <%@ include file="header.jsp" %>
    </head>
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
    </body>
</html>