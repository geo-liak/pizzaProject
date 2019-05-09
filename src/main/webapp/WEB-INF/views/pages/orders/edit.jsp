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
       <%@include file = "/WEB-INF/views/pages/jsp/header_admin.jsp" %>

        <br />
        <br />

        <div class="container">

            <form:form method="POST" action="./update" modelAttribute="order" class="form-signin">
                <h2 class="form-signin-heading">Order information</h2>

                <form:input type="hidden" path="id"></form:input>

                <spring:bind path="price">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <form:input type="text" path="price" class="form-control" placeholder="Price"
                                    autofocus="true"></form:input>
                        <form:errors path="price"></form:errors>
                        </div>
                </spring:bind>
                <spring:bind path="userId">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <form:input type="text" path="userId" class="form-control" placeholder="User Id"
                                    autofocus="true"></form:input>
                        <form:errors path="userId"></form:errors>
                        </div>
                </spring:bind>
                <spring:bind path="addressId">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        
                        <form:select path="addressId" class="form-control" >
                            <form:options items="${addresses}" itemValue="id" itemLabel="name" /> 
                        </form:select>
                        <form:errors path="addressId"></form:errors>
                        </div>
                </spring:bind>
                <spring:bind path="orderDate">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <form:input type="text" path="orderDate" class="form-control" placeholder="Date"
                                    autofocus="true"></form:input>
                        <form:errors path="orderDate"></form:errors>
                        </div>
                </spring:bind>

                <spring:bind path="progress">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <form:input type="text" path="progress" class="form-control" placeholder="Status"
                                    autofocus="true"></form:input>
                        <form:errors path="progress"></form:errors>
                        </div>
                </spring:bind>


                <button class="btn btn-lg btn-primary btn-block" type="submit">Submit</button>
                <br />
                <a class="btn btn-lg btn-dark btn-block" href="./list?progress=${order.progress}">Back</a>
            </form:form>


            <c:if test="${not empty orderProducts}">
                <div class="panel panel-primary">
                    <div class="panel-body">
                        <div class="table-responsive-sm">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>Id</th>
                                        <th>Product Id</th>
                                        <th>Quantity</th>
                                        <th colspan="2">Operations</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${orderProducts}" var="result">
                                        <tr th:each="result,iter : ${templatePage.content}" >
                                            <td>${result.id}</td>
                                            <td>${productsMap[result.productId].name}</td>
                                            <td>${result.quantity}</td>
                                            <td><a class="btn btn-success" href="../orderproducts/${result.orderId}/edit?id=${result.id}">Edit</a></td>
                                            <td><a class="btn btn-danger" href="../orderproducts/delete?id=${result.id}">Delete</a></td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <a class="btn btn-success" href="../orderproducts/${order.id}/edit">Add Product</a>
                        </div>
                    </div>
                </div>
            </c:if>

         

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