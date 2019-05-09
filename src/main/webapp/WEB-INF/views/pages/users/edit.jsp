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
    <title>User Details</title>
</head>


<body>
    <!-- HEADER -->

   <%@include file = "/WEB-INF/views/pages/jsp/header_admin.jsp" %>
   <br><br><br><br>

        <div class="container col-6">
             <div class="card shadow">
                <div class="card-body ">
            <form:form method="POST" action="./update" modelAttribute="user" class="form-signin">
                <h2 class="form-signin-heading">User Details</h2>
                <hr>
                <form:input type="hidden" path="id"></form:input>
                               
                <spring:bind path="firstName">
                     <label for="firstName">First Name</label>
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <form:input type="text" path="firstName" class="form-control" placeholder="First Name"
                                    autofocus="true"></form:input>
                        <form:errors path="firstName"></form:errors>
                        </div>
                </spring:bind>
                <spring:bind path="lastName">
                     <label for="lastName">Last Name</label>
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <form:input type="text" path="lastName" class="form-control" placeholder="Last Name"
                                    autofocus="true"></form:input>
                        <form:errors path="lastName"></form:errors>
                        </div>
                </spring:bind>
                <spring:bind path="username">
                     <label for="userame">Username</label>
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <form:input type="text" path="username" class="form-control" placeholder="username (email)"
                                    autofocus="true"></form:input>
                        <form:errors path="username"></form:errors>
                        </div>
                </spring:bind>
                <spring:bind path="password">
                     <label for="password">Password</label>
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <form:input type="text" path="password" class="form-control" placeholder="password"
                                    autofocus="true"></form:input>
                        <form:errors path="password"></form:errors>                       
                        </div>
                </spring:bind>


                <button class="btn btn-lg btn-success btn-block" type="submit">Submit</button>
                <br />
                <a class="btn btn-lg btn-dark btn-block" href="./list"><i class="fas fa-chevron-left"></i> Back</a> 
            </form:form>
                </div>
             </div>
            <br>
            <!--USER ROLES-->
            <c:if test="${not empty user.id}">
                <div class="card shadow"> 
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>Role</th>
                                        <th>Operations</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${userRoles}" var="result">
                                        <tr th:each="result,iter : ${templatePage.content}" >
                                            <td>${rolesMap[result.roleId].name}</td>
                                            <td><a class="btn btn-danger" href="../userroles/delete?id=${result.id}">Delete</a></td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <a class="btn btn-success" href="../userroles/${user.id}/edit">Add Role</a>
                        </div>
                    </div>
                </div>
            </c:if>

            <br>

            <!--ADDRESSES-->
            <c:if test="${not empty user.id}">
                <div class="card shadow">
                    <div class="card-body">
                        <div class="table-responsive"> 
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>Street</th>
                                        <th>Number</th>
                                        <th>Postal Code</th>
                                        <th>Floor</th>
                                        <th>Telephone</th>
                                        <th colspan="2">Operations</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${addresses}" var="result">
                                        <tr th:each="result,iter : ${templatePage.content}" >
                                            <td>${result.street}</td>
                                            <td>${result.number}</td>
                                            <td>${result.postalCode}</td>
                                            <td>${result.floor}</td>
                                            <td>${result.telephone}</td>
                                            <td><a class="btn btn-success" href="../address/${user.id}/edit?id=${result.id}">Edit</a></td>
                                            <td><a class="btn btn-danger" href="../address/delete?id=${result.id}">Delete</a></td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <a class="btn btn-success" href="../address/${user.id}/edit">Add Address</a>
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