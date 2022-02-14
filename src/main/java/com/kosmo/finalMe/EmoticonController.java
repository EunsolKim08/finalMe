package com.kosmo.finalMe;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import point.JdbcTemplateConst;
import point.PointDAO;
import point.PointDTO;

@Controller
public class EmoticonController {
	private JdbcTemplate template;
	@Autowired
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
		System.out.println("@Autowired -> JDBCTemplate 연결 성공");
		
		JdbcTemplateConst.template = this.template;
	}
	
	private PointDAO dao;
	
	//이모티콘 디스플레이 페이지
	@RequestMapping("/emoticon/displayEmoticon.do")
	public String displayEmoticon() {
		return "emoticon/display";
	}
	//이모티콘 구매과정
	@RequestMapping("/emoticon/buyProcess.do")
	public String buyProcess(HttpServletRequest request, PointDTO pdto, Model model) {
		//String pr = request.getParameter("pr"); //여기까지는 pr이 넘어오지만, model을 통해서는 pr값을 넘길 수 없음.
		//String sticker = request.getParameter("sticker"); //PointDAO에 정의되어있기때문에 pr이 넘어감
	
		model.addAttribute("pdto",pdto);
		
		return "emoticon/buyProcess";
	}
	
	//카카오페이 실행 연습페이지
	@RequestMapping("/emoticon/practice.do")
	public String payPractice() {
		return "emoticon/practice";
	}
	
	//카카오페이 실행 연습페이지
	@RequestMapping("/emoticon/kakaopayPage.do")
	public String kakaopayPage() {
		return "emoticon/kakaopay";
	}
	
	@GetMapping("kakaopay")
	@ResponseBody
	public String kakaopay() {
	try {
		URL address = new URL("https://kapi.kakao.com/v1/payment/ready");
		HttpURLConnection connection = (HttpURLConnection) address.openConnection(); // 서버연결
		connection.setRequestMethod("POST");    
		connection.setRequestProperty("Authorization", "KakaoAK 8d0ba42fb4ca1001d7004e52945fc844"); // 어드민 키
		connection.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		connection.setDoOutput(true); // 서버한테 전달할게 있는지 없는지
		
		String parameter = "cid=TC0ONETIME" // 가맹점 코드
				+ "&partner_order_id=partner_order_id" // 가맹점 주문번호
				+ "&partner_user_id=partner_user_id" // 가맹점 회원 id
				+ "&item_name=point" // 상품명
				+ "&quantity=1" // 상품 수량
				+ "&total_amount=1000" // 총 금액
				+ "&vat_amount=200" // 부가세
				+ "&tax_free_amount=0" // 상품 비과세 금액
				+ "&approval_url=http://localhost:8081/" // 결제 성공 시
				+ "&fail_url=http://localhost:8081/"; // 결제 실패 시
		
		OutputStream send = connection.getOutputStream(); 
		DataOutputStream dataSend = new DataOutputStream(send); 
		dataSend.writeBytes(parameter); 
		dataSend.close(); // 
		
		int result = connection.getResponseCode();
		InputStream receive;
		
		if(result == 200) {
			receive = connection.getInputStream();
		}else {
			receive = connection.getErrorStream();
		}
		
		InputStreamReader read = new InputStreamReader(receive);
		BufferedReader change = new BufferedReader(read);
		
		return change.readLine();
	} catch (MalformedURLException e) {	
		e.printStackTrace();
	} catch (IOException e) {		
		e.printStackTrace();
	}
			

	return "";
		
	}
	
	
	
	@GetMapping("kakaopay2")
	@ResponseBody
	public String kakaopay2() {
		try {
			// 보내는 부분
			URL address = new URL("https://kapi.kakao.com/v1/payment/ready");
			HttpURLConnection connection = (HttpURLConnection) address.openConnection(); // 서버연결
			connection.setRequestMethod("POST");
			connection.setRequestProperty("Authorization", "KakaoAK 63bd19fc59dc0fc8b0e8cd0d4b0ab64e"); // 어드민 키
			connection.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			connection.setDoOutput(true); // 서버한테 전달할게 있는지 없는지
			String parameter = "cid=TC0ONETIME" // 가맹점 코드
					+ "&partner_order_id=partner_order_id" // 가맹점 주문번호
					+ "&partner_user_id=partner_user_id" // 가맹점 회원 id
					+ "&item_name=초코파이" // 상품명
					+ "&quantity=1" // 상품 수량
					+ "&total_amount=5000" // 총 금액
					+ "&vat_amount=200" // 부가세
					+ "&tax_free_amount=0" // 상품 비과세 금액
					+ "&approval_url=http://localhost:8000/" // 결제 성공 시
					+ "&fail_url=http://localhost:8000/" // 결제 실패 시
					+ "&cancel_url=http://localhost:8000/"; // 결제 취소 시
			OutputStream send = connection.getOutputStream(); // 이제 뭔가를 를 줄 수 있다.
			DataOutputStream dataSend = new DataOutputStream(send); // 이제 데이터를 줄 수 있다.
			dataSend.writeBytes(parameter); // OutputStream은 데이터를 바이트 형식으로 주고 받기로 약속되어 있다. (형변환)
			dataSend.close(); // flush가 자동으로 호출이 되고 닫는다. (보내고 비우고 닫다)
			
			int result = connection.getResponseCode(); // 전송 잘 됐나 안됐나 번호를 받는다.
			InputStream receive; // 받다
			
			if(result == 200) {
				receive = connection.getInputStream();
			}else {
				receive = connection.getErrorStream(); 
			}
			// 읽는 부분
			InputStreamReader read = new InputStreamReader(receive); // 받은걸 읽는다.
			BufferedReader change = new BufferedReader(read); // 바이트를 읽기 위해 형변환 버퍼리더는 실제로 형변환을 위해 존제하는 클레스는 아니다.
			// 받는 부분
			return change.readLine(); // 문자열로 형변환을 알아서 해주고 찍어낸다 그리고 본인은 비워진다.
			
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "";
	}

	
}
