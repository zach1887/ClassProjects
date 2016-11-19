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