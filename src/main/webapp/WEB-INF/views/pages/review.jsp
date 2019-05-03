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
          <!--CART--> 
                <li class="nav-item">
                    <a class="nav-link mr-3" href="#Cart">
                            <div id="ex4">
                                    <span class="p1 fa-stack fa-1x has-badge" data-count="4">
                                     
                                      <i class="p3 fa fa-shopping-cart fa-stack-1x xfa-inverse" data-count="4"></i>
                                    </span>
                                  </div>
                          </a>
                </li>
          <!--LOGIN BUTTON--> 
                <li class="nav-item">
                    <a href="${contextPath}/login" id="login_btn" class="btn btn-outline-light my-2 my-sm-0">
                        Login
                    </a>
                </li>
            </ul>

        </div>
    </header>

   <!--Order Review-->

         
    <section class="container" id="order">
            <h2>Review Order</h2>
            <hr>
            <div class="row">
                <div class="col-8">
                        <table class="table  ">
                                <thead>
                                  <tr>
                                    <th scope="col">Product</th>
                                    <th scope="col"></th>
                                    <th scope="col">Qty</th>
                                    <th scope="col">Price</th>
                                    <th scope="col">Total</th>
                                  </tr>
                                </thead>
                                <tbody>
                                  <tr>
                                    <th scope="row" class="" >
                                           
                                            <img src="${contextPath}/resources/images/MARGHERITA.jpg" alt="pizza Margherita" class="img-thumbnail">
                                          
                                           
                                    </th>
                                    <td>  Pizza Margherita </td>
                                    <td>2</td>
                                    <td>5 &euro;</td>
                                    <td>10 &euro;</td>
                                  </tr>
                                  <tr>
                                        <th scope="row">
                                               
                                                <img src="${contextPath}/resources/images/HAWAIIAN.jpg" alt="pizza HAWAIIAN" class="img-thumbnail" >
                                               
                                        </th>
                                        <td>  Pizza Hawaiian </td>
                                        <td>2</td>
                                        <td>5 &euro;</td>
                                        <td>10 &euro;</td>
                                  </tr>
                                  <tr>
                                        <th scope="row">
                                               
                                                <img src="${contextPath}/resources/images/PEPPERONI-PIZZAZZ.jpg" alt="pizza Pepperoni" class="img-thumbnail"  >
                                               
                                        </th>
                                        <td>  Pizza Pepperoni </td>
                                        <td>2</td>
                                        <td>5 &euro;</td>
                                        <td>10 &euro;</td>
                                  </tr>
                                </tbody>
                              </table>
                </div>
                <!-- TOTAL COST -->
                <div class="col-4 border-rounded bg-white text-center">
                    <h3>Total Cost</h3>
                   <div style="font-size: 50pt">
                       30 &euro;
                   </div>
                </div>
            </div>
         <hr>
         <h2> Address </h2>
         <br>
            <select class="custom-select">
                <option selected>Please select an address:</option>
                <option value="Address 1">Patision 32, 11457, Athens</option>
                <option value="New">Add new...</option>
            </select>

         <hr>
         <h2> Payment </h2>
       
            <select class="custom-select">
                    <option selected>Please select payment:  </option>
                    <option value="PayPal">PayPal</option>
                    <option value="Card 1">Card 1 4323 9889 0099 8989 0000</option>
                    <option value="New">Add new...</option>
            </select>
       
<hr>
<!-- BUTTONS -->
<div class="text-center">
        <a class="btn btn-danger btn-lg" href="${contextPath}/menu" role="button">Back</a>

        <a class="btn btn-success btn-lg" href="${contextPath}/home" role="button">Place Order</a>
</div>



<!-- Contact Footer -->

   <footer id="Contact" class="py-4 mt-1 bg-dark text-white-50">
        <div class="container text-center">
          <small>Copyright &copy; Your Website</small>
        </div>
      </footer>

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