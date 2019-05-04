<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <!-- FONT AWESOME ( Icons ) -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
        integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <!-- Style css -->
    <link rel="stylesheet" href="${contextPath}/resources/css/login.css">
    <title>Login Page</title>
</head>


<body>
    <!-- HEADER -->

    <header class="navbar navbar-expand-lg navbar-dark bg-success fixed-top shadow" id="navbartop">
            <a class="navbar-brand" href="#Home">Pizza Margherita</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown"
                aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-left" id="navbarNavDropdown">
                <ul class="navbar-nav">
                    <li class="nav-item">
                          <a class="nav-link active" href="${contextPath}/home">Home </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${contextPath}/menu">Menu</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#Contact">Contact</a>
                    </li>
                </ul>
            </div>
          
            <div class="collapse navbar-collapse justify-content-end">
                <ul class="navbar-nav">
             <!-- CART -->
                    <li class="nav-item">
                        <a class="nav-link mr-3" href="#Cart">
                                <div id="ex4">
                                        <span class="p1 fa-stack fa-1x has-badge" data-count="4">
                                          <!-- <i class="p2 fa fa-circle fa-stack-2x"></i> -->
                                          <i class="p3 fa fa-shopping-cart fa-stack-1x xfa-inverse" data-count="4"></i>
                                        </span>
                                      </div>
                              </a>
                    </li>
             <!-- LOGIN BUTTON -->
                    <li class="nav-item">
                        <a href="login.html" id="login_btn" class="btn btn-outline-light my-2 my-sm-0">
                            Login
                        </a>
                    </li>
                </ul>
    
            </div>
        </header>

    <div id="mainWrapper">
        <div class="login-container">
           
            <div class="login-card">
               
                <div class="login-form">
                    <c:url var="loginUrl" value="/login" />
                    <form action="${loginUrl}" method="post" class="form-horizontal">
                          <h2 class="form-signin-heading">Log-in</h2>
                        <c:if test="${param.error != null}">
								<div class="alert alert-danger">
									<p>Invalid username and password.</p>
								</div>
							</c:if>
							<c:if test="${param.logout != null}">
								<div class="alert alert-success">
									<p>You have been logged out successfully.</p>
								</div>
							</c:if>
                            <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input type="hidden" name="${_csrf.parameterName}"  value="${_csrf.token}" />
                                    <input name="username" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                  </div>
                                  <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input name="password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                  </div>
                                  <div>
                                    <button type="submit" class="btn btn-success btn-block">Submit</button>
                                  </div>

                                  <h6 class="text-center mt-2"><a href="${contextPath}/registration">Create an account</a></h6>
                    </form>
                </div>
            </div>
        </div>
    </div>


 <footer id="Contact" class="py-4 mt-1 bg-dark text-white-50">
        <div class="container text-center">
          <small>Copyright &copy; Your Website</small>
        </div>
      </footer>


        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous">
        </script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
            integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous">
        </script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
            integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous">
        </script>

        <script src="${contextPath}/resources/js/login.js"></script>
</body>

</html>