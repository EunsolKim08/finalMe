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
if ( ! $('input[name=answer_2]:checked').val()) {
	alert('항목을 선택해주세요.');
	return false;
}
	
</script>
</head>
<body>
<div class="container">

<h2>연습 페이지</h2>
<form>
<ul class="answer" name="buyFrm" method="post" action="./buyProcess.do">
	<li>
		<input type="radio" name="answer_2" id="an_1"><label for="an_1">매우 아니다</label>
	</li>
	<li>
		<input type="radio" name="answer_2" id="an_2"><label for="an_2">아니다</label>
	</li>
	<li>
		<input type="radio" name="answer_2" id="an_3"><label for="an_3">보통</label>
	</li>
	<li>
		<input type="radio" name="answer_2" id="an_4"><label for="an_4">그렇다</label>
	</li>
	<li>
		<input type="radio" name="answer_2" id="an_5"><label for="an_5">매우 그렇다</label>
	</li>
</ul>
</form>
<input type="submit" value="제출"/>

</div>
</body>
</html>