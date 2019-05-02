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

        <!-- LOAD BOOTSTRAP 4 ( Building our interface and page layout -quickly & easily- ) -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <!-- FONT AWESOME ( Icons ) -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
              integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
        <!-- Style css -->
        <link rel="stylesheet" href="css/style.css">
        <link href="${contextPath}/resources/css/home.css" rel="stylesheet">
        <title>Home Page</title>
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
                    <a class="nav-link active" href="Home.html">Home </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="menu.jsp">Menu</a>
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
                    <a href="${contextPath}/login" id="login_btn" class="btn btn-outline-light my-2 my-sm-0">
                        Login
                    </a>
                </li>
            </ul>

        </div>
    </header>

    <div class="jumbotron jumbotron-fluid mt-5 mb-0">
        <div class="container text-muted p-3">
            <p class="display-4 text-center font-weight-bolder bg-white rounded-pill shadow mt-2">Pizza Margherita</p>
         
        </div>
    </div>
    <section data-spy="scroll" data-target="#navbartop" data-offset="0">

        <!-- CAROUSEL -->

        <!--Carousel Wrapper-->
        <div id="carousel-example-1z" class="carousel slide carousel-fade conatainer shadow mt-1" data-ride="carousel">
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
                    <img class="d-block w-100" src="${contextPath}/resources/images/carousel1.jpeg" alt="First slide.">
                </div>
                <!--/First slide-->
                <!--Second slide-->
                <div class="carousel-item">
                    <img class="d-block w-100" src="${contextPath}/resources/images/carousel2.jpeg" alt="Second slide.">
                </div>
                <!--/Second slide-->
                <!--Third slide-->
                <div class="carousel-item">
                    <img class="d-block w-100" src="${contextPath}/resources/images/carousel3.jpeg" alt="Third slide.">
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


      

<!-- Contact Footer -->

        <div id="Contact">


        </div>

    </section>




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

    <script src="${contextPath}/resources/js/home.js"></script>

    </body>

</html>