<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    
    <title>Blag</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="css/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/theme.min.css" rel="stylesheet">
    <link href="css/custom.css" rel="stylesheet">

    <link href="https://fonts.googleapis.com/css?family=Share+Tech+Mono" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <!--<script src="js/ie-emulation-modes-warning.js"></script>-->

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body id="mypage">
    <div class="container-fluid">
      <div class="row">
        <nav class="navbar navbar-default navbar-fixed-top">
          <div class="navbar-header">
             
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
               <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
            </button> <a class="navbar-brand" href="${pageContext.request.contextPath}/">lvl2</a>
          </div>
          
          <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
              <li class="active">
                <a href="${pageContext.request.contextPath}/about">About Us</a>
              </li>
              <li>
                <a href="${pageContext.request.contextPath}/admin">Other Stuff</a>
              </li>
            </ul>

            <ul class="nav navbar-nav navbar-right">
              <li>
                <form class="navbar-form navbar-left" role="search">
                  <div class="form-group">
                    <input type="text" class="form-control" />
                  </div> 
                  <button type="submit" class="btn btn-default">
                    Search
                  </button>
                </form>
              </li>
              <li class="dropdown" style="margin-right: 10px">

                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Login<strong class="caret"></strong></a>
                
                <div class="dropdown-menu" id="login-dropdown">
                 <form class="form-signin">
                    <h2 class="form-signin-heading">Login</h2>
                    
                    <label for="inputEmail" class="sr-only">Email address</label>
                    <input type="email" id="inputEmail" class="form-control" placeholder="Email address" required autofocus>
                    
                    <label for="inputPassword" class="sr-only">Password</label>
                    <input type="password" id="inputPassword" class="form-control" placeholder="Password" required>
                    
                    <div class="checkbox">
                      <label>
                        <input type="checkbox" value="remember-me"> Remember me
                      </label>
                    </div>
                    
                    <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button> 
                  </form>
                </div>
              </li>

            </ul>

          </div>           
        </nav>
      </div>

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
    </div>
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>-->
    <script>window.jQuery || document.write('<script src="js/jquery-3.1.1.min.js"><\/script>')</script>
    <script src="js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="js/ie10-viewport-bug-workaround.js"></script>
  </body>

</html>
