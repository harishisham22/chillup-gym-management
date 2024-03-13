<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>My Profile | ChillUp Fitness</title>
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
    String username = (String)session.getAttribute("username");
%>
<sql:query var="result" dataSource="${myDatasource}">
    SELECT * FROM ADMINS WHERE ADMIN_USERNAME = ?
    <sql:param value="<%= username%>"/>
</sql:query>

<body>
    <%@include  file="navbar.jsp" %>
    <%@include  file="sidebar.jsp" %>

  <main id="main" class="main">

    <div class="pagetitle">
      <h1>My Profile</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="home.jsp">Home</a></li>
          <li class="breadcrumb-item active">My Profile</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <c:forEach var="row" items="${result.rows}" >
    <div class="row">
      <div class="col-2"></div>
      <div class="card col-md-8">
        <div class="card-body">
          <h5 class="card-title">My Profile</h5>
          <div class="col-12">
              <table class="table">
                <tr>
                  <td>Full Name :</td>
                  <td><c:out value="${row.ADMIN_FULLNAME}" /></td>
                </tr>
                <tr>
                  <td>Email :</td>
                  <td><c:out value="${row.ADMIN_EMAIL}" /></td>
                </tr>
                </tr>
                <tr>
                  <td>Phone :</td>
                  <td><c:out value="${row.ADMIN_PHONE}" /></td>
                </tr>
                <tr>
                  <td>Username :</td>
                  <td><c:out value="${row.ADMIN_USERNAME}" /></td>
                </tr>
              </table>
              <br>
              <a type="button" href="update-profile.jsp?ID=<c:out value="${row.ADMIN_ID}"/>" class="btn btn-primary"><i class="bi bi-card-checklist"></i> Update Profile</a>
              <a type="button" href="update-password.jsp?ID=<c:out value="${row.ADMIN_ID}"/>" class="btn btn-secondary"><i class="bi bi-lock"></i> Change Password</a>
          </div>
        </div>
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