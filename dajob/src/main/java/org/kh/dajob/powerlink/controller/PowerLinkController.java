package org.kh.dajob.powerlink.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kh.dajob.member.controller.MemberController;
import org.kh.dajob.member.model.vo.Member;
import org.kh.dajob.powerlink.model.service.PowerLinkService;
import org.kh.dajob.powerlink.model.vo.PowerLink;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PowerLinkController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private PowerLinkService powerlinkService;
	
	@RequestMapping(value="powerlink.do", method=RequestMethod.GET)
	public String powerlinkInfo(HttpSession session, HttpServletRequest request){
		Member m = (Member)session.getAttribute("member");
		String memberId = m.getMember_id();
		PowerLink pl = powerlinkService.selectId(memberId);
		System.out.println(pl);
		if(pl != null){
			request.setAttribute("powerlink", pl);
			System.out.println(pl);
		}else{
			
		}
		return "powerlink/powerlinkInfo";
	}
	@RequestMapping(value="powerLink_offer.do", method=RequestMethod.GET)
	public String powerlinkOffer(HttpSession session, HttpServletRequest request){
		/*Member m = (Member)session.getAttribute("member");
		String memberId = m.getMember_id();
		PowerLink pl = powerlinkService.selectId(memberId);
		System.out.println(pl);
		if(pl != null){
			request.setAttribute("powerlink", pl);
			System.out.println(pl);
		}else{
			
		}*/
		return "powerlink/powerlink_offer";
	}

}
