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
        <title>Product Details</title>
    </head>


    <body>
        <!-- HEADER -->

           <%@include file = "/WEB-INF/views/pages/jsp/header_admin.jsp" %>

        <br><br>

      
        <div class="container col-6">

            <div class="card shadow panel panel-default">
                <div class="card-body panel-body">
                    <div class="login-container border-0" >

                        <form:form method="POST" action="./update" modelAttribute="product" class="form-signin">
                            <h2 class="form-signin-heading">Product Details</h2>
                            <hr>
                            <form:input type="hidden" path="id"></form:input>
                             <label for="name">Name</label>
                            <spring:bind path="name">
                                <div class="form-group ${status.error ? 'has-error' : ''}">
                                    <form:input type="text" path="name" class="form-control" placeholder="Name"
                                                autofocus="true"></form:input>
                                    <form:errors path="name"></form:errors>
                                    </div>
                            </spring:bind>
                               <label for="description">Description</label>
                            <spring:bind path="description">
                                <div class="form-group ${status.error ? 'has-error' : ''}">
                                    <form:input type="text" path="description" class="form-control" placeholder="Description"
                                                autofocus="true"></form:input>
                                    <form:errors path="description"></form:errors>
                                    </div>
                            </spring:bind>
                            <label for="ingredients">Ingredients</label>
                            <spring:bind path="ingredients">
                                <div class="form-group ${status.error ? 'has-error' : ''}">
                                    <form:input type="text" path="ingredients" class="form-control" placeholder="Ingredients"
                                                autofocus="true"></form:input>
                                    <form:errors path="ingredients"></form:errors>
                                    </div>
                            </spring:bind>
                            <label for="price">Price</label>
                            <spring:bind path="price">
                                <div class="form-group ${status.error ? 'has-error' : ''}">
                                    <form:input type="text" path="price" class="form-control" placeholder="Price"
                                                autofocus="true"></form:input>
                                    <form:errors path="price"></form:errors>
                                    </div>
                            </spring:bind>
                             <label for="imagePath">Image</label>
                            <spring:bind path="imagePath">
                                <div class="form-group ${status.error ? 'has-error' : ''}">
                                    <form:input type="text" path="imagePath" class="form-control" placeholder="Image"
                                                autofocus="true"></form:input>
                                    <form:errors path="imagePath"></form:errors>
                                    </div>
                            </spring:bind>

                            <button class="btn btn-lg btn-success btn-block" type="submit">Submit</button>
                            <br />
                            <a class="btn btn-lg btn-dark btn-block" href="./list"> <i class="fas fa-chevron-left"></i> Back</a>

                        </form:form>


                    </div>
                </div></div></div>

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