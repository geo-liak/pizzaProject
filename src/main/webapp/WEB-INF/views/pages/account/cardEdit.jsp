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
        <link href="${contextPath}/resources/css/common.css" rel="stylesheet">
        <title>Dashboard</title>
    </head>


    <body>
        <!-- HEADER -->

        <c:choose>
            <c:when test="${privileges}">
                <%@include file = "/WEB-INF/views/pages/jsp/header.jsp" %>
            </c:when>
            <c:otherwise>
                <%@include file = "/WEB-INF/views/pages/jsp/header_admin.jsp" %>
            </c:otherwise>
        </c:choose>
        <br><br><br><br>

        <div class="container col-6">

            <div class="card shadow panel panel-default">
            <div class="card-body panel-body">

                <div class="login-container border-0" >
            
            <form:form method="POST" action="./cardUpdate" modelAttribute="card" class="form-signin">
                <h2 class="form-signin-heading"> User ${card.userId}</h2>
                <h3> Card #${card.id}</h3>
                <hr>
                <form:input type="hidden" path="id"></form:input>
                <form:input type="hidden" path="userId"></form:input>

                <spring:bind path="cardNumber">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <label for="cardNumber">Card Number</label>
                        <form:input type="text" path="cardNumber" class="form-control" placeholder="Card Number" autofocus="true"></form:input>

                        <form:errors path="cardNumber"></form:errors>
                        </div>
                </spring:bind>

                <spring:bind path="cardHolderName">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <label for="cardHolderName">Number</label>
                        <form:input type="text" path="cardHolderName" class="form-control" placeholder="Card Holder's Name" autofocus="true"></form:input>

                        <form:errors path="cardHolderName"></form:errors>
                        </div>
                </spring:bind>

                <spring:bind path="ccv">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <label for="ccv">CCV</label>
                        <form:input type="text" path="ccv" class="form-control" placeholder="CCV" autofocus="true"></form:input>

                        <form:errors path="ccv"></form:errors>
                        </div>
                </spring:bind>

                <spring:bind path="expiryMonth">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <label for="floor">Floor</label>
                        <form:input type="text" path="expiryMonth" class="form-control" placeholder="Expiry Month" autofocus="true"></form:input>

                        <form:errors path="expiryMonth"></form:errors>
                        </div>
                </spring:bind>

                <spring:bind path="expiryYear">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <label for="telephone">Telephone</label>
                        <form:input type="text" path="expiryYear" class="form-control" placeholder="Expiry Year" autofocus="true"></form:input>

                        <form:errors path="expiryYear"></form:errors>
                        </div>
                </spring:bind>

                <button class="btn btn-lg btn-success btn-block" type="submit">Submit</button>
                <br />
                <a class="btn btn-lg btn-secondary btn-block" href="${contextPath}/userAccount"> <i class="fas fa-chevron-left"></i> Back</a>
            </form:form>

                 </div>
            </div>
        </div>

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