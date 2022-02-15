<%@page import="item.ItemDTO"%>
<%@page import="point.PointDTO"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="point.PointDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet">   
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
	<script type = "text/javascript">
	$(function(){
		$('#apibtn').click(function(){
			console.log("hello");
			$.ajax({
				url:'kakaopay' ,
				dataType : 'json',
				success:function(data){
					alert("ajax 통신완료");
					alert(data.tid);
					alert(data.total_amount);
					var box = data.next_redirect_pc_url;
					window.open(box);
				},
				error: function(error){
					alert(error);
				}
			});	
		});
	});
	</script>
	
</head>
<body>
	<h2>이모티콘 구현하기</h2>
	<li>
		<a href="../Template/index.jsp" target="_blank">
			템플릿 연결
		</a>
	</li>
	<br /><br />
	<li>
		<a href="./emoticon/displayEmoticon.do" target="_blank">
			이모티콘 디스플레이 페이지 
		</a>
	</li>
	<li>
		<a href="./emoticon/practice.do" target="_blank">
			 연습페이지
		</a>
	</li>
	<li>
		<a href="./emoticon/imKakaopayPage.do" target="_blank">
			아임 카카오 실행페이지
		</a>
	</li>
	<li>
		<a href="./emoticon/oriKakaopayPage.do" target="_blank">
			오리지널 카카오 실행페이지
		</a>
	</li>
	<li>
		<a href="./payResult/resultSuccess.do" target="_blank">
			결제성공
		</a>
	</li>
	<li>
		<a href="./payResult/resultFailure.do" target="_blank">
			결제실패
		</a>
	</li>
	<%
	Map<String, Object> param = new HashMap<String, Object>();
	PointDAO pdao = new PointDAO();
	
	PointDTO pdto = new PointDTO();
	ItemDTO idto = new ItemDTO();
	
	
	
	pdto.setId("ptest");
	//String id = pdto.getId();
	//idto.setId(id);
	//idto.setTemOname("pr2");
	
	//pdao.buySticker(pdto,idto);
	//구매시 포인트 차감
	pdao.buySticker(pdto,idto);
	//아이디를 통해 포인트 ㄱㄱ dao.getTotalPoint(id);
	//pdao.addPoint("review", pdto);
	%>
	<button id="apibtn" class="btn btn-primary">카카오페이</button>
	
	
</body>
</html>
