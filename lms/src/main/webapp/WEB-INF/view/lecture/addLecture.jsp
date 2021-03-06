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
                  <h1>[????????????]</h1>
                </div>
                <div class="col-12 col-xl-4">
                 <div class="justify-content-end d-flex">
                 </div>
                </div>
              </div>
            </div>
          </div>
          <!-- ???????????? ???????????? --> 
          <div class="row">
            <div class="col-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <form class="forms-sample" method="post" action="${pageContext.request.contextPath}/loginCheck/addLecture" id="addLectureForm">
                  	<div class="row">
			            <div class="form-group col">
				            <label>?????????</label>
				            <input type="text" class="form-control button-bottom" placeholder="???????????? ????????? ?????????." id="lectureNameNeedConfirm">
				            <span id="lectureNameHelper"></span>
				            <button type="button" class="float-right btn btn-primary mr-2" id="lectureNameCheck">????????? ?????? ??????</button>
			            </div>
			            <div class="form-group col">
				            <label>?????? ????????? ?????????</label>
				            <input type="text" name="lectureName" class="form-control" placeholder="?????????" readonly="readonly" id="lectureName">
			            </div>
			        </div>
                    <div class="form-group">
                      <label for="exampleInputEmail3">?????? ??????</label>
                      <br>
                      ????????? : <input type="date" name="lectureStartDate" id="lectureStartDate"> ????????? ??? : <input type="date" name="lectureEndDate" id="lectureEndDate">
                    </div>
                    <div class="form-group">
                      <label for="exampleInputPassword4">?????? ??????</label>
                      <div class="input-group">
                      
	                      <div class="input-group-prepend">
	                        <select class="teacherNames">
	                          <option value="">:::?????? ??????:::</option>
	                          <c:forEach var="n" items="${teacherNameList}">
	                          	<option value="${n}">${n}</option>
	                          </c:forEach>
	                         </select>
	                        </div>
	                      </div>
	                      
                      	<input type="text" class="form-control" aria-label="Text input with dropdown button" readonly="readonly" id="teacherName" name="teacherName">
                   	  </div>
                    <div class="form-group">
                      <label for="exampleInputPassword4">?????? ?????????</label>
                      <div class="input-group">
                      
	                      <div class="input-group-prepend">
	                        <select class="managerNames">
	                        <option value="">:::????????? ??????:::</option>
	                          <c:forEach var="n" items="${managerNameList}">
	                          	<option value="${n}">${n}</option>
	                          </c:forEach>
	                        </select>
	                      </div>
	                     </div> 
                      	<input type="text" class="form-control" aria-label="Text input with dropdown button" readonly="readonly" id="managerName" name="managerName">
                   	  </div>
                   	  
                   
                      
                    <div class="form-group">
                      <label for="exampleInputPassword4">?????????</label>
                      <div class="input-group">
	                      <div class="input-group-prepend">
	                        <select class="lectureRoomNames">
	                            <option value="">:::????????? ??????:::</option>
	                          <c:forEach var="n" items="${lectureRoomList}">
	                          	<option value="${n.lectureRoomName}">????????? : ${n.lectureRoomName} / ?????? : ${n.lectureRoomAdmit}???</option>
	                          </c:forEach>
	                        </select>
	                        </div>
	                      </div>
                      	<input type="text" class="form-control" aria-label="Text input with dropdown button" readonly="readonly" id="lectureRoomName" name="lectureRoomName">
                   	  </div>
                    <div class="form-group">
                      <label for="exampleInputCity1">?????? ??????</label>
                      <input type="number" class="form-control" id="maxStudent" placeholder="" max="30" name="maxStudent">
                    </div>
                    <div class="form-group">
                      <label for="exampleInputPassword4">?????? ?????????</label>
                      <input type="text" class="form-control" id="exampleInputPassword4" value="${loginId}" name="loginId" readonly="readonly">
                    </div>
                    
                    </form>
                    <button class="btn btn-primary mr-2" id="submitCheck">Submit</button>
                    <button class="btn btn-light">Cancel</button>
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
      </div>
      <!-- main-panel ends -->

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
  <script type="text/javascript">
	$('.clickTeacherMenu').click(function() {
			$('#teacherName').val($('.clickTeacherMenu').text());
	});
	
	$('.teacherNames').change(function() {
	    var value = $(this).val();
	    $('#teacherName').val(value);
	});
	
	$('.managerNames').change(function() {
	    var value = $(this).val();
	    $('#managerName').val(value);
	});
	
	$('.lectureRoomNames').change(function() {
	    var value = $(this).val();
	    $('#lectureRoomName').val(value);
	});
	
	// ????????? ???????????? ajax
	var url='${pageContext.request.contextPath}';
	$('#lectureNameCheck').click(function(){
			
  			$.ajax({
  				type : "POST"
  				, url : url+"/isExistLeuctre"
  				, data : {lectureName:$('#lectureNameNeedConfirm').val()}
  				, success : function(result) {
  					console.log('result:', result);
  					if(result=='false') {
  						$('#lectureNameHelper').text('?????? ???????????? ???????????????.')
  					}else{
  						$('#lectureNameHelper').text('?????? ????????? ??????????????????.')

  						$('#lectureName').val(result);
  						
  					}
  				}
  				
  			})
			
		
	});
	
	// submit ????????? ????????????
	$('#submitCheck').click(function() {
		// ???.. ????????? ??????
  		if($('#lectureName').val().trim() == '') {
  			alert('????????? ?????? ?????? ????????????');
  		} else if($('#lectureStartDate').val().trim() == '') {
  			alert('?????? ????????? ??????????????????');
  		} else if($('#lectureEndDate').val().trim() == '') {
  			alert('?????? ????????? ??????????????????');
		} else if($('#teacherName').val().trim() == '') {
  			alert('?????? ??????????????????');
		} else if($('#managerName').val().trim() == '') {
  			alert('????????? ??????????????????');
		} else if($('#lectureRoomName').val().trim() == '') {
  			alert('????????? ??????????????????');
		} else if($('#maxStudent').val().trim() == '') {
  			alert('?????? ?????? ??????????????????');
		} else {
			$('#addLectureForm').submit();
		}
	});
  </script>
</body>
</html>

