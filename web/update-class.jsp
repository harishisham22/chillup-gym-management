<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Update Classes | ChillUp Fitness</title>
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

<% int id = Integer.parseInt(request.getParameter("ID")); %>

<sql:query var="result" dataSource="${myDatasource}">
    SELECT * FROM PROGRAM_CLASS WHERE CLASS_ID = ?
    <sql:param value="<%= id %>"/>
</sql:query>
<sql:query var="program" dataSource="${myDatasource}">
    SELECT * FROM PROGRAMS
</sql:query>
<sql:query var="trainer" dataSource="${myDatasource}">
    SELECT * FROM TRAINERS
</sql:query>
<body>
    <%@include  file="navbar.jsp" %>
    <%@include  file="sidebar.jsp" %>

  <main id="main" class="main">

    <div class="pagetitle">
      <h1>Update Class</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="home.jsp">Home</a></li>
          <li class="breadcrumb-item"><a href="list-class.jsp">Classes</a></li>
          <li class="breadcrumb-item active">Update class</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->
        
    <c:forEach var="row" items="${result.rows}">
        
    <div class="col-lg-8">
      <div class="card">
        <div class="card-body">
          <h5 class="card-title">Update Class Details</h5>

            <!-- Vertical Form -->
            <form action="updateClassServlet" method="post" class="row g-3 needs-validation" novalidate>
                <input type="hidden" name="id" value="<c:out value="${row.CLASS_ID}"/>">
                <div class="col-6">
                  <label class="form-label">Class Day</label>
                  <div class="col-sm-10">
                    <select name="day" class="form-select" aria-label="Default select example">
                      <option value="<c:out value="${row.CLASS_DAY}"/>" selected hidden><c:out value="${row.CLASS_DAY}"/></option>
                      <option value="MONDAY">MONDAY</option>
                      <option value="TUESDAY">TUESDAY</option>
                      <option value="WEDNESDAY">WEDNESDAY</option>
                      <option value="THURSDAY">THURSDAY</option>
                      <option value="FRIDAY">FRIDAY</option>
                      <option value="SATURDAY">SATURDAY</option>
                      <option value="SUNDAY">SUNDAY</option>
                    </select>
                  </div>
                </div>
                <div class="col-6">
                  <label class="form-label">Time Slot</label>
                  <div class="col-sm-10">
                    <select name="time" class="form-select" aria-label="Default select example">
                      <option value="<c:out value="${row.CLASS_TIME}"/>" selected hidden><c:out value="${row.CLASS_TIME}"/></option>
                      <option value="10.00am - 11.00am">10.00am - 11.00am</option>
                      <option value="11.00am - 12.00pm">11.00am - 12.00pm</option>
                      <option value="12.00pm - 01.00pm">12.00pm - 01.00pm</option>
                      <option value="01.00pm - 02.00pm">01.00pm - 02.00pm</option>
                      <option value="02.00pm - 03.00pm">02.00pm - 03.00pm</option>
                      <option value="03.00pm - 04.00pm">03.00pm - 04.00pm</option>
                      <option value="04.00pm - 05.00pm">04.00pm - 05.00pm</option>
                      <option value="05.00pm - 06.00pm">05.00pm - 06.00pm</option>
                      <option value="06.00pm - 07.00pm">06.00pm - 07.00pm</option>
                      <option value="07.00pm - 08.00pm">07.00pm - 08.00pm</option>
                      <option value="08.00pm - 09.00pm">08.00pm - 09.00pm</option>
                      <option value="09.00pm - 10.00pm">09.00pm - 10.00pm</option>
                    </select>
                  </div>
                </div>
                <div class="col-6">
                  <label class="form-label">Program Name</label>
                  <div class="col-sm-10">
                    <select name="program" class="form-select" aria-label="Default select example">
                      <option value="${row.PROGRAM_NAME}" selected hidden>${row.PROGRAM_NAME}</option>
                      <c:forEach var="prog" items="${program.rows}" >
                          <option value="<c:out value="${prog.PROGRAM_NAME}"/>"><c:out value="${prog.PROGRAM_NAME}"/></option>
                      </c:forEach>
                    </select>
                  </div>
                </div>
                <div class="col-6">
                  <label class="form-label">Trainer Name</label>
                  <div class="col-sm-10">
                    <select name="trainer" class="form-select" aria-label="Default select example">
                      <option value="${row.TRAINER_NAME}" selected hidden>${row.TRAINER_NAME}</option>
                      <c:forEach var="train" items="${trainer.rows}" >
                          <option value="<c:out value="${train.TRAINER_FULLNAME}"/>"><c:out value="${train.TRAINER_FULLNAME}"/></option>
                      </c:forEach>
                    </select>
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