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

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import item.ItemDAO;

@Controller
public class kakaoPayContoller {

	@RequestMapping("kakaopay")
	@ResponseBody
	public String kakaopay() {
		
		try {
			//요청 주소
			URL address = new URL("https://kapi.kakao.com/v1/payment/ready");
			//URL connection을 만들기 위한 강제 형변환
			HttpURLConnection connection = (HttpURLConnection) address.openConnection(); 
			//서버연결을 위한 POST방식으로 요청
			connection.setRequestMethod("POST");
			//Authorization이라는 특성에 직접 받은 KaKaoAK admin넣기
			connection.setRequestProperty("Authorization", "KakaoAK 8d0ba42fb4ca1001d7004e52945fc844");
			//ContentType 정의
			connection.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			//연결을 통해 서버에 전달할것이 있다면 true.
			connection.setDoOutput(true);
			
			String parameter="cid=TC0ONETIME&partner_order_id=partner_order_id"
					+"&approval_url=http://localhost:8081/"
					+"&fail_url=http://localhost:8081/"
					+"&cancel_urlhttp://localhost:8081/";
			//서버에 전달하기 위한
			OutputStream out = connection.getOutputStream();
			//데이터를 주는데, 서버에 전달한 out을 매개변수로 데이터를 준다.
			DataOutputStream data =new DataOutputStream(out);
			//파라미터를 형변환 해준다.
			data.writeBytes(parameter);
			//data주는 것을 그만 사용하겠다는 뜻 & 자동으로 flush해서 비워짐.
			data.close();			
			
			//실제로 통신함. 결과를 받아낸다.
			int  result = connection.getResponseCode();
			//받는애(in). 성공했다면 결과 값으로 200을 받음.
			InputStream in;
			if(result ==200) {
				in = connection.getInputStream();
				System.out.println("ajax 통신성공");
			}
			else {
				//에러를 받는다.
				in = connection.getErrorStream();
				System.out.println("ajax 통신실패");
			}
			System.out.println("result값은 "+result);
			//inRead(받는걸 읽는애)로 in(받는애)를 parameter로 받음 
			InputStreamReader inRead = new InputStreamReader(in); 
			//inRead를 형변환 해준다.
			BufferedReader change = new BufferedReader(inRead);
			System.out.println(parameter);
			return change.readLine();
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "";
	}
}
