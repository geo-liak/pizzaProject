 <header class="navbar navbar-expand-lg navbar-dark bg-warning container-fluid fixed-top shadow" id="navbartop">
        <a class="navbar-brand text-dark" href="#Home"><strong>Dashboard</strong></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown"
            aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-left" id="navbarNavDropdown">
            <ul class="navbar-nav">
                <li class="nav-item">
                        <div class="dropdown"> 
                                <button type="button" class="btn dropdown-toggle btn btn-outline-dark mt-1 " data-toggle="dropdown">
                                   Orders
                                </button>
                                <div class="dropdown-menu">
                                        <a class="dropdown-item text-dark" href="#">Pending</a>                             
                                        <a class="dropdown-item text-dark" href="#">Completed</a>

                                </div>
                            </div>
                   
                </li>
               <li class="nav-item ml-2">
                    <div class="dropdown">
                        <button type="button" class="btn dropdown-toggle btn btn-outline-dark mt-1 "
                            data-toggle="dropdown">
                            Users
                        </button>
                        <div class="dropdown-menu">
                            <a class="dropdown-item text-dark" href="#">Customers</a>
                            <a class="dropdown-item text-dark" href="#">Employees</a>

                        </div>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link nav-pill active text-dark" href="#">Products</a>
                </li>
             
            </ul>
        </div>
      
        <div class="collapse navbar-collapse justify-content-end">
            <ul class="navbar-nav">
                <c:if test="${pageContext.request.userPrincipal != null}">
                    <li class="nav-item">
                    <span class="nav-link nav-pill active text-dark">
                          ${pageContext.request.userPrincipal.name}
                    </span>
                    </li>
                </c:if>
         <!-- LOGIN BUTTON -->
                <li class="nav-item">
                     <form id="logoutForm" method="POST" action="${contextPath}/logout">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                      
                        <a  id="logout_btn" class="btn btn-outline-dark text-dark mt-1" onclick="document.forms['logoutForm'].submit()">Logout</a>
                          </form>
                </li>
            </ul>

        </div>
    </header>
