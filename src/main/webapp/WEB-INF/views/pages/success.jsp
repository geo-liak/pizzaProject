<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
        <title>Home Page</title>
    </head>


    <body>
       <%@include file = "/WEB-INF/views/pages/jsp/header.jsp" %>

<br><br><br><br><br><br>
    
    <div class="container col-6">
         <div class="card shadow panel panel-default">
            <div class="card-body panel-body text-success pt-5">

                <div class="login-container border-0" >
        <h1 >Order was placed successfully.</h1>
        <!--<h3> <a href="./menu">Menu</a></h3>-->
       <div class = "text-secondary"> <h4>
  Redirecting to <a href="./menu">Menu</a> after <span id="countdown">5</span> seconds <i class="fas fa-spinner fa-pulse"></i>
           </h4></div>
    </div>
                 </div>
              </div>
         </div>
                
    
     <!-- Contact Footer -->
<br><br><br><br><br><br> 
            <jsp:include page= "/WEB-INF/views/pages/jsp/footer.jsp" />


<!-- JavaScript part -->
<script type="text/javascript">
    
    // Total seconds to wait
    var seconds = 5;
    
    function countdown() {
        seconds = seconds - 1;
        if (seconds < 0) {
            // ChaNge your redirection link here
            window.location = "./menu";
        } else {
            // Update remaining seconds
            document.getElementById("countdown").innerHTML = seconds;
            // Count down using javascript
            window.setTimeout("countdown()", 1000);
        }
    }
    
    // Run countdown function
    countdown();
    
</script>


</body>

</html>