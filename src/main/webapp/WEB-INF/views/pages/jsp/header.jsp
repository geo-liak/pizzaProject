        <!-- HEADER -->
    <header class="navbar navbar-expand-lg navbar-dark bg-success fixed-top shadow border-bottom border-secondary" id="navbartop">
        <a class="navbar-brand" href="#Home">Pizza Margherita</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown"
            aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-left" id="navbarNavDropdown">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a  class="nav-link " href="${contextPath}/home">Home </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${contextPath}/menu">Menu</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#Contact">Contact</a>
                </li>
            </ul>
        </div>
      <!--ACCOUNT-->
        <div class="collapse navbar-collapse justify-content-end">
            <ul class="navbar-nav">
                 <!-- Account -->
                 <c:choose>
                     <c:when test="${edit}">
                         <li class="nav-item">
                             <a class="nav-link" href="${contextPath}/personalinfo">Account</a>
                         </li>
                     </c:when>
                </c:choose>
                
                         <!--CART-->
                         ${pageContext.request.userPrincipal.name}
                <li class="nav-item">
                    <a class="nav-link mr-3" href="#Cart">
                            <div id="ex4">
                                    <span class="p1 fa-stack fa-1x has-badge" data-count="0">
                                     
                                      <i class="p3 fa fa-shopping-cart fa-stack-1x xfa-inverse" ></i>
                                    </span>
                                  </div>
                          </a>
                </li>
          <!--LOGIN BUTTON--> 
                <li class="nav-item">
                <c:choose>
                    <c:when test="${edit}">
                        <a href="${contextPath}/logout" id="logout_btn" class="btn btn-outline-light mt-1">
                            Logout
                        </a>
                    </c:when>
                    <c:otherwise>
                        <a href="${contextPath}/login" id="login_btn" class="btn btn-outline-light mt-1">
                            Login
                        </a>
                    </c:otherwise>
                </c:choose>
                </li>
            </ul>

        </div>
    </header>
                      