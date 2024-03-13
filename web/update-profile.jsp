<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Update My Profile | ChillUp Fitness</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/chillup.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.gstatic.com" rel="preconnect">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/quill/quill.snow.css" rel="stylesheet">
  <link href="assets/vendor/quill/quill.bubble.css" rel="stylesheet">
  <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="assets/vendor/simple-datatables/style.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: NiceAdmin - v2.4.1
  * Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>
<sql:setDataSource var="myDatasource"
driver="org.apache.derby.jdbc.ClientDriver"
url="jdbc:derby://localhost:1527/chillup" user="app" password="app"/>
<%
    int id = Integer.parseInt(request.getParameter("ID"));
%>
<sql:query var="result" dataSource="${myDatasource}">
    SELECT * FROM ADMINS WHERE ADMIN_ID = ?
    <sql:param value="<%= id%>"/>
</sql:query>

<body>
    <%@include  file="navbar.jsp" %>
    <%@include  file="sidebar.jsp" %>

  <main id="main" class="main">

    <div class="pagetitle">
      <h1>Update My Profile</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="home.jsp">Home</a></li>
          <li class="breadcrumb-item"><a href="view-profile.jsp">My Profile</a></li>
          <li class="breadcrumb-item active">Update My Profile</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <c:forEach var="row" items="${result.rows}">
    <div class="card col-md-8">
        <div class="card-body">

            <div class="pt-4 pb-2">
                <h5 class="card-title text-center pb-0 fs-4">Update Your Admin Account</h5>
                <p class="text-center small">Enter your account details</details></p>
            </div>

            <form action="updateAdminServlet" method="post" class="row g-3 needs-validation" novalidate>

                <input type="hidden" name="id" value="<c:out value="${row.ADMIN_ID}"/>">
                <input type="hidden" name="username" value="<c:out value="${row.ADMIN_USERNAME}"/>">
                <div class="col-12">
                    <label for="fullname" class="form-label">Full Name</label>
                    <input type="text" name="fullname" class="form-control" id="fullname" value="<c:out value="${row.ADMIN_FULLNAME}"/>" required>
                    <div class="invalid-feedback">Please enter your full name.</div>
                </div>

                <div class="col-6">
                    <label for="email" class="form-label">Email Address</label>
                    <div class="input-group has-validation">
                        <span class="input-group-text" id="inputGroupPrepend">@</span>
                        <input type="text" name="email" class="form-control" id="email" value="<c:out value="${row.ADMIN_EMAIL}"/>" required>
                        <div class="invalid-feedback">Please enter your email address.</div>
                    </div>
                </div>

                <div class="col-6">
                    <label for="phone" class="form-label">Phone Number</label>
                    <div class="input-group has-validation">
                        <input type="text" name="phone" class="form-control" id="phone" value="<c:out value="${row.ADMIN_PHONE}"/>" required>
                        <div class="invalid-feedback">Please enter your phone number.</div>
                    </div>
                </div>

                <div class="col-md-6">
                  <button class="btn btn-primary w-100" type="submit">Update</button>
                </div>

                <div class="col-md-6">
                    <button class="btn btn-primary w-100" type="reset">Reset</button>
                </div>
              
            </form>
            <c:set var="errMessage" scope="request" value="<%= (String) request.getAttribute("errMessage")%>"/>
            <c:if test="${not empty errMessage && errMessage != null}">
                <div class="col-12 text-danger">
                    <b><c:out value="${errMessage}"/></b>
                </div>
            </c:if>
        </div>
      </div>
  </c:forEach>


  </main><!-- End #main -->

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/apexcharts/apexcharts.min.js"></script>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/chart.js/chart.min.js"></script>
  <script src="assets/vendor/echarts/echarts.min.js"></script>
  <script src="assets/vendor/quill/quill.min.js"></script>
  <script src="assets/vendor/simple-datatables/simple-datatables.js"></script>
  <script src="assets/vendor/tinymce/tinymce.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>

</body>

</html>