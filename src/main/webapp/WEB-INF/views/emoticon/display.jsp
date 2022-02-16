<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet">   
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

<script type = "text/javascript">
var isValidate = function(frm){
	var isOk = false;
	for(var i = 0; i<frm.sticker.length;i++){
		if(frm.sticker[i].checked == true){
			isOk = true;
			break;
		}
	}
	
	if(isOk != true){
		alert('구매하실 스티커를 선택해주세요.');
		return false;
	}
	
	var confirmed = confirm("정말로 구매하시겠습니까?");
	if(confirmed){
		var form = document.buyFrm;
		form.method="post"; 
		form.action="./buyProcess.do";
		form.submit(); 	
	}
}

function confirmForm(form){          
    if(form.radioTxt.checked==false){
       alert("구매할 스티커를 체크해주세요");
       return;
    }
    var confirmed = confirm("정말로 구매하시겠습니까?");
    if(confirmed==true){
       form.method="post";
       form.action="폼값전송할URL";
       form.submit();
    }
 }


</script>
</head>
<body>
<div class="container">
<h2>이모티콘 디스플레이 페이지</h2>

<br /><br />

<h3>스티커 출력하기1</h3>
<form name="buyFrm" method="get" onsubmit="return isValidate(this);">
	<input type="text" name="id" value="실험용" />
	<table class="table table-bordered" style="width:500px; height:500px;">
		<tr>
			<td >
				<img src="../resources/img/sticker1.jpg" style="width:100px; height:100px; align:center;">
				<br/><br/><label for="earth">지구</label>
				<input type="radio" id="earth" name="sticker" value="earth">
			</td>
			<td>
				<img src="../resources/img/sticker2.jpg" style="width:100px; height:100px;">
				<br/><br/><label for="sun">태양</label>
				<input type="radio" id="sun" name="sticker" value="sun">
			</td>
			<td>
				<img src="../resources/img/sticker6.jpg" style="width:100px; height:100px;">
				<br/><br/><label for="smile">표정</label>
				<input type="radio" id="smile" name="sticker" value="smile">
			</td>
		</tr>
		<tr>
			<td>
				<img src="../resources/img/sticker3.jpg"  style="width:100px; height:100px;" >
				<br/><br/><label for="redheart">빨간하트</label>
				<input type="radio" id="redheart" name="sticker" value="redheart">
			</td>
			<td>
				<img src="../resources/img/sticker4.jpg" style="width:100px; height:100px;">
				<br/><br/><label for="blueheart">파란하트</label>
				<input type="radio" id="blueheart" name="sticker" value="blueheart">
			</td>
			<td>
				<img src="../resources/img/sticker5.jpg" style="width:100px; height:100px;">
				<br/><br/><label for="iceflake">빙수</label>
				<input type="radio" id="iceflake" name="sticker" value="iceflake">
			</td>
		</tr>
		
		
	</table>
	<button type="submit" class="btn btn-danger" >구매하기</button>
</form>
<br/><br/>
<form name="buyFrm2">
      <input type="radio" name="radioTxt" value="Y">사람1
      <input type="radio" name="radioTxt" value="Y">사람2
      <br/><br/>
      <input type="button" onclick="confirmForm(this.form);" class="btn btn-danger" value="선택하기 예시2">
</form>
</div>

</body>
</html>