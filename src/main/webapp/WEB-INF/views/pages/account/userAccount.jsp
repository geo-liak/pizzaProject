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
        <title>User Account</title>
    </head>


    <body>
        <!-- HEADER -->
        <c:choose>
            <c:when test="${privileges}">
                <%@include file = "/WEB-INF/views/pages/jsp/header_admin.jsp" %>
            </c:when>
            <c:otherwise>
                <%@include file = "/WEB-INF/views/pages/jsp/header.jsp" %>
            </c:otherwise>
        </c:choose>


       
        <!--Order Review-->

        <br>
        <br>
        <br>
        <section class="container col-6" >

            <!-- USER DETAILS -->
            <div class="card shadow">
                <div class="card-body ">

                    <div class="login-container border-0" >


                        <form:form method="POST" action="./accountUpdate" modelAttribute="user" class="form-signin">
                            <h2 class="form-signin-heading">User Details</h2>
                            <hr>
                            <form:input type="hidden" path="id"></form:input>
                                <label for="firstName">First Name</label>
                            <spring:bind path="firstName">
                                <div class="form-group rounded ${status.error ? 'has-error' : ''}">
                                    <form:input type="text" path="firstName" class="form-control" placeholder="First Name"
                                                autofocus="true"></form:input>
                                    <form:errors path="firstName"></form:errors>
                                    </div>
                            </spring:bind>
                            <label for="lastName">Last Name</label>
                            <spring:bind path="lastName">
                                <div class="form-group ${status.error ? 'has-error' : ''}">
                                    <form:input type="text" path="lastName" class="form-control" placeholder="Last Name"
                                                autofocus="true"></form:input>
                                    <form:errors path="lastName"></form:errors>
                                    </div>
                            </spring:bind>
                            <label for="username">Username</label>
                            <spring:bind path="username">
                                <div class="form-group ${status.error ? 'has-error' : ''}">
                                    <form:input type="text" path="username" class="form-control" placeholder="username (email)"
                                                autofocus="true"></form:input>
                                    <form:errors path="username"></form:errors>
                                    </div>
                            </spring:bind>
                            <label style="display:none;" for="password">Password</label>
                            <spring:bind path="password">
                                <div style="display:none;" class="form-group ${status.error ? 'has-error' : ''}">
                                    <form:input type="text" path="password" class="form-control" placeholder="password"
                                                autofocus="true"></form:input>
                                    <form:errors path="password"></form:errors>                       
                                    </div>
                            </spring:bind>


                            <button class="btn btn-success " type="submit">Submit</button>
                            <br />
                        </form:form>
                    </div>
                </div>
            </div>
            <br/>
            <hr>
            <!-- PASSWORD -->
            <div class="card shadow panel panel-default">
                <div class="card-body panel-body">
                    <h2>Change Password </h2>
                    <form action="./passwordUpdate" method="POST" class="form-signin">
                        <div class="form-group rounded">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            <input name="password" type="password" class="form-control" placeholder="Password" />
                            <br />
                            <button class="btn btn-success " type="submit">Change</button>
                        </div>
                    </form>
                </div>
            </div>
            <br/>
            
            <!-- PASSWORD -->

            <hr>
            <!--ADDRESSES-->
            <c:if test="${not empty user.id}">
                <div class="card shadow">
                    <div class="card-body ">
                        <h2> Address </h2>
                        <div class="table-responsive">
                            <table class="table table-hover ">
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
                                            <td><a class="btn btn-success" href="${contextPath}/addressEdit?id=${result.id}">Edit</a></td>
                                            <td><a class="btn btn-danger" href="${contextPath}/addressDelete?id=${result.id}">Delete</a></td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <a class="btn btn-success" href="${contextPath}/addressEdit">Add Address</a>
                        </div>
                    </div>
                </div>
                <br/>
            </c:if>

    
            <hr>
             <!-- CARDs -->
             <c:if test="${not empty user.id}">
                <div class="card shadow">
                    <div class=" card-body" >
                        <h2> Cards </h2>
                        <div class="table" >
                            <table class="table table-hover"  >
                                <thead>
                                    <tr>
                                        <th>Card No.</th>
                                         <th>Card Holder Name</th>
                                        <th>CCV</th>
                                        <th>Expiry Month</th>
                                        <th>Expiry Year</th>
                                        <th colspan="2">Operations</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${cards}" var="result">
                                        <tr th:each="result,iter : ${templatePage.content}" >
                                            <td>${result.cardNumber}</td>
                                            <td>${result.cardHolderName}</td>
                                            <td>${result.ccv}</td>
                                            <td>${result.expiryMonth}</td>
                                            <td>${result.expiryYear}</td>
                                            <td><a class="btn btn-success" href="${contextPath}/addressEdit?id=${result.id}">Edit</a></td>
                                            <td><a class="btn btn-danger" href="${contextPath}/addressDelete?id=${result.id}">Delete</a></td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <a class="btn btn-success" href="${contextPath}/cardEdit">Add Card</a>
                        </div>
                    </div>
                </div>
                <br/>
            </c:if>
           

            <hr>
            <!-- BUTTONS -->
            <div class="text-center">
                <a class="btn btn-secondary text-light btn-lg" id="back_btn" role="button"><i class="fas fa-chevron-left"></i> Back</a>

                <button class="btn btn-lg btn-warning" type="submit">Save Changes</button>
                <div>
                    <input type="hidden" name="_csrf" value="35ae70d8-2f02-4b71-98d1-025f2f60ff2f" />
                </div>
            </div>

            <!-- Contact Footer -->

        </section>


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

        <script src="/restaurant/resources/js/review.js"></script>

    </body>

</html>