<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>


<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Dashboard | ChillUp Fitness</title>
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
<sql:query var="member" dataSource="${myDatasource}">
    SELECT * FROM MEMBER
</sql:query>
<sql:query var="trainer" dataSource="${myDatasource}">
    SELECT * FROM TRAINERS
</sql:query>
<sql:query var="program" dataSource="${myDatasource}">
    SELECT * FROM PROGRAMS
</sql:query>
<sql:query var="class" dataSource="${myDatasource}">
    SELECT * FROM PROGRAM_CLASS
</sql:query>
<sql:query var="memberMale" dataSource="${myDatasource}">
    SELECT * FROM MEMBER WHERE MEMBER_GENDER = ? OR MEMBER_GENDER = ? OR MEMBER_GENDER = ?
    <sql:param value="male"/>       
    <sql:param value="MALE"/>
    <sql:param value="Male"/>
</sql:query>
<sql:query var="memberFemale" dataSource="${myDatasource}">
    SELECT * FROM MEMBER WHERE MEMBER_GENDER = ? OR MEMBER_GENDER = ? OR MEMBER_GENDER = ?
    <sql:param value="female"/>       
    <sql:param value="FEMALE"/>
    <sql:param value="Female"/>
</sql:query>
<sql:query var="trainerMale" dataSource="${myDatasource}">
    SELECT * FROM TRAINERS WHERE TRAINER_GENDER = ? OR TRAINER_GENDER = ? OR TRAINER_GENDER = ?
    <sql:param value="male"/>       
    <sql:param value="MALE"/>
    <sql:param value="Male"/>
</sql:query>
<sql:query var="trainerFemale" dataSource="${myDatasource}">
    SELECT * FROM TRAINERS WHERE TRAINER_GENDER = ? OR TRAINER_GENDER = ? OR TRAINER_GENDER = ?
    <sql:param value="female"/>     
    <sql:param value="FEMALE"/>
    <sql:param value="Female"/>
</sql:query>
<sql:query var="memberAge" dataSource="${myDatasource}">
    SELECT MEMBER_AGE, COUNT(MEMBER_AGE) AS COUNTAGE FROM MEMBER GROUP BY MEMBER_AGE
</sql:query>
<sql:query var="trainerAge" dataSource="${myDatasource}">
    SELECT TRAINER_AGE, COUNT(TRAINER_AGE) AS COUNTAGE FROM TRAINERS GROUP BY TRAINER_AGE
</sql:query>

<body>
    
    <%@include  file="navbar.jsp" %>
    <%@include  file="sidebar.jsp" %>

  <main id="main" class="main">

    <div class="pagetitle">
      <h1>Dashboard</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="home.jsp">Home</a></li>
          <li class="breadcrumb-item active">Dashboard</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section dashboard">
      <div class="row">
        <div class="col-lg-12">
          <div class="row">

            <!-- Trainers Card -->
            <div class="col-xxl-3 col-md-6">
              <div class="card info-card">
                <div class="card-body">
                  <h5 class="card-title">Trainers <span>| Total</span></h5>
                  <div class="d-flex align-items-center">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="ri-admin-line"></i>
                    </div>
                    <div class="ps-3">
                        <h6><c:out value="${trainer.rowCount}"/></h6><p>people</p>
                    </div>
                  </div>
                </div>
              </div>
            </div><!-- End Trainers Card -->

            <!-- Members Card -->
            <div class="col-xxl-3 col-md-6">
              <div class="card info-card">
                <div class="card-body">
                  <h5 class="card-title">Members <span>| Total</span></h5>

                  <div class="d-flex align-items-center">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="ri-account-circle-line"></i>
                    </div>
                    <div class="ps-3">
                      <h6><c:out value="${member.rowCount}"/></h6><p>people</p>
                    </div>
                  </div>
                </div>
              </div>
            </div><!-- End Members Card -->

            <!-- Programs Card -->
            <div class="col-xxl-3 col-xl-12">
              <div class="card info-card">
                <div class="card-body">
                  <h5 class="card-title">Programs <span>| Total</span></h5>
                  <div class="d-flex align-items-center">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="ri-calendar-2-line"></i>
                    </div>
                    <div class="ps-3">
                      <h6><c:out value="${program.rowCount}"/></h6><p>programs</p>
                    </div>
                  </div>
                </div>
              </div>
            </div><!-- End Programs Card -->
            
            <!-- Classes Card -->
            <div class="col-xxl-3 col-xl-12">
              <div class="card info-card">
                <div class="card-body">
                  <h5 class="card-title">Classes <span>| Total</span></h5>
                  <div class="d-flex align-items-center">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="ri-calendar-2-line"></i>
                    </div>
                    <div class="ps-3">
                      <h6><c:out value="${class.rowCount}"/></h6><p>classes</p>
                    </div>
                  </div>
                </div>
              </div>
            </div><!-- End Classes Card -->

        <div class="col-lg-6">
          <div class="card">
            <div class="card-body">
              <h5 class="card-title">Members by Gender</h5>

              <!-- Pie Chart -->
              <div id="pieChart1"></div>

              <script>
                document.addEventListener("DOMContentLoaded", () => {
                  new ApexCharts(document.querySelector("#pieChart1"), {
                      series: [<c:out value="${memberMale.rowCount}"/>,<c:out value="${memberFemale.rowCount}"/>],
                    chart: {
                      height: 350,
                      type: 'pie',
                      toolbar: {
                        show: true
                      }
                    },
                    labels: ['Male', 'Female']
                  }).render();
                });
              </script>
              <!-- End Pie Chart -->

            </div>
          </div>
        </div>

        <div class="col-lg-6">
          <div class="card">
            <div class="card-body">
              <h5 class="card-title">Trainers by Gender</h5>

              <!-- Pie Chart -->
              <div id="pieChart2"></div>

              <script>
                document.addEventListener("DOMContentLoaded", () => {
                  new ApexCharts(document.querySelector("#pieChart2"), {
                      series: [<c:out value="${trainerMale.rowCount}"/>,<c:out value="${trainerFemale.rowCount}"/>],
                    chart: {
                      height: 350,
                      type: 'pie',
                      toolbar: {
                        show: true
                      }
                    },
                    labels: ['Male', 'Female']
                  }).render();
                });
              </script>
              <!-- End Pie Chart -->

            </div>
          </div>
        </div>

        <div class="col-lg-6">
          <div class="card">
            <div class="card-body">
              <h5 class="card-title">Members by Age</h5>

              <!-- Column Chart -->
              <div id="columnChart1"></div>

              <script>
                document.addEventListener("DOMContentLoaded", () => {
                  new ApexCharts(document.querySelector("#columnChart1"), {
                    series: [{
                      name: 'Number of Member(s)',
                      data: [<c:forEach var="row" items="${memberAge.rows}"><c:out value="${row.COUNTAGE}"/>,</c:forEach>]
                    }],
                    chart: {
                      type: 'bar',
                      height: 350
                    },
                    plotOptions: {
                      bar: {
                        horizontal: false,
                        columnWidth: '55%',
                        endingShape: 'rounded'
                      },
                    },
                    dataLabels: {
                      enabled: false
                    },
                    stroke: {
                      show: true,
                      width: 2,
                      colors: ['transparent']
                    },
                    xaxis: {
                      categories: [<c:forEach var="row" items="${memberAge.rows}"><c:out value="${row.MEMBER_AGE}"/>,</c:forEach>],
                    },
                    yaxis: {
                      title: {
                        text: 'Number of members'
                      }
                    },
                    fill: {
                      opacity: 1
                    },
                    tooltip: {
                      y: {
                        formatter: function(val) {
                          return val + " people"
                        }
                      }
                    }
                  }).render();
                });
              </script>
              <!-- End Column Chart -->

            </div>
          </div>
        </div>

        <div class="col-lg-6">
          <div class="card">
            <div class="card-body">
              <h5 class="card-title">Trainers by Age</h5>

              <!-- Column Chart -->
              <div id="columnChart2"></div>

              <script>
                document.addEventListener("DOMContentLoaded", () => {
                  new ApexCharts(document.querySelector("#columnChart2"), {
                    series: [{
                      name: 'Number of trainer(s)',
                      data: [<c:forEach var="row" items="${trainerAge.rows}"><c:out value="${row.COUNTAGE}"/>,</c:forEach>]
                    }],
                    chart: {
                      type: 'bar',
                      height: 350
                    },
                    plotOptions: {
                      bar: {
                        horizontal: false,
                        columnWidth: '55%',
                        endingShape: 'rounded'
                      },
                    },
                    dataLabels: {
                      enabled: false
                    },
                    stroke: {
                      show: true,
                      width: 2,
                      colors: ['transparent']
                    },
                    xaxis: {
                      categories: [<c:forEach var="row" items="${trainerAge.rows}"><c:out value="${row.TRAINER_AGE}"/>,</c:forEach>],
                    },
                    yaxis: {
                      title: {
                        text: 'Number of trainers'
                      }
                    },
                    fill: {
                      opacity: 1
                    },
                    tooltip: {
                      y: {
                        formatter: function(val) {
                            return val + " people"
                        }
                      }
                    }
                  }).render();
                });
              </script>
              <!-- End Column Chart -->

            </div>
          </div>
        </div>
            
          </div>
      </div>
    </section>

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

