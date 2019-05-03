<%-- 
    Document   : header
    Created on : May 3, 2019, 1:32:09 PM
    Author     : Home
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

 <header class="navbar navbar-expand-lg navbar-dark bg-success fixed-top shadow" id="navbartop">
        <a class="navbar-brand" href="#Home">Pizza Margherita</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown"
            aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-left" id="navbarNavDropdown">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link active" href="${contextPath}/home">Home </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${contextPath}/menu">Menu</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#Contact">Contact</a>
                </li>
            </ul>
        </div>
      
        <div class="collapse navbar-collapse justify-content-end">
            <ul class="navbar-nav">
         <!-- CART -->
                <li class="nav-item">
                    <a class="nav-link mr-3" href="#Cart">
                            <div id="ex4">
                                    <span class="p1 fa-stack fa-1x has-badge" data-count="4">
                                      <!-- <i class="p2 fa fa-circle fa-stack-2x"></i> -->
                                      <i class="p3 fa fa-shopping-cart fa-stack-1x xfa-inverse" data-count="4"></i>
                                    </span>
                                  </div>
                          </a>
                </li>
         <!-- LOGIN BUTTON -->
                <li class="nav-item">
                    <a href="${contextPath}/login" id="login_btn" class="btn btn-outline-light my-2 my-sm-0">
                        Login
                    </a>
                </li>
            </ul>

        </div>
    </header>