package com.kosmo.finalMe;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import point.PointDAO;
import point.PointDTO;

@Controller
public class EmoticonController {
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
	
}
