<%-- 
    Document   : sidebar
    Created on : Feb 1, 2023, 2:18:29 PM
    Author     : MOHAMMAD NORHARIS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!-- ======= Sidebar ======= -->
  <aside id="sidebar" class="sidebar">

    <ul class="sidebar-nav" id="sidebar-nav">

      <li class="nav-item">
        <a class="nav-link " href="home.jsp">
          <i class="bi bi-grid"></i>
          <span>Dashboard</span>
        </a>
      </li><!-- End Dashboard Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#trainer-nav" data-bs-toggle="collapse" href="#">
          <i class="ri-admin-line"></i><span>Trainers</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="trainer-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="addtrainer.jsp">
              <i class="bi bi-circle"></i><span>Register New Trainer</span>
            </a>
          </li>
          <li>
            <a href="list-trainer.jsp">
              <i class="bi bi-circle"></i><span>View Trainers</span>
            </a>
          </li>
        </ul>
      </li><!-- End Trainers Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#member-nav" data-bs-toggle="collapse" href="#">
          <i class="ri-account-circle-line"></i><span>Members</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="member-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="addmember.jsp">
              <i class="bi bi-circle"></i><span>Register New Member</span>
            </a>
          </li>
          <li>
            <a href="list-member.jsp">
              <i class="bi bi-circle"></i><span>View Members</span>
            </a>
          </li>
        </ul>
      </li><!-- End Members Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#program-nav" data-bs-toggle="collapse" href="#">
          <i class="ri-calendar-2-line"></i><span>Programs</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="program-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="addprogram.jsp">
              <i class="bi bi-circle"></i><span>Create New Program</span>
            </a>
          </li>
          <li>
            <a href="list-program.jsp">
              <i class="bi bi-circle"></i><span>View Programs</span>
            </a>
          </li>
        </ul>
      </li><!-- End Programs Nav -->
      
      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#class-nav" data-bs-toggle="collapse" href="#">
          <i class="ri-calendar-2-line"></i><span>Classes</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="class-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="addclass.jsp">
              <i class="bi bi-circle"></i><span>Create New Class</span>
            </a>
          </li>
          <li>
            <a href="list-class.jsp">
              <i class="bi bi-circle"></i><span>View Classes</span>
            </a>
          </li>
        </ul>
      </li><!-- End Classes Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" href="view-profile.jsp">
          <i class="bi bi-person"></i>
          <span>Profile</span>
        </a>
      </li><!-- End Profile Page Nav -->

    </ul>

  </aside><!-- End Sidebar-->
