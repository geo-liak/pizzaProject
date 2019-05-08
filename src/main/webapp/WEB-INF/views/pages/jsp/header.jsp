<!-- HEADER -->
    <header class="navbar navbar-expand-lg navbar-dark bg-success fixed-top shadow border-bottom border-secondary" id="navbartop">
        <a class="navbar-brand" href="${contextPath}/home">Pizza Margherita</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown"
            aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-left" id="navbarNavDropdown">
            <ul class="navbar-nav">
<!--                <li class="nav-item">
                    <a  class="nav-link " href="${contextPath}/home">Home </a>
                </li>-->
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
                
                    <c:if test="${pageContext.request.userPrincipal != null}">
                          <!--CART-->
                      
                <li class="nav-item">
                    <a class="nav-link mr-3" href="${contextPath}/review">
                            <div id="ex4">
                                    <span class="p1 fa-stack fa-1x has-badge" data-count="0">
                                     
                                      <i class="p3 fa fa-shopping-cart fa-stack-1x xfa-inverse" ></i>
                                    </span>
                                  </div>
                          </a>
                </li>
                       <li class="nav-item mr-3">
                            <div class="dropdown"> 
                                <button type="button" class="btn dropdown-toggle btn-outline-light mt-1" data-toggle="dropdown">
                                    ${pageContext.request.userPrincipal.name}
                                </button>
                                <div class="dropdown-menu">
                                    <a class="dropdown-item" href="${contextPath}/userAccount">Account</a>
                                    <a class="dropdown-item" href="#">Messages</a>

                                </div>
                            </div>
                        </li>
                 </c:if>
          <!--LOGIN BUTTON--> 
                <li class="nav-item">
                <c:choose>
                    <c:when test="${pageContext.request.userPrincipal != null}">
                        
                        <form id="logoutForm" method="POST" action="${contextPath}/logout">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                      
                        <a  id="logout_btn" class="btn btn-outline-light text-light mt-1" onclick="document.forms['logoutForm'].submit()">Logout</a>
                          </form>

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