<%@page import="java.util.HashMap"%>
<%@page import="item.ItemDTO"%>
<%@page import="java.util.Map"%>
<%@page import="item.ItemDAO"%>
<%@page import="point.PointDAO"%>
<%@page import="point.PointDTO"%>
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
</head>
<%
Map<String, Object> param = new HashMap<String, Object>();
PointDAO pdao = new PointDAO();

PointDTO pdto = new PointDTO();
ItemDTO idto = new ItemDTO();
ItemDAO idao = new ItemDAO();

//idto.setTemOname("prtest");
//idao.adimnItem(idto);



pdto.setId("ptest");
//String id = pdto.getId();
//idto.setId(id);
//idto.setTemOname("pr2");

//구매시 포인트 차감
boolean buyFlag= pdao.buySticker(pdto,idto);
//아이디를 통해 포인트 ㄱㄱ dao.getTotalPoint(id);
//pdao.addPoint("review", pdto);
%>

<body>
<div class="container">
<h2>구매과정 페이지2</h2>

<%
	if(buyFlag == true){
%>
구매 아이디: ${pdto.id}
구매스티커: ${pdto.sticker}
잔여포인트: ${pdto.point}
<%
	}else{
%>
	<h3>스티커 구매에 실패했습니다.</h3>
<%
} 
%>

</div>
</body>
</html>