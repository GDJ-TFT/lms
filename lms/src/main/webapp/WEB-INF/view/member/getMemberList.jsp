<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>LMS-TFT</title>
  <!-- plugins:css -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/vendors/feather/feather.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/vendors/ti-icons/css/themify-icons.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/vendors/css/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- Plugin css for this page -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/vendors/datatables.net-bs4/dataTables.bootstrap4.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/vendors/ti-icons/css/themify-icons.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/select.dataTables.min.css">
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/vertical-layout-light/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/tftace.jpg" />
  <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
  <div class="container-scroller">
    <!-- partial:partials/_navbar.html -->
    <jsp:include page="/inc/topbar.jsp"/>
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
      <!-- partial:partials/_settings-panel.html -->
      
      <!-- partial -->
      <!-- partial:partials/_sidebar.html -->
      <nav class="sidebar sidebar-offcanvas" id="sidebar">
        <jsp:include page="/inc/sidebar.jsp"/>
      </nav>
      <!-- partial -->
      <div class="main-panel">
        <div class="content-wrapper">
          <div class="row">
            <div class="col-md-12 grid-margin">
              <div class="row">
                <div class="col-12 col-xl-8 mb-4 mb-xl-0">
                  <h3 style="font-weight: bold;">회원 목록</h3>
                </div>
              </div>
            </div>
          </div>
          <!-- 강의개설 실제부분 --> 
          <c:choose>
          <c:when test="${msg eq 'student'}">
          <div class="row">
            <div class="col-lg-10 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">학생</h4>
                  <p class="card-description">
                  </p>
                  <div class="table-responsive">
                    <table class="table">
                      <thead>
                        <tr>
                          <th>ID</th>
                          <th>학생명</th>
                          <th>생년월일</th>
                          <th>생성날짜</th>
                        </tr>
                      </thead>
                      <tbody>
                      <c:forEach var="s" items="${studentList}">
                         <tr>
                            <td><a href="${pageContext.request.contextPath}/loginCheck/getMemberOne?loginId=${s.loginId}">${s.loginId}</a></td>
                            <td>${s.studentName}</td>
                            <td>${s.studentBirth}</td>
                            <td>${s.createDate}</td>
                         </tr>
                      </c:forEach>                
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
          </div>
          </c:when>
          <c:when test="${msg eq 'teacher'}">
          <div class="row">
            <div class="col-lg-10 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">강사</h4>
                  <p class="card-description">
                  </p>
                  <div class="table-responsive">
                    <table class="table">
                      <thead>
                        <tr>
                          <th>ID</th>
                          <th>강사명</th>
                          <th>생년월일</th>
                          <th>생성날짜</th>
                        </tr>
                      </thead>
                      <tbody>
                      <c:forEach var="t" items="${teacherList}">
                         <tr>
                            <td><a href="${pageContext.request.contextPath}/loginCheck/getMemberOne?loginId=${t.loginId}">${t.loginId}</a></td>
                            <td>${t.teacherName}</td>
                            <td>${t.teacherBirth}</td>
                            <td>${t.createDate}</td>
                         </tr>
                      </c:forEach>                
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
          </div>
          </c:when>
          <c:when test="${msg eq 'manager'}">
          <div class="row">
            <div class="col-lg-10 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">매니저</h4>
                  <p class="card-description">
                  </p>
                  <div class="table-responsive">
                    <table class="table">
                      <thead>
                        <tr>
                          <th>ID</th>
                          <th>매니저명</th>
                          <th>직급</th>
                          <th>생성날짜</th>
                        </tr>
                      </thead>
                      <tbody>
                      <c:forEach var="m" items="${managerList}">
                         <tr>
                            <td><a href="${pageContext.request.contextPath}/loginCheck/getMemberOne?loginId=${m.loginId}">${m.loginId}</a></td>
                            <td>${m.managerName}</td>
                            <td>${m.positionName}</td>
                            <td>${m.createDate}</td>
                         </tr>
                      </c:forEach> 
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
          </div>
          </c:when>
          </c:choose>
        <!-- content-wrapper ends -->
        <!-- partial:partials/_footer.html -->
        <!-- partial -->
      </div>
      <!-- main-panel ends -->
    </div>   
    <!-- page-body-wrapper ends -->
  </div>
  <!-- container-scroller -->

  <!-- plugins:js -->
  <script src="${pageContext.request.contextPath}/vendors/js/vendor.bundle.base.js"></script>
  <!-- endinject -->
  <!-- Plugin js for this page -->
  <script src="${pageContext.request.contextPath}/vendors/chart.js/Chart.min.js"></script>
  <script src="${pageContext.request.contextPath}/vendors/datatables.net/jquery.dataTables.js"></script>
  <script src="${pageContext.request.contextPath}/vendors/datatables.net-bs4/dataTables.bootstrap4.js"></script>
  <script src="${pageContext.request.contextPath}/js/dataTables.select.min.js"></script>

  <!-- End plugin js for this page -->
  <!-- inject:js -->
  <script src="${pageContext.request.contextPath}/js/off-canvas.js"></script>
  <script src="${pageContext.request.contextPath}/js/hoverable-collapse.js"></script>
  <script src="${pageContext.request.contextPath}/js/template.js"></script>
  <script src="${pageContext.request.contextPath}/js/settings.js"></script>
  <script src="${pageContext.request.contextPath}/js/todolist.js"></script>
  <!-- endinject -->
  <!-- Custom js for this page-->
  <script src="${pageContext.request.contextPath}/js/dashboard.js"></script>
  <script src="${pageContext.request.contextPath}/js/Chart.roundedBarCharts.js"></script>
  <!-- End custom js for this page-->

</body>
</html>
