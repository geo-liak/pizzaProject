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

        <!-- LOAD BOOTSTRAP 4 ( Building our interface and page layout -quickly & easily- ) -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <!-- FONT AWESOME ( Icons ) -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
              integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
        <!-- Style css -->
        <link rel="stylesheet" href="style.css">
        <link href="${contextPath}/resources/css/common.css" rel="stylesheet">
        <title>Orders List</title>
    </head>


    <body>
        <!-- HEADER -->

   <%@include file = "/WEB-INF/views/pages/jsp/header_admin.jsp" %>
   <br><br> 
   <section class="container col-8">
       
            <h2>Orders  
    <c:choose>
        <c:when test="${param.progress == 1}">: Pending</c:when>
        <c:when test="${param.progress == 2}">: Completed</c:when>
        <c:otherwise>: All</c:otherwise>
    </c:choose>
            </h2>
            
  <br>
            
                <div class="btn-group" role="group">
                    <a class="btn btn-primary" href="./edit">Add new</a>
                </div>
            
<br> <br> 

            <div class="card">
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th>Id</th>
                                <th>Price</th>
                                <th>Customer</th>
                                <th>Address</th>
                                <th>Order time</th>
                                <th>Progress</th>
                                <th colspan="2">Operations</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${orders}" var="result">
                                <tr th:each="result,iter : ${templatePage.content}" >
                                        <td>${result.id}</td>
                                        <td>${result.price}</td>
                                        <td>${result.userId}</td>
                                        <td>${result.addressId}</td>
                                        <td>${result.orderDate}</td>
                                        <td>${result.progress}</td>
                                    <td><a class="btn btn-success" href="./edit?id=${result.id}">Edit</a></td>
                                    <td><a class="btn btn-danger" href="./delete?id=${result.id}">Delete</a></td>
                                </tr>
                            </c:forEach>
                            </tbody>

                        </table>

                    </div>
                </div>
            </div>

        </section>





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
            
        $( document ).ready(function() {
            
            //CUSTOM JAVASCRIPT
        });
        </script>
    </body>

</html>