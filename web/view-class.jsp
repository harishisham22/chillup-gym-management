<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>View Classes | ChillUp Fitness</title>
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
    SELECT * FROM PROGRAM_CLASS c, PROGRAMS p WHERE p.PROGRAM_NAME=c.PROGRAM_NAME AND CLASS_ID = ?
    <sql:param value="<%= id%>"/>
</sql:query>

<body>
    <%@include  file="navbar.jsp" %>
    <%@include  file="sidebar.jsp" %>

  <main id="main" class="main">

    <div class="pagetitle">
      <h1>View Classes</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="home.jsp">Home</a></li>
          <li class="breadcrumb-item"><a href="list-class.jsp">Classes</a></li>
          <li class="breadcrumb-item active">View Class Details</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->
    
    <c:forEach var="row" items="${result.rows}">

    <div class="col-lg-8">
      <div class="card">
        <div class="card-body">
          <h5 class="card-title">View Class Details</h5>

          <!-- Vertical Form -->
          <form action="" method="post" class="row g-3 needs-validation" novalidate>
            <div class="col-12">
              <label for="fullname" class="form-label">Program</label>
              <div class="input-group has-validation">
                <input type="text" name="fullname" class="form-control" id="fullname" value="<c:out value="${row.PROGRAM_NAME}"/>" disabled>
              </div>
            </div>
            <div class="col-12">
              <label for="fullname" class="form-label">Trainer Name</label>
              <div class="input-group has-validation">
                <input type="text" name="fullname" class="form-control" id="fullname" value="<c:out value="${row.TRAINER_NAME}"/>" disabled>
              </div>
            </div>
            <div class="col-6">
              <label for="fullname" class="form-label">Class Day</label>
              <div class="input-group has-validation">
                <input type="text" name="fullname" class="form-control" id="fullname" value="<c:out value="${row.CLASS_DAY}"/>" disabled>
              </div>
            </div>
            <div class="col-6">
              <label for="fullname" class="form-label">Time Slot</label>
              <div class="input-group has-validation">
                <input type="text" name="fullname" class="form-control" id="fullname" value="<c:out value="${row.CLASS_TIME}"/>" disabled>
              </div>
            </div>
            <div class="col-6">
              <label for="fullname" class="form-label">Duration</label>
              <div class="input-group has-validation">
                <input type="text" name="fullname" class="form-control" id="fullname" value="<c:out value="${row.PROGRAM_DURATION}"/>" disabled>
              </div>
            </div>
            <div class="col-6">
              <label for="fullname" class="form-label">Intensity Level</label>
              <div class="input-group has-validation">
                <input type="text" name="fullname" class="form-control" id="fullname" value="<c:out value="${row.PROGRAM_INTENSITY}"/>" disabled>
              </div>
            </div>
            <div class="col-12">
              <label for="fullname" class="form-label">Class Description</label>
              <div class="input-group has-validation">
                  <textarea name="program_desc" class="form-control" style="height: 100px" disabled><c:out value="${row.PROGRAM_DESC}"/></textarea>
              </div>
            </div>
            <div class="text-center">
                <a href="list-class.jsp" type="button" class="btn btn-primary"><i class="bi bi-arrow-bar-left"></i> Back to List</a>
                <a href="update-class.jsp?ID=<c:out value="${row.CLASS_ID}"/>" type="button" class="btn btn-secondary"><i class="bi bi-card-checklist"></i> Edit</a>
                <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#smallModal">
                    <i class="bi bi-trash"> Remove</i>
                </button>
                <!--   Begin Delete Modal    -->
                <div class="modal fade" id="smallModal" tabindex="-1">
                    <div class="modal-dialog modal-sm">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Delete Class</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                Are you sure you want to delete Class: <c:out value="${row.PROGRAM_NAME}"/>?
                            </div>
                            <div class="modal-footer">
                                <form action="deleteClassServlet" method="post">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                    <input type="hidden" name="id" value="<c:out value="${row.MEMBER_ID}"/>">
                                    <button type="submit" class="btn btn-danger">Delete</button>
                                </form>
                            </div>
                          </div>
                    </div>
                </div><!-- End Delete Modal-->
            </div>
          </form><!-- Vertical Form -->

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