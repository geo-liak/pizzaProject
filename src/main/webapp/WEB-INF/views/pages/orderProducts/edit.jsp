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

        <!-- LOAD BOOTSTRAP 4 ( Building our interface and page layout -quickyl & easily- ) -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <!-- FONT AWESOME ( Icons ) -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
              integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
        <!-- Style css -->
        <link rel="stylesheet" href="style.css">
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

                </ul>
            </div>
        </header>

        <br />
        <br />

        <div class="container">

            <form:form method="POST" action="./update" modelAttribute="orderProduct" class="form-signin">
                <h2 class="form-signin-heading">Order ${orderProduct.orderId}: OrderProduct ${orderProduct.id}</h2>

                <form:input type="hidden" path="id"></form:input>
                <form:input type="hidden" path="orderId"></form:input>

                <spring:bind path="productId">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <label for="productId">Product id</label>

                        <form:select path="productId" class="form-control">
                            <form:options items="${products}" itemValue="id" itemLabel="name" />                    
                        </form:select>

                        <form:errors path="productId"></form:errors>
                        </div>
                </spring:bind>
                <spring:bind path="quantity">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <label for="quantity">Quantity</label>
                        <form:input type="number" path="quantity" class="form-control" placeholder="Quantity"
                                    autofocus="true"></form:input>
                        <form:errors path="quantity"></form:errors>
                        </div>
                </spring:bind>



                <button class="btn btn-lg btn-primary btn-block" type="submit">Submit</button>
                <br />
                <a class="btn btn-lg btn-dark btn-block" href="${contextPath}/orders/edit?id=${orderProduct.orderId}">Back</a>
            </form:form>


        </div>
        <!-- /container -->




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
        <script src="home.js"></script>
        <script type="text/javascript">

                    $(document).ready(function () {

                        //CUSTOM JAVASCRIPT
                    });
        </script>
    </body>

</html>