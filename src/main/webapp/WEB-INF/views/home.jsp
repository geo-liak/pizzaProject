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
        <!-- LOAD JQUERY ( $.ajax, etc. ) -->
        <script src="https://code.jquery.com/jquery-3.4.0.min.js"
        integrity="sha256-BJeo0qm959uMBGb65z40ejJYGSgR7REI4+CW1fNKwOg=" crossorigin="anonymous"></script>
        <!-- POOPER -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
                integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous">
        </script>

        <!-- LOAD BOOTSTRAP 4 ( Building our interface and page layout -quickyl & easily- ) -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <!-- FONT AWESOME ( Icons ) -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
              integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
        <!-- Style css -->
        <link rel="stylesheet" href="css/style.css">
        <link href="${contextPath}/resources/css/common.css" rel="stylesheet">
        <title>Main Page</title>
    </head>


    <body>
        <!-- HEADER -->



        <header class="navbar navbar-expand-lg navbar-dark bg-success fixed-top shadow" id="navbartop">
            <a class="navbar-brand" href="#Home">Pizza Margherita</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown"
                    aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-end" id="navbarNavDropdown">
                <ul class="navbar-nav">
                    <li class="nav-item active">
                        <a class="nav-link" href="#Home">Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#Menu">Menu</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#Contact">Contact</a>
                    </li>
                    <!-- button for login popop up menu -->
                    <!-- Button trigger modal -->
                    <button id="login_btn" type="button" class="btn btn-outline-light my-2 my-sm-0" data-toggle="modal"
                            data-target="#loginModal">
                        Login
                    </button>
                </ul>
            </div>
        </header>
        <div class="jumbotron jumbotron-fluid mt-5 mb-0" >
            <div class="container text-muted p-3">
                <p class="display-4 text-center font-weight-bolder bg-white rounded-pill shadow">Pizza Margherita</p>
                <p class="lead text-center bg-white rounded-pill">This is a modified jumbotron that occupies the entire horizontal space of its
                    parent.</p>
            </div>
        </div>
        <section data-spy="scroll" data-target="#navbartop" data-offset="0">


            <!-- CAROUSEL -->

            <!--Carousel Wrapper-->
            <div id="carousel-example-1z" class="carousel slide carousel-fade" data-ride="carousel">
                <!--Indicators-->
                <ol class="carousel-indicators">
                    <li data-target="#carousel-example-1z" data-slide-to="0" class="active"></li>
                    <li data-target="#carousel-example-1z" data-slide-to="1"></li>
                    <li data-target="#carousel-example-1z" data-slide-to="2"></li>
                </ol>
                <!--/.Indicators-->
                <!--Slides-->
                <div class="carousel-inner" role="listbox">
                    <!--First slide-->
                    <div class="carousel-item active">
                        <img class="d-block w-100"
                             src="https://images.unsplash.com/photo-1534308983496-4fabb1a015ee?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1355&q=80"
                             alt="First slide. Photo by Alan Hardman on Unsplash">
                    </div>
                    <!--/First slide-->
                    <!--Second slide-->
                    <div class="carousel-item">
                        <img class="d-block w-100"
                             src="https://images.unsplash.com/photo-1528490060256-c345efae4442?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1334&q=80"
                             alt="Second slide">
                    </div>
                    <!--/Second slide-->
                    <!--Third slide-->
                    <div class="carousel-item">
                        <img class="d-block w-100"
                             src="https://images.unsplash.com/photo-1517686469429-8bdb88b9f907?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80"
                             alt="Third slide">
                    </div>
                    <!--/Third slide-->
                </div>
                <!--/.Slides-->
                <!--Controls-->
                <a class="carousel-control-prev" href="#carousel-example-1z" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carousel-example-1z" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
                <!--/.Controls-->
            </div>
            <!--/.Carousel Wrapper-->

            <!-- modals -->
            <!-- Trigger the modal with a button -->

            <!-- Modal id="loginModal" -->
            <div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content"> 

                        <ul class="nav nav-mytabs my-0 " id="myTab" role="tablist">
                            <li class="nav-item nav-item-login">
                                <a class="nav-link bg-success text-light active" id="login-tab" data-toggle="tab" href="#login" role="tab"
                                   aria-controls="login" aria-selected="true">Login</a>
                            </li>
                            <li class="nav-item nav-item-signup">
                                <a class="nav-link bg-success text-light" id="signup-tab" data-toggle="tab" href="#signup" role="tab"
                                   aria-controls="signup" aria-selected="false">Signup</a>
                            </li>
                        </ul>



                        <div class="tab-content mytab-content" id="myTabContent">
                            <div class="tab-pane fade show active" id="login" role="tabpanel" aria-labelledby="login-tab">

                                <!--                                <form id="login-form">
                                                                    <div class="form-group">
                                                                        <label for="exampleInputEmail1">Email address</label>
                                                                        <input type="email" class="form-control" id="exampleInputEmail1"
                                                                               aria-describedby="emailHelp" placeholder="Enter email">
                                                                        <small id="emailHelp" class="form-text text-muted">We'll never share your email with
                                                                            anyone else.</small>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label for="exampleInputPassword1">Password</label>
                                                                        <input type="password" class="form-control" id="exampleInputPassword1"
                                                                               placeholder="Password">
                                                                    </div>
                                                                    <button type="submit" class="btn btn-success">Submit</button>
                                                                    <a class="nav-link p-0" id="forgot-tab" data-toggle="tab" href="#forgot" role="tab"
                                                                       aria-controls="forgot" aria-selected="true">Forgot Password?</a>
                                                                </form>-->

                                <!--LOG IN FORM-->
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



                                <!--FORGET FORM-->
<!--                                <div id="forget-form">
                                    <form  class="form-inline">
                                        <div class="form-group mx-sm-3 mb-2">
                                            <label for="inputPassword2" class="sr-only">Password</label>
                                            <input type="password" class="form-control" id="inputPassword2"
                                                   placeholder="Enter Email">
                                        </div>

                                        <button type="submit" class="btn btn-success mb-2">Send</button>
                                    </form>

                                </div>-->
                            </div>
                                        
                                        

                            <!--SIGN UP-->
                            <div class="tab-pane fade" id="signup" role="tabpanel" aria-labelledby="signup-tab">
                                <form id="signup-form">
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">First Name</label>
                                        <input type="text" class="form-control" id="exampleInputPassword12"
                                               placeholder="Enter first name">
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Last Name</label>
                                        <input type="text" class="form-control" id="exampleInputPassword12f"
                                               placeholder="Enter last name">
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Email address</label>
                                        <input type="email" class="form-control" id="exampleInputEmail12"
                                               aria-describedby="emailHelp" placeholder="Enter email">
                                        <small id="emailHelp2" class="form-text text-muted">We'll never share your email with
                                            anyone else.</small>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Password</label>
                                        <input type="password" class="form-control" id="exampleInputPassword12s"
                                               placeholder="Enter Password">
                                    </div>
                                    <div class="form-group">
                                        <label for="inputPassword2">Re-enter Password</label>
                                        <input type="password" class="form-control" id="inputPassword3"
                                               placeholder="Repeat Password">
                                    </div>
                                    <button type="submit" class="btn btn-success">Submit</button>
                                </form>


                            </div>
                            <hr/>
                            <button type="button" class="btn btn-default float-right btn-outline-success my-2 my-sm-0" data-dismiss="modal">Close</button>
                        </div> 


                    </div>
                </div>
            </div>


            <div id="#Menu">


            </div>

            <div id="#Contact">


            </div>









        </section>




        <!-- FINAL IMPORTS -->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
                integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous">
        </script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
                integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous">
        </script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"
                integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous">
        </script>
        <script src="js/home.js"></script>
        <script type="text/javascript">
            
        $( document ).ready(function() {
            
            <c:if test="${not empty error}">
                $("#loginModal").modal();
            </c:if>
            
        });
        </script>
    </body>

</html>