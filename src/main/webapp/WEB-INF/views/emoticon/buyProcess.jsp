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
PointDTO dto = new PointDTO();
dto.setSticker("sticker");
dto.setId("pr");
%>
<body>
<div class="container">
<h2>구매과정 페이지2</h2>

구매 아이디: ${pdto.id}
구매스티커: ${pdto.sticker}
잔여포인트: ${pdto.point}

</div>
</body>
</html>