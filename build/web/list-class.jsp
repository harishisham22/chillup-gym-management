<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Classes List | ChillUp Fitness</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/chillup.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.gstatic.com" rel="preconnect">
  <link
    href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
    rel="stylesheet">

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
<sql:query var="result" dataSource="${myDatasource}">
    SELECT * FROM PROGRAM_CLASS
</sql:query>
<body>
    <%@include  file="navbar.jsp" %>
    <%@include  file="sidebar.jsp" %>

  <main id="main" class="main">

    <div class="pagetitle">
      <h1>Classes List</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="home.jsp">Home</a></li>
          <li class="breadcrumb-item active">Classes</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <div class="col-12">
      <div class="card recent-sales overflow-auto">

        <div class="card-body">
          <h5 class="card-title">Classes</h5>

          <table class="table datatable">
            <thead>
              <tr>
                  <th scope="col" class="col-2">Class Program</th>
                  <th scope="col" class="col-2">Trainer</th>
                  <th scope="col" class="col-2">Day</th>
                  <th scope="col" class="col-2">Time</th>
                  <th scope="col" class="col-4">Actions</th>
              </tr>
            </thead>
            <tbody>
                <c:forEach var="row" items="${result.rows}">
                    <tr>
                        <th scope="row"><c:out value="${row.PROGRAM_NAME}"/></th>
                        <td><c:out value="${row.TRAINER_NAME}"/></td>
                        <td><c:out value="${row.CLASS_DAY}"/></td>
                        <td><c:out value="${row.CLASS_TIME}"/></td>
                        <td>
                            <a href="view-class.jsp?ID=<c:out value="${row.CLASS_ID}"/>" type="button" class="btn btn-primary">
                                <i class="bi bi-eye"></i> View
                            </a>
                            <a href="update-class.jsp?ID=<c:out value="${row.CLASS_ID}"/>" type="button" class="btn btn-secondary">
                                <i class="bi bi-card-checklist"></i> Edit
                            </a>
                            <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#smallModal<c:out value="${row.CLASS_ID}"/>">
                                <i class="bi bi-trash"> Remove</i>
                            </button>
                            <!--   Begin Delete Modal    -->
                            <div class="modal fade" id="smallModal<c:out value="${row.CLASS_ID}"/>" tabindex="-1">
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
                                                <input type="hidden" name="id" value="<c:out value="${row.CLASS_ID}"/>">
                                                <button type="submit" class="btn btn-danger">Delete</button>
                                            </form>
                                        </div>
                                      </div>
                                </div>
                            </div><!-- End Delete Modal-->
                        </td>
                    </tr>
                </c:forEach>   
            </tbody>
          </table>

        </div>

      </div>
    </div><!-- End Recent Sales -->


  </main><!-- End #main -->

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
      class="bi bi-arrow-up-short"></i></a>

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