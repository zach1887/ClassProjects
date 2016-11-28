<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
    <head>
        <%@ include file="template/header.jsp" %>
    </head>
    <body id="mypage">
        <div class="container-fluid">

            <%@ include file="template/navbar.jsp" %>

            <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-8">
                    <h3>Disclaimer</h3>
                    <p>
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam malesuada dui vitae pretium ullamcorper. Vestibulum eu felis urna. Nulla eget orci dui. Morbi ligula libero, facilisis sed pellentesque vitae, tristique id lacus. Sed gravida arcu ut consectetur interdum. Aenean at diam et lorem efficitur fringilla. Donec venenatis egestas elit, et tristique urna hendrerit luctus. Integer eu nulla id orci fermentum aliquet sit amet id elit. Donec at urna ac dui tristique mattis sit amet quis libero. Curabitur elementum ligula risus, sed iaculis mi semper in. Sed gravida libero posuere turpis posuere consectetur. Cras rutrum vel ante in dapibus. Fusce at lorem lectus. Maecenas in nibh facilisis, consequat elit quis, aliquam tortor. Nunc volutpat dui quis neque vulputate feugiat.
                    </p>
                </div>
                <div class="col-md-2"></div>
            </div>

            <div class="row">
                <div class="col-md-4">
                    <h3>This is what we do!</h3>
                    <p>
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam malesuada dui vitae pretium ullamcorper. Vestibulum eu felis urna. Nulla eget orci dui. Morbi ligula libero, facilisis sed pellentesque vitae, tristique id lacus. Sed gravida arcu ut consectetur interdum. Aenean at diam et lorem efficitur fringilla.
                    </p>
                </div>
                <div class="col-md-4">
                    <h3>This is who we are</h3>
                    <p>
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam malesuada dui vitae pretium ullamcorper. Vestibulum eu felis urna. Nulla eget orci dui. Morbi ligula libero, facilisis sed pellentesque vitae, tristique id lacus. Sed gravida arcu ut consectetur interdum. Aenean at diam et lorem efficitur fringilla.
                    </p>
                </div>
                <div class="col-md-4">
                    <h3>Dobis PR!</h3>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam malesuada dui vitae pretium ullamcorper. Vestibulum eu felis urna. Nulla eget orci dui. Morbi ligula libero, facilisis sed pellentesque vitae, tristique id lacus. Sed gravida arcu ut consectetur interdum. Aenean at diam et lorem efficitur fringilla.</p>
                </div>
            </div>
            <hr>
            <div class="row col-lg-12 text-center dim-text myfooter">
                ©2016 lvl2
            </div>
        </div>

        <%@ include file="template/footer.jsp" %>
    </body>
</html>