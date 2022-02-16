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

var isValidate = function(frm){
    
    /*
    checkbox와 radio는 기본적으로 value속성값을 가지므로
    입력값에 대한 검증이 아니라 선택여부에 대한 검증을 해야한다.
    */
    var isGender = false;
    //라디오의 갯수만큼 반복한다. DOM을 통해 갯수를 알 수 있다.
    for(var i =0; i<frm.gender.length;i++){
        if(frm.gender[i].checked == true){
            //있다면 ture로 값 변경 후 루프 탈출
            isGender = true;
            //radio는 하나만 선택할 수 있으므로 더이상 확인할 이유강 ㅓㅄ다.
            break;
        }
    }
    //성별을 체크하지 않았다면 경고창을 띄어준다.
    if(isGender!=true){
        //라디오는 여러 항목이 있으므로 focus()를 사용할 때 인덱스를 써야한다.
        alert('성별을 선택해주세요');
        frm.gender[0].focus();
        return false;
    }
  
}


</script>
</head>
<body>


<form name="registFrm" onsubmit="return isValidate(this);">
    <!-- table>tr*9>td*2 -->
    <table border="1" cellspacing="0" cellpadding="5">
        <tr>
            <td>성별</td>
            <td>
                <input type="radio" name="gender" value="man" />남
                <input type="radio" name="gender" value="woman"/>여
                <input type="radio" name="gender" value="trans" />트랜스젠더
            </td>
        </tr>
        <tr>
            <td>관심사항(2개선택)</td>
            <td>
                <label>
                <input type="checkbox" name="inter" value="pol" />정치
                </label>
    
                <input type="checkbox" name="inter" value="eco" 
                    id="ec"/><label for="ec">경제</label>
    
                <input type="checkbox" name="inter" value="spo" 
                    id="sp"/><label for="sp">스포츠</label>
    
                <input type="checkbox" name="inter" value="ent" 
                    id="en"/><label for="en">연예</label>
            </td>
        </tr>
        <tr>
		<td colspan="2" style="text-align:center;">
		
		<button type="submit">구매하기</button>
		</td>
		</tr>
        
   
    </table>
    </form>
   
</body>
</html>