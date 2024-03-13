<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Add Member | ChillUp Fitness</title>
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

<body>

    <%@include  file="navbar.jsp" %>
    <%@include  file="sidebar.jsp" %>

  <main id="main" class="main">

    <div class="pagetitle">
      <h1>Add New Member</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="home.jsp">Home</a></li>
          <li class="breadcrumb-item"><a href="list-member.jsp">Members</a></li>
          <li class="breadcrumb-item active">Add New Members</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <div class="col-lg-8">
      <div class="card">
        <div class="card-body">
          <h5 class="card-title">Insert New Member Details</h5>

          <!-- Vertical Form -->
          <form action="addMemberServlet" method="post" class="row g-3 needs-validation" novalidate>
            <div class="col-12">
              <label for="fullname" class="form-label">Full Name</label>
              <div class="input-group has-validation">
                <input type="text" name="fullname" class="form-control" id="fullname" required>
                <div class="invalid-feedback">Please enter member full name.</div>
              </div>
            </div>
            <div class="col-6">
              <label for="age" class="form-label">Age</label>
              <div class="input-group has-validation">
                <input type="number" name="age" class="form-control" id="age" required>
                <div class="invalid-feedback">Please enter member age.</div>
              </div>
            </div>
            <div class="col-6">
              <label for="age" class="form-label">I.C. Number</label>
              <div class="input-group has-validation">
                <input type="text" name="icno" class="form-control" id="icno" required>
                <div class="invalid-feedback">Please enter member IC Number.</div>
              </div>
            </div>
            <div class="col-6">
                <label for="gender" class="form-label">Gender</label>
                <div class="input-group has-validation">
                    <select name="gender" class="form-select" aria-label="Default select example" required>
                        <option selected>Select a gender</option>
                        <option value="MALE">MALE</option>
                        <option value="FEMALE">FEMALE</option>
                    </select>
                    <div class="invalid-feedback">Please select a gender.</div>
                </div>
            </div>
            <div class="col-6">
              <label for="email" class="form-label">Email</label>
              <div class="input-group has-validation">
                <span class="input-group-text" id="inputGroupPrepend">@</span>
                <input type="text" name="email" class="form-control" id="email" required>
                <div class="invalid-feedback">Please enter member email.</div>
              </div>
            </div>
            <div class="col-6">
              <label for="phone" class="form-label">Phone Number</label>
              <div class="input-group has-validation">
                <input type="text" name="phone" class="form-control" id="phone" required>
                <div class="invalid-feedback">Please enter member phone number.</div>
              </div>
            </div>
            <div class="text-center">
              <button type="submit" class="btn btn-primary">Submit</button>
              <button type="reset" class="btn btn-secondary">Reset</button>
            </div>
          </form><!-- Vertical Form -->
            <c:set var="errMessage" scope="request" value="<%= (String) request.getAttribute("errMessage")%>"/>
            <c:if test="${not empty errMessage && errMessage != null}">
                <div class="col-12 text-danger">
                    <b><c:out value="${errMessage}"/></b>
                </div>
            </c:if>
        </div>
      </div>
    </div>

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