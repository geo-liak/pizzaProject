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

   <div class="jumbotron jumbotron-fluid mt-5 mb-0">
    <div class="container text-muted p-3">
      <p class="display-4 text-center font-weight-bolder bg-white rounded-pill shadow mt-2">Pizza Margherita</p>
      <!-- <p class="lead text-center bg-white rounded-pill">This is a modified jumbotron that occupies the entire horizontal space of its
                    parent.</p> -->
    </div>
  </div>
  <section data-spy="scroll" data-target="#navbartop" data-offset="0">
 <!-- MENU CARDS!!! -->
    <section id="Menu" class="container mt-2">


      <div class="row mx-2 align-items-center d-flex justify-content-center ">
        <div class="card p-2 m-2 col-3">
          <img class="card-img-top" src="/FrontEnd/PEPPERONI-PIZZAZZ.jpg" alt="Card image cap">
          <div class="card-body">
            <h5 class="card-title">Pepperoni Classic</h5>
            <p class="card-text">Some quick example text to build on the card title and make up the bulk of
              the card's content.</p>
            <div class="card-footer align-items-center d-flex justify-content-center">
              <div class="input-group"><span class="input-group-btn"><button type="button"
                    class="btn btn-danger">-</button></span><input id="colorful" class="form-control" type="text"
                  value="1" min="0" max="10" style="text-align: center;"><span class="input-group-btn"><button
                    type="button" class="btn btn-success">+</button></span></div>
            </div>
          </div>
        </div>



        <div class="card p-2 m-2 col-3">
          <img class="card-img-top" src="/FrontEnd/MARGHERITA.jpg" alt="Card image cap">
          <div class="card-body">
            <h5 class="card-title">Margherita</h5>
            <p class="card-text">Some quick example text to build on the card title and make up the bulk of
              the card's content.</p>
            <div class="card-footer align-items-center d-flex justify-content-center">
              <div class="input-group"><span class="input-group-btn"><button type="button"
                    class="btn btn-danger">-</button></span><input id="colorful" class="form-control rounded-0"
                  type="text" value="1" min="0" max="10" style="text-align: center;"><span
                  class="input-group-btn"><button type="button" class="btn btn-success">+</button></span></div>
            </div>
          </div>
        </div>

        <div class="card p-2 m-2 col-3">
          <img class="card-img-top" src="/FrontEnd/HAWAIIAN.jpg" alt="Card image cap">
          <div class="card-body">
            <h5 class="card-title">Hawaiian</h5>
            <p class="card-text">Some quick example text to build on the card title and make up the bulk of
              the card's content.</p>
            <div class="card-footer align-items-center d-flex justify-content-center">
              <div class="input-group"><span class="input-group-btn"><button type="button"
                    class="btn btn-danger">-</button></span><input id="colorful" class="form-control rounded-0"
                  type="text" value="1" min="0" max="10" style="text-align: center;"><span
                  class="input-group-btn"><button type="button" class="btn btn-success">+</button></span></div>
            </div>
          </div>
        </div>

        <div class="card p-2 m-2 col-3">
          <img class="card-img-top" src="..." alt="Card image cap">
          <div class="card-body">
            <h5 class="card-title">Card title</h5>
            <p class="card-text">Some quick example text to build on the card title and make up the bulk of
              the card's content.</p>
            <div class="card-footer align-items-center d-flex justify-content-center">
              <div class="input-group"><span class="input-group-btn"><button type="button"
                    class="btn btn-danger">-</button></span><input id="colorful" class="form-control rounded-0"
                  type="text" value="1" min="1" max="10" style="text-align: center;"><span
                  class="input-group-btn"><button type="button" class="btn btn-success">+</button></span></div>
            </div>
          </div>
        </div>

        <div class="card p-2 m-2 col-3">
          <img class="card-img-top" src="..." alt="Card image cap">
          <div class="card-body">
            <h5 class="card-title">Card title</h5>
            <p class="card-text">Some quick example text to build on the card title and make up the bulk of
              the card's content.</p>
            <div class="card-footer align-items-center d-flex justify-content-center">
              <div class="input-group"><span class="input-group-btn"><button type="button"
                    class="btn btn-danger">-</button></span><input id="colorful" class="form-control rounded-0"
                  type="text" value="1" min="1" max="10" style="text-align: center;"><span
                  class="input-group-btn"><button type="button" class="btn btn-success">+</button></span></div>
            </div>
          </div>
        </div>

        <div class="card p-2 m-2 col-3">
          <img class="card-img-top" src="..." alt="Card image cap">
          <div class="card-body">
            <h5 class="card-title">Card title</h5>
            <p class="card-text">Some quick example text to build on the card title and make up the bulk of
              the card's content.</p>
            <div class="card-footer align-items-center d-flex justify-content-center">
              <div class="input-group"><span class="input-group-btn"><button type="button"
                    class="btn btn-danger">-</button></span><input id="colorful" class="form-control rounded-0"
                  type="text" value="1" min="1" max="10" style="text-align: center;"><span
                  class="input-group-btn"><button type="button" class="btn btn-success">+</button></span></div>
            </div>
          </div>
        </div>

      </div>
      <button type="button" class="btn btn-success offset-9 col-2 my-3 m"><i class="fas fa-shopping-basket fa-spin"></i> Checkout</button>
    </section>
   
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

        <script src="${contextPath}/resources/js/menu.js"></script>
</body>

</html>