<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script type = "text/javascript">
	$(function(){
		$('#apibtn').click(function(){
			console.log("hello");
			$.ajax({
				url:'/cls/jq/kakaopay.cls' ,
				dataType : 'json',
				success:function(data){
					alert(data.tid);
					var box = data.next_redirect_oc_url;
					window.open(box);
				},
				error: function(error){
					alert(error);
				}
			});	
		});
	});
</head>
<body>
<div class="container">
<button id="api-btn" class="btn btn-primary">카카오페이</button>

</div>
</body>
</html>