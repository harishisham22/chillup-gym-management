<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>View trainers | ChillUp Fitness</title>
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
    SELECT * FROM TRAINERS WHERE TRAINER_ID = ?
    <sql:param value="<%= id%>"/>
</sql:query>

<body>
    <%@include  file="navbar.jsp" %>
    <%@include  file="sidebar.jsp" %>

  <main id="main" class="main">

    <div class="pagetitle">
      <h1>View Trainers</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="home.jsp">Home</a></li>
          <li class="breadcrumb-item"><a href="list-trainer.jsp">Trainers</a></li>
          <li class="breadcrumb-item active">View Trainer Details</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->
    
    <c:forEach var="row" items="${result.rows}">

    <div class="col-lg-8">
      <div class="card">
        <div class="card-body">
            <h5 class="card-title">View Trainer Details</h5>

            <!-- Vertical Form -->
            <form action="" method="post" class="row g-3 needs-validation" novalidate>
                <div class="col-12">
                  <label for="fullname" class="form-label">Full Name</label>
                  <div class="input-group has-validation">
                    <input type="text" name="fullname" class="form-control" id="fullname" value="<c:out value="${row.TRAINER_FULLNAME}"/>" disabled>
                  </div>
                </div>
                <div class="col-6">
                  <label for="age" class="form-label">Age</label>
                  <div class="input-group has-validation">
                    <input type="number" name="age" class="form-control" id="age" value="<c:out value="${row.TRAINER_AGE}"/>" disabled>
                  </div>
                </div>
                <div class="col-6">
                  <label for="age" class="form-label">Gender</label>
                  <div class="input-group has-validation">
                    <input type="text" name="age" class="form-control" id="age" value="<c:out value="${row.TRAINER_GENDER}"/>" disabled>
                  </div>
                </div>
                <div class="col-6">
                  <label for="age" class="form-label">I.C. Number</label>
                  <div class="input-group has-validation">
                    <input type="text" name="icno" class="form-control" id="icno" value="<c:out value="${row.TRAINER_ICNO}"/>" disabled>
                  </div>
                </div>
                <div class="col-6">
                  <label for="email" class="form-label">Email</label>
                  <div class="input-group has-validation">
                    <span class="input-group-text" id="inputGroupPrepend">@</span>
                    <input type="text" name="email" class="form-control" id="email" value="<c:out value="${row.TRAINER_EMAIL}"/>" disabled>
                  </div>
                </div>
                <div class="col-6">
                  <label for="phone" class="form-label">Phone Number</label>
                  <div class="input-group has-validation">
                    <input type="text" name="phone" class="form-control" id="phone" value="<c:out value="${row.TRAINER_PHONE}"/>" disabled>
                  </div>
                </div>
                <div class="text-center">
                    <a href="list-trainer.jsp" type="button" class="btn btn-primary"><i class="bi bi-arrow-bar-left"></i> Back to List</a>
                    <a href="update-trainer.jsp?ID=<c:out value="${row.TRAINER_ID}"/>" type="button" class="btn btn-secondary"><i class="bi bi-card-checklist"></i> Edit</a>
                    <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#smallModal">
                        <i class="bi bi-trash"> Remove</i>
                    </button>
                    <!--   Begin Delete Modal    -->
                    <div class="modal fade" id="smallModal" tabindex="-1">
                        <div class="modal-dialog modal-sm">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title">Delete Member</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    Are you sure you want to delete Member: <c:out value="${row.TRAINER_FULLNAME}"/>?
                                </div>
                                <div class="modal-footer">
                                    <form action="deleteTrainerServlet" method="post">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                        <input type="hidden" name="id" value="<c:out value="${row.TRAINER_ID}"/>">
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