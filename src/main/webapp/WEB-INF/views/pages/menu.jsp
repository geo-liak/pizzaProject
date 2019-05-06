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
     

        <!-- LOAD BOOTSTRAP 4 ( Building our interface and page layout -quickly & easily- ) -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <!-- FONT AWESOME ( Icons ) -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
              integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
        <!-- Style css -->
    <link rel="stylesheet" href="${contextPath}/resources/css/home.css">
    <title>Menu Page</title>
</head>


<body>
    <!-- HEADER -->

    <jsp:include page= "/WEB-INF/views/pages/jsp/header.jsp" />

        <div class="jumbotron jumbotron-fluid mt-5 mb-0">
            <div class="container text-muted p-3">
                <p class="display-4 text-center font-weight-bolder bg-white rounded-pill shadow mt-2">Pizza Margherita</p>
                <!-- <p class="lead text-center bg-white rounded-pill">This is a modified jumbotron that occupies the entire horizontal space of its
                              parent.</p> -->
            </div>
        </div>
  <section data-spy="scroll" data-target="#navbartop" data-offset="0">
 <!-- MENU CARDS!!! -->
 
    <section id="Menu" class="container mt-2">


      <div class="row mx-2 align-items-center d-flex justify-content-center ">
   
          <c:forEach items="${products}" var="result">             
              <div class="card p-2 m-2 col-3">
                  <img class="card-img-top" src="${contextPath}/resources/images/${result.imagePath}" alt="Card image cap">
                  <div class="card-body">
                      <h5 class="card-title">${result.name}</h5>
                      <p class="card-text">${result.description}</p>
                      <div class="card-footer align-items-center d-flex justify-content-center bg-white">
                          <div class="input-group inputs">
                       
                                <c:set var="orderProduct" value="${orderProductMap[result.id]}"/>
                
                                <form method="POST" action="./addToCart">
                                    <input type="hidden" name="${_csrf.parameterName}"  value="${_csrf.token}" />
                                    <input type="hidden" name="id" value="${orderProduct.id}"></input>
                                    <input type="hidden" name="orderId" value="${orderProduct.orderId}"></input>
                                    <input type="hidden" name="productId" value="${orderProduct.productId}"></input>
                                    <input name="quantity"
                                                value="${orderProduct.quantity}"
                                                class="form-control menuItems bg-warning font-weight-bold"
                                                type="number"
                                                value="0" min="0" max="100" style="text-align: center;"></input>
                                    <button class="btn btn-sm btn-primary btn-block" type="submit">Add to cart</button>
                                </form>
                 
                          </div>
                      </div>
                  </div>
              </div>

          </c:forEach>



      </div>
            <a id="checkout" class="btn btn-success offset-9 col-2 my-3 m" href="${contextPath}/review" role="button"><i class="fas fa-shopping-basket fa-pulse"></i>Checkout</a>
    </section>
   
    <!-- Contact Footer -->

    <jsp:include page= "/WEB-INF/views/pages/jsp/footer.jsp" />

  </section>




        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
         <script
  src="https://code.jquery.com/jquery-3.4.1.min.js"
  integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
  crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
            integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous">
        </script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
            integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous">
        </script>

        <script src="${contextPath}/resources/js/menu.js"></script>
</body>

</html>