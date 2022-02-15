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
    <ul>
      <li>
        <input type="radio" name="radioTxt" value="Apple" >Apple
      </li>
      <li>
        <input type="radio" name="radioTxt" value="Grape">Grape
      </li>
      <li>
        <input type="radio" name="radioTxt" value="Banana">Banana
      </li>
    </ul>
    <button type="button" name="button" id="radioButton">get radio Value</button>
    <button type="button" name="button" id="radioButton2">set radio Value</button>

    <script type="text/javascript">
      $(document).ready(function () {
        $('#radioButton').click(function () {
          // getter
          var radioVal = $('input[name="radioTxt"]:checked').val();
          alert('구매할 스티커를 체크해주세요');
        });
      });
    </script>
  </body>
</html>