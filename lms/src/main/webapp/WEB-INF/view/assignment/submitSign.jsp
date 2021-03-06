<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
<title>jQuery UI Signature Basics</title>
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/south-street/jquery-ui.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/jquery.signature.css" rel="stylesheet">
<style>
.kbw-signature { width: 400px; height: 200px; }
</style>
<!--[if IE]>
<script src="excanvas.js"></script>
<![endif]-->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.signature.js"></script>
<head>
    <title>How To Create Signature Pad Using jQuery Plugin</title>
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.css">  
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css"/>       
    <!-- jQuery signature plugin css -->
    <link rel="stylesheet" type="text/css" href="http://keith-wood.name/css/jquery.signature.css">
    <style>
        .kbw-signature { width: 100%; height: 200px;}
        #sigpad canvas{ width: 100% !important; height: auto;}
    </style>  
</head>
<body>
<form method="get" action="${pageContext.request.contextPath}/loginCheck/addAssignmentSubmit" id="addForm">
<div class="container">
   <div class="row">
       <div class="col-md-6 offset-md-3 mt-5">
           <div class="card">
               <div class="card-header">
                   <h5>서명</h5>
               </div>
               <div class="card-body">
                  <div class="col-md-12">
                      <label class="" for="">Draw Signature:</label>
                      <div id="sigpad"></div>
                      <br><br><br>
                      <button id="clear" class="btn btn-danger">초기화</button>
						<button id="json" type="button">제출</button>
                  </div>
                </div>
           </div>
       </div>
   </div>
</div>
<input type="hidden" name="assignmentSubmitContent" value="${assignmentSubmitContent}">
<input type="hidden" name="assignmentExamNo" value="${assignmentExamNo}">
<div id="photoSection"></div>
</form>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script> 
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<!-- jQuery signature plugin js -->
<script type="text/javascript" src="http://keith-wood.name/js/jquery.signature.js"></script>
<script type="text/javascript">
    var sigpad = $('#sigpad').signature({syncField: '#signature', syncFormat: 'PNG'});
    
    $('#clear').click(function(e) {
        e.preventDefault();
        sigpad.signature('clear');
        $("#signature").val('');
    });
    $(function() {
    	var sig = $('#sigpad').signature();
    	$('#clear').click(function() {
    		sigpad.signature('clear');
    	});
    	$('#json').click(function() {
    		var ImageURL = sigpad.signature('toDataURL');
    		console.log(ImageURL);
    		$('#photoSection').append("<input type='hidden' value='"+ImageURL+"' name='ImageURL'>")
    		var block = ImageURL.split(";");
    		console.log(block);
    		var contentType = block[0].split(":")[1];     // In this case "image/gif"
    		console.log(contentType);
    		var realData = block[1].split(",")[1];   
    		console.log(realData);
    		
    		$('#addForm').submit();
    		
					
    	});
    	
    	
    		
    	});
    	
	
    


  


</script>
</body>
</html>