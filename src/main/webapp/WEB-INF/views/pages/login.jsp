<form id="login-form" method="POST" action="${contextPath}/login" class="form-signin">
    <h2 class="form-heading">Log in</h2>

    <div class="form-group ${error != null ? 'has-error' : ''}">
        <span>${message}</span>
        <label for="exampleInputEmail1">Email address</label>
        <input id="exampleInputEmail1" name="username" type="text" class="form-control" placeholder="Enter email"  aria-describedby="emailHelp" autofocus="true"/>


        <label for="exampleInputPassword1">Password</label>
        <input id="exampleInputPassword1" name="password" type="password" class="form-control" placeholder="Password"/>
        <span>${error}</span>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

        <button type="submit" class="btn btn-success">Submit</button>
        <!--                                        <a class="nav-link p-0" id="forgot-tab" data-toggle="tab" href="#forgot" role="tab"
                                                   aria-controls="forgot" aria-selected="true">Forgot Password?</a>-->
    </div>
</form>