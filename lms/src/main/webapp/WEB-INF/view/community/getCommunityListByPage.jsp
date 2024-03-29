<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<style>
	.new {margin-left : 10px;}
</style>
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
            <div class="col-md-0 grid-margin">
              <div class="row">
                <div class="col-10 col-xl-8 mb-4 mb-xl-0">
                  <h1>[TFT인들 모여라~!]</h1>
                </div>
            	<div class="col-lg-10 grid-margin stretch-card">
				<div class="card">
				<div class="card-body">
				<h4 class="card-title">인기글 모음</h4>
				<p class="card-description">
                  </p>
                  <div class="table-responsive">
                  <table class="table">
                  	<thead>
                  		<tr>
                  			<th>게시글 번호</th>
                  			<th>게시글 제목</th>
                  			<th>게시글 작성자</th>
                  			<th>작성 날짜</th>
                  			<th>추천수</th>
                  		</tr>
                  	</thead>
                  	<tbody>
                  	
                  	<c:forEach var="rl" items="${recommendList}">
						<tr>
                  			<td>${rl.communityNo}</td>
                  			<td><a href="${pageContext.request.contextPath}/loginCheck/getCommunityOne?communityNo=${rl.communityNo}">${rl.communityTitle}</a></td>
                  			<td>${rl.loginId}</td>
                  			<td>${rl.createDate}</td>
                  			<td>${rl.cnt}</td>
                  		</tr>                  	
                  	</c:forEach>   
                  	</tbody>
                  </table>
				</div>
				</div>
				</div>
				</div>
              </div>
            </div>
          </div>
        <!-- content-wrapper ends -->
        <!-- partial:partials/_footer.html -->
        <!-- partial -->
        
          <div class="row">
            <div class="col-lg-10 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">커뮤니티 게시판</h4>
                <div align="right">
                <a class="btn btn-secondary btn-sm" href="${pageContext.request.contextPath}/loginCheck/addCommunity" >게시글 입력</a>
                </div>
                  <p class="card-description">
                  </p>
                  <div class="table-responsive">
                    <table class="table">
                      <thead>
                        <tr>
                          <th>게시글 번호</th>
                          <th>게시글 제목</th>
                          <th>게시글 작성자</th>
                          <th>작성 날짜</th>
                        </tr>
                      </thead>
                      <tbody>
	                      
                      
                      <c:forEach var="cl" items="${communityList}">
                         <tr>
                            <td>${cl.communityNo}</td>
                            <td>
                            <a href="${pageContext.request.contextPath}/loginCheck/getCommunityOne?communityNo=${cl.communityNo}">${cl.communityTitle}</a>
	                      		<c:forEach var="tl" items="${todayList}">
	                      			<c:if test="${tl eq cl.communityNo}">
	                      				<span class="badge badge-warning new"> New</span>
	                      			</c:if>
                     			 </c:forEach>
                            </td>
                            <td>${cl.loginId}</td>
                            <td>${cl.createDate}</td>
                         </tr>
                      </c:forEach>                
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
          </div>
      <c:if test="${currentPage > 1}">
         <a class="btn btn-success" href="${pageContext.request.contextPath}/loginCheck/getCommunityListByPage?currentPage=${currentPage-1}">이전</a>
      </c:if>
      
      <c:if test="${currentPage < lastPage}">
         <a class="btn btn-success" href="${pageContext.request.contextPath}/loginCheck/getCommunityListByPage?currentPage=${currentPage+1}">다음</a>
      </c:if>
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
