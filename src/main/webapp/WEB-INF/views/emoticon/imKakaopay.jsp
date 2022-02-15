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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
<div class="container">
<h2>ImKaoKao</h2>
	<script type = "text/javascript">

	$(function(){
    	$('#imkakao').click(function () {
    	alert("체크모듈 실행");
        var IMP = window.IMP; 
        IMP.init('imp20386257'); 
        IMP.request_pay({
            pg: 'kakao', 
            pay_method: 'card',   
            merchant_uid: 'merchant_' + new Date().getTime(),
           
            name: '주문명:결제테스트',
            //결제창에서 보여질 이름
            amount: 'amount.value', 
            //가격 
            buyer_name: '구매자이름',
            m_redirect_url: 'https://www.yourdomain.com/payments/complete'
         
        }, function (rsp) {
            console.log(rsp);
            if (rsp.success) {
                var msg = '결제가 완료되었습니다.';
                msg += '고유ID : ' + rsp.imp_uid;
                msg += '상점 거래ID : ' + rsp.merchant_uid;
                msg += '결제 금액 : ' + rsp.paid_amount;
                msg += '카드 승인번호 : ' + rsp.apply_num;
            } else {
                var msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
            }
            alert(msg);
        });
    });
});
</script>


<br />
<h2>카카오페이 실행페이지</h2>
<br /><br />
<form method="get">
        <input type="text" name="amount" value="3000">
      <button id="imkakao" type="button" class="btn btn-primary">아임 서포트 결제 모듈 테스트 해보기</button>
</form>

</div>
</body>
</html>