<%-- 
    Document   : navbar
    Created on : Feb 1, 2023, 2:12:19 PM
    Author     : MOHAMMAD NORHARIS
--%>
<% 
    if((request.getSession(false).getAttribute("username")== null) )
    {%> <jsp:forward page="login.jsp"></jsp:forward> <%}%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="fullname" scope="session" value="<%= (String)session.getAttribute("fullname")%>"/>
<c:set var="username" scope="session" value="<%= (String)session.getAttribute("username")%>"/>

<!-- ======= Header ======= -->
  <header id="header" class="header fixed-top d-flex align-items-center">
    <i class="bi bi-list toggle-sidebar-btn"></i>
    <div class="d-flex align-items-center">
      <a href="home.jsp" class="logo d-flex align-items-center">
        <img src="assets/img/chillup.png" alt="">
        <span class="d-none d-lg-block">ChillUp Fitness</span>
      </a>
       
    </div><!-- End Logo -->

<!--    <div class="search-bar">
      <form class="search-form d-flex align-items-center" method="get" action="search.jsp">
        <input type="text" name="search" placeholder="Search" title="Enter search keyword">
        <button type="submit" title="Search"><i class="bi bi-search"></i></button>
      </form>
    </div> End Search Bar -->

    <nav class="header-nav ms-auto">
      <ul class="d-flex align-items-center">
        <li class="nav-item dropdown pe-3">

          <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
            <span class="d-none d-md-block dropdown-toggle ps-2">Welcome, <c:out value="${username}"/>!</span>
          </a><!-- End Profile Image Icon -->

          <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
            <li class="dropdown-header">
              <h6><c:out value="${username}"/></h6>
              <span>Administrator</span>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="view-profile.jsp">
                <i class="bi bi-person"></i>
                <span>My Profile</span>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="logoutServlet">
                <i class="bi bi-box-arrow-right"></i>
                <span>Sign Out</span>
              </a>
            </li>

          </ul><!-- End Profile Dropdown Items -->
        </li><!-- End Profile Nav -->

      </ul>
    </nav><!-- End Icons Navigation -->

  </header><!-- End Header -->