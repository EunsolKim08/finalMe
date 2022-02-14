<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<div class="container">
<script>
$(function(){
	$('#apibtn').click(function(){
		$.ajax({
			url:'kakaopay',
			dataType:'json',
			success:function(data){
			
				alert("카카오페이 실행");
			},
			error:function(error){
				alert(error);
			}
		});
	});
});

$(function(){
	$('#apibtn').click(function(){
		$.ajax({
			alert("카카오페이 버튼");
		});
	});
	
});




</script>


<br />
<h2>카카오페이 실행페이지</h2>
<br /><br />
<button id="apibtn" class="btn btn-primary">카카오페이</button>
<button id="kakaopay" class="btn btn-primary">카카오페이버튼</button>
</div>
</body>
</html>