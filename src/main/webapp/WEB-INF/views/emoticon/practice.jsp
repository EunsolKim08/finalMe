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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$(function(){
	$('#apibtn').click(function(){
		$.ajax({
			url:'kakaopay',
			dataType:'json',
			success:function(data){
				 // alert(resp.tid); //결제 고유 번호
				var box = resp.next_redirect_pc_url;
				//window.open(box); // 새창 열기
				location.href = box;
			},
			error:function(error){
				alert(error);
			}
		});
	});
});
let index = {
		init:function(){
	        $("#btn-kakaopay").on("click", ()=>{ // function(){}를 사용안하고 , ()=>{}를 사용하는 이유는 this를 바인딩하기 위해서
				this.kakaopay();
			});
		},

	  // 카카오페이 결제
		kakaopay:function(){
			
			$.ajax({
				url:"kakaopay",
				dataType:"json"
			}).done(function(resp){
				if(resp.status === 500){
					alert("카카오페이결제를 실패하였습니다.")
				} else{
					 // alert(resp.tid); //결제 고유 번호
					var box = resp.next_redirect_pc_url;
					//window.open(box); // 새창 열기
					location.href = box;
				}
			
			}).fail(function(error){
				alert(JSON.stringify(error));
			}); 
			
		},
	}

	index.init();
	
</script>
</head>
<body>
<div class="container">

<h2>카카오페이 실행확인 페이지</h2>
<button id="btn-kakaopay" class="btn btn-primary">카카오페이</button>


</div>
</body>
</html>