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
       <title>User Role</title>
</head>


<body>
    <!-- HEADER -->

   <%@include file = "/WEB-INF/views/pages/jsp/header_admin.jsp" %>
   <br><br><br><br>

    

        <div class="container col-6">
            <div class="card shadow">
                <div class="card-body ">
            <form:form method="POST" action="./update" modelAttribute="userRole" class="form-signin">
                <h2 class="form-signin-heading">User ${userRole.userId}:<br> UserRole ${userRole.id}</h2>
                <hr>
                <form:input type="hidden" path="id"></form:input>
                <form:input type="hidden" path="userId"></form:input>

                <spring:bind path="roleId">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <label for="roleId">Role id</label>

                        <form:select path="roleId" class="form-control custom-select">
                            <option selected>Select...</option>
                            <form:options items="${roles}" itemValue="id" itemLabel="name" />                    
                        </form:select>

                        <form:errors path="roleId"></form:errors>
                        </div>
                </spring:bind>



                <button class="btn btn-lg btn-success btn-block" type="submit">Submit</button>
                <br />
                <a class="btn btn-lg btn-dark btn-block" href="${contextPath}/users/edit?id=${userRole.userId}"> <i class="fas fa-chevron-left"></i> Back</a>
            </form:form>

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