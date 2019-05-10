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
                            <c:forEach items="${orderProducts}" var="result">             
                                <c:set var="product" value="${productsMap[result.productId]}"/>
                                <tr>
                                    <th scope="row" class="" >

                                        <img  width="160" height="95" src="${contextPath}/resources/images/${product.imagePath}"  alt="${product.name}" class="img-thumbnail">


                                    </th>
                                    <td>  ${product.name} </td>
                                    <td>${result.quantity}</td>
                                    <td>${product.price} &euro;</td>
                                    <td>${(product.price)*(result.quantity)} &euro;</td>
                                </tr>

                            </c:forEach>
                    </table>
                    
                    <c:if test="${not empty priceError}">
                        <span style="color:red;">${priceError}</span>
                    </c:if>
                </div>
                <!-- TOTAL COST -->
                <div class="offset-1 col md-2 d-flex align-items-end ">
                   
                    <div class="display-3 text-success">
                         <h3>Total Cost</h3> <br>
                        ${order.price} &euro;
                    </div>
                </div>
            </div>
            <hr>

            <!-- ADDRESS -->
            <h2> Address </h2>

            <!-- DROPDOWN MENU -->
            <form:form method="POST" action="./placeOrder" modelAttribute="order">
                <form:input type="hidden" path="id"></form:input>
                <form:input type="hidden" path="price"></form:input>
                <form:input type="hidden" path="userId"></form:input>


                <spring:bind path="addressId">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        
                        <form:select path="addressId" class="custom-select mb-2" >
                            <option selected>Select Address...</option>
                            <form:options items="${addresses}" itemValue="id" itemLabel="name" /> 
                        </form:select>
                        <c:if test="${not empty addressError}">
                            <span style="color:red;">${addressError}</span>
                        </c:if>
                        <form:errors path="addressId"></form:errors>
                    </div>
                </spring:bind>

                <a class="btn btn-success" href="${contextPath}/addressEdit">Add Address</a>
                
                <br><br>
                
                <select class="custom-select">
                  <option selected>Select Card...</option>
                  <option value="1">Visa - 4916 3088 7313 8301</option>
                  <option value="2">Mastercard - 5489 6050 0206 8521</option>
                  <option value="3">American Express - 3760 1590 2294 069</option>
                </select>
            <br><br>
            <a class="btn btn-success" href="${contextPath}/addressEdit">Add Card</a>

               

              
                <!-- BUTTONS -->
                <div class="text-center mt-3">
                    <a class="btn btn-danger text-light btn-lg" id="back_btn" role="button"> <i class="fas fa-chevron-left"></i> Back </a>

                    <button class="btn btn-success btn-lg" type="submit">Place Order</button>
                </div>

            </form:form>

            <!-- Contact Footer -->


        </section>
<br><br>
            <jsp:include page= "/WEB-INF/views/pages/jsp/footer.jsp" />



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

        <script src="${contextPath}/resources/js/review.js"></script>

    </body>

</html>