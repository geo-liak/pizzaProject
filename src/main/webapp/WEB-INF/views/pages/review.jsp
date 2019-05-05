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
    <%@include file = "/resources/jsp/header.jsp"  %>

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
          <!-- ADDRESS -->
        <h2> Address </h2>

        <!-- DROPDOWN MENU -->
        <select class="custom-select mb-4" >
            <option selected>Please select an address:</option>
            <option value="Address 1">Patision 32, 11457, Athens</option>
        </select>

        Add new: <input type="checkbox" id="myCheck">
        <!-- NEW ADDRESS FORM -->
        <div class="row d-flex justify-content-center">
            <aside class="col-sm-8 ">
                <article class="card mt-3 border-0 shadow">
                    <div class="card-body p-5" id="newAddForm">
                        <form>
                            <h3>Add new address</h3>
                            <div class="form-row">
                                <div class="form-group col-md-12">
                                    <label for="inputAddress">Name</label>
                                    <input type="text" class="form-control" id="name" placeholder="Home address">
                                </div>

                            </div>
                            <div class="form-row">
                                <div class="form-group col-9">
                                    <label for="inputAddress">Street</label>
                                    <input type="text" class="form-control" id="street" placeholder="Street">
                                </div>
                                <div class="form-group col-3">
                                    <label for="inputAddress2">Number</label>
                                    <input type="text" class="form-control" id="number" placeholder="no.">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-3">
                                    <label for="inputCity">Floor</label>
                                    <input type="text" class="form-control" id="floor">
                                </div>

                                <div class="form-group col-md-3">
                                    <label for="inputZip">Post Code</label>
                                    <input type="text" class="form-control" id="postcode">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="inputCity">Notes</label>
                                    <input type="text" class="form-control" id="notes">
                                </div>
                            </div>
                            <button type="submit" class="btn btn-secondary">Add new Address</button>
                        </form>
                    </div>
                </article>
            </aside>
        </div>
        <hr>
        <!-- PAYMENT -->
        <h2> Payment </h2>
        <!-- DROP DOWN MENU -->
        <select class="custom-select mb-4">
            <option selected>Please select payment: </option>
            <option value="PayPal">PayPal</option>
            <option value="Card 1">Card 1 4323 9889 0099 8989 0000</option>
            <option value="New">Add new...</option>
        </select>
        Add new: <input type="checkbox" id="myCheck2">

        <div class="row d-flex justify-content-center" >
            <aside class="col-sm-8 ">


                <article class="card mt-3 border-0 shadow">
                    <div class="card-body p-5" id="newCardForm"  >

                        <form>
                                <h3>Add new credit card</h3>
                            <div class="form-group" >
                                <label for="username">Full name (on the card)</label>
                                <input type="text" class="form-control" name="username" placeholder="" required="">
                            </div> <!-- form-group.// -->

                            <div class="form-group">
                                <label for="cardNumber">Card number</label>
                                <div class="input-group">
                                    <input type="text" class="form-control" name="cardNumber" placeholder="">
                                    <div class="input-group-append">
                                        <span class="input-group-text text-muted">
                                            <i class="fab fa-cc-visa"></i> � <i class="fab fa-cc-amex"></i> �
                                            <i class="fab fa-cc-mastercard"></i>
                                        </span>
                                    </div>
                                </div>
                            </div> <!-- form-group.// -->

                            <div class="row">
                                <div class="col-sm-8">
                                    <div class="form-group">
                                        <label><span class="hidden-xs">Expiration</span> </label>
                                        <div class="input-group">
                                            <select class="form-control">
                                                <option value="01">January</option>
                                                <option value="02">February </option>
                                                <option value="03">March</option>
                                                <option value="04">April</option>
                                                <option value="05">May</option>
                                                <option value="06">June</option>
                                                <option value="07">July</option>
                                                <option value="08">August</option>
                                                <option value="09">September</option>
                                                <option value="10">October</option>
                                                <option value="11">November</option>
                                                <option value="12">December</option>
                                            </select>
                                            <select class="form-control">
                                                <option value="2019">2019</option>
                                                <option value="2020">2020</option>
                                                <option value="2021">2021</option>
                                                <option value="2022">2022</option>
                                                <option value="2023">2023</option>
                                                <option value="2024">2024</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label data-toggle="tooltip" title=""
                                            data-original-title="3 digits code on back side of the card">CVV <i
                                                class="fa fa-question-circle"></i></label>
                                        <input type="number" class="form-control" required="">
                                    </div> <!-- form-group.// -->
                                </div>
                            </div> <!-- row.// -->
                            <button class="subscribe btn btn-secondary" type="button"> Confirm </button>
                        </form>

                    </div> <!-- card-body.// -->
                </article> <!-- card.// -->


            </aside>

        </div>
       
<hr>
<!-- BUTTONS -->
<div class="text-center">
        <a class="btn btn-danger btn-lg" href="${contextPath}/menu" role="button">Back</a>

        <a class="btn btn-success btn-lg" href="${contextPath}/home" role="button">Place Order</a>
</div>



<!-- Contact Footer -->

   <%@include file = "/resources/jsp/footer.jsp"  %>

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