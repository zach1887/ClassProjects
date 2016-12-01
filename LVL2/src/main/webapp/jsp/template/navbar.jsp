<div class="row">
    <nav class="navbar navbar-default navbar-fixed-top">

        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button> 
            <a class="navbar-brand" href="${pageContext.request.contextPath}/">lvl2</a>                       
        </div>


        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li id="nav-about">
                    <a href="${pageContext.request.contextPath}/about">About Us</a>
                </li>
                <li id="nav-static">
                    <a href="${pageContext.request.contextPath}/static/1">Static Page From DB</a>
                </li>
                <sec:authorize access="hasRole('ROLE_ADMIN')">
                    <li id="nav-other">
                        <a href="${pageContext.request.contextPath}/admin">Admin</a>
                    </li>
                </sec:authorize> 
                <sec:authorize access="hasRole('ROLE_EMPLOYEE')">
                    <li id="nav-other">
                        <a href="${pageContext.request.contextPath}/admin">Employee Tools</a>
                    </li>
                </sec:authorize> 
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

                <sec:authorize access="isAnonymous()">
                    <li class="dropdown" style="margin-right: 10px">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Login<strong class="caret"></strong></a>

                        <div class="dropdown-menu" id="login-dropdown">
                            <form method="post" class="form-signin signin" action="${pageContext.request.contextPath}/j_spring_security_check"> 
                                <h2 class="form-signin-heading">Login</h2>

                                <label for="inputEmail" class="sr-only">Email address</label>
                                <input type="email" name="j_username" id="inputEmail" class="form-control" placeholder="Email address" required autofocus>

                                <label for="inputPassword" class="sr-only">Password</label>
                                <input type="password" name="j_password" id="inputPassword" class="form-control" placeholder="Password" required>

                                <button name="commit" class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button> 
                            </form>
                        </div>
                    </li>
                </sec:authorize>

                <sec:authorize access="isAuthenticated()">
                    <li style="margin-right: 10px">
                        <a href="${pageContext.request.contextPath}/j_spring_security_logout">Log Out</a>
                    </li> 
                </sec:authorize>

            </ul>

        </div>           
    </nav>
</div>