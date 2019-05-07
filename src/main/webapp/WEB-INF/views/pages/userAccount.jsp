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
        <link href="${contextPath}/resources/css/home.css" rel="stylesheet">
        <title>Review Order</title>
    </head>


    <body>
        <!-- HEADER -->
     <%@include file = "/WEB-INF/views/pages/jsp/header.jsp" %>

    <!--Order Review-->


    <section class="container col-6"  >

        <!-- USER DETAILS -->
        <h2> User Details </h2>
        <div class="login-container mt-4" >

           
                    <form id="userForm" class="form-signin" action="/restaurant/registration" method="POST">
                        <h2 class="form-signin-heading">Account Details</h2>

                        <div class="form-group ">
                            <input id="firstName" name="firstName" placeholder="First Name" type="text" autofocus="true"
                                class="form-control" value="" />

                        </div>


                        <div class="form-group ">
                            <input id="lastName" name="lastName" placeholder="Last Name" type="text" autofocus="true"
                                class="form-control" value="" />

                        </div>


                        <div class="form-group ">
                            <input id="username" name="username" placeholder="Email" type="text" autofocus="true"
                                class="form-control" value="" />

                        </div>



                        <div class="form-group ">
                            <input id="password" name="password" placeholder="Password" type="password"
                                class="form-control" value="" />

                        </div>



                        <div class="form-group ">
                            <input id="passwordConfirm" name="passwordConfirm" placeholder="Confirm your password"
                                type="password" class="form-control" value="" />

                        </div>


                       
                    </form>

                    <hr>
                    <!-- ADDRESS -->
                    <h2> Address </h2>

                    <!-- DROPDOWN MENU -->
                    <select class="custom-select mb-4" size="5">
                        <option value="Address 1">Patision 32, 11457, Athens</option>
                    </select>

                    <button type="button" class="btn  btn-outline-info btn-sm" data-toggle="collapse"
                        data-target="#newAddForm">Add new</button>
                    <!-- NEW ADDRESS FORM -->
                    <div class="row d-flex justify-content-center">
                        <aside class="col-sm-8 ">
                            <article class="card mt-3 border-0 shadow">
                                <div id="newAddForm" class="card-body p-5 collapse">
                                    <form>
                                        <h3>Add new address</h3>
                                        <div class="form-row">
                                            <div class="form-group col-md-12">
                                                <label for="inputAddress">Name</label>
                                                <input type="text" class="form-control" id="name"
                                                    placeholder="Home address">
                                            </div>

                                        </div>
                                        <div class="form-row">
                                            <div class="form-group col-9">
                                                <label for="inputAddress">Street</label>
                                                <input type="text" class="form-control" id="street"
                                                    placeholder="Street">
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
                    <h2> Payment Methods </h2>
                    <!-- DROP DOWN MENU -->
                    <select class="custom-select mb-4" size="5">
                        <option value="PayPal">PayPal</option>
                        <option value="Card 1">Card 1 4323 9889 0099 8989 0000</option>
                    </select>
                    <!--NEW CARD-->
                    <button type="button" class="btn  btn-outline-info btn-sm" data-toggle="collapse"
                        data-target="#newCardForm">Add new</button>

                    <div class="row d-flex justify-content-center">
                        <aside class="col-sm-8 ">


                            <article class="card mt-3 border-0 shadow">
                                <div class="card-body p-5 collapse" id="newCardForm">

                                    <form>
                                        <h3>Add new credit card</h3>
                                        <div class="form-group">
                                            <label for="username">Full name (on the card)</label>
                                            <input type="text" class="form-control" name="username" placeholder=""
                                                required="">
                                        </div> <!-- form-group.// -->

                                        <div class="form-group">
                                            <label for="cardNumber">Card number</label>
                                            <div class="input-group">
                                                <input type="text" class="form-control" name="cardNumber"
                                                    placeholder="">
                                                <div class="input-group-append">
                                                    <span class="input-group-text text-muted">
                                                        <i class="fab fa-cc-visa"></i> <i class="fab fa-cc-amex"></i>
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
                                                        data-original-title="3 digits code on back side of the card">CVV
                                                        <i class="fa fa-question-circle"></i></label>
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
                        <a class="btn btn-danger text-light btn-lg" id="back_btn" role="button"><i class="fas fa-chevron-left"></i>Back</a>
                
                    <button class="btn btn-lg btn-warning" type="submit">Save Changes</button>
                        <div>
                            <input type="hidden" name="_csrf" value="35ae70d8-2f02-4b71-98d1-025f2f60ff2f" />
                        </div>
                    </div>

                    <!-- Contact Footer -->

                   <jsp:include page= "/WEB-INF/views/pages/jsp/footer.jsp" />



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

    <script src="/restaurant/resources/js/review.js"></script>

</body>

</html>