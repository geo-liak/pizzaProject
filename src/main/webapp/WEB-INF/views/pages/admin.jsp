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
    <link rel="stylesheet" href="admin.css">
    <title>Dashboard</title>
</head>


<body>
    <!-- HEADER -->

   <jsp:include page= "/WEB-INF/views/pages/jsp/header_admin.jsp" />
<br><br><br><br>
   <!--INNER TITLE-->
      <div class="container jumbotron bg-dark text-white-50 m-5 p-2">
            <h1>Pending Orders</h1>
      </div>
    

   <!--MAIN CONTENT-->
   
     <section class="container col-10   rounded p-2 mb-4 shadow" style="background-color:rgba(250, 249, 240, 0.486)"  >
      Lorem ipsum dolor sit amet consectetur adipisicing elit. In officiis possimus illo expedita inventore fugit tempore, ex ab, excepturi optio, quis quaerat vero ipsum et rem incidunt numquam vitae cumque!
      
       
     </section>
   
   
   
   
   
<!-- Contact Footer -->
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

    <script src="home.js"></script>
</body>

</html>