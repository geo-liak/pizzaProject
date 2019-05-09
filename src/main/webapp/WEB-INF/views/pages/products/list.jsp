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

        <jsp:include page= "/WEB-INF/views/pages/jsp/header_admin.jsp" />
        <br><br><br><br>
        <section class="container col-9"  >
            <div class="card shadow panel panel-default">
                <div class="card-body panel-body">
                    <div class="login-container border-0" >


                        <jsp:include page="../search.jsp" />

                    </div>
                </div>
            </div>

            <br />

            <div class="card shadow panel panel-default">
                <div class="card-body panel-body">
                    <div class="login-container border-0" >
                        <h2>Products list</h2>

                        <div class="panel panel-default">
                            <div class="btn-group" role="group">
                                <a class="btn btn-primary" href="./edit">Add new</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <br />

            <div class="card shadow panel panel-default">
                <div class="card-body panel-body">
                    <div class="login-container border-0" >
                        <div class="panel panel-primary">

                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th>Id</th>
                                            <th>Name</th>
                                            <th>Description</th>
                                            <th>Ingredients</th>
                                            <th>Price</th>
                                            <th>Image</th>
                                            <th colspan="2">Operations</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${products}" var="result">
                                            <tr th:each="result,iter : ${templatePage.content}" >
                                                <td>${result.id}</td>
                                                <td>${result.name}</td>
                                                <td>${result.description}</td>
                                                <td>${result.ingredients}</td>
                                                <td>${result.price}</td>
                                                <td>${result.imagePath}</td>
                                                <td><a class="btn btn-success" href="./edit?id=${result.id}">Edit</a></td>
                                                <td><a class="btn btn-danger" href="./delete?id=${result.id}">Delete</a></td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>

                                </table>

                            </div>

                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>



 <div class="text-center mt-3">
       <a class="btn btn-lg btn-secondary btn-block" href="../"> <i class="fas fa-chevron-left"></i> Back</a>

            </div>







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