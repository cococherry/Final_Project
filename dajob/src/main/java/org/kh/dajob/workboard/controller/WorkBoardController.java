package org.kh.dajob.workboard.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kh.dajob.member.model.service.MemberService;
import org.kh.dajob.member.model.vo.Member;
import org.kh.dajob.workboard.model.vo.WorkBoard;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class WorkBoardController {

	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value = "likeCompList.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String likeCompList(HttpSession session, Model model, HttpServletRequest request){
		String returnPage = null;
		Member m = (Member)session.getAttribute("member");
		String memberId = m.getMember_id();
		
		int page = 1;
		int limit = 10;
		if(request.getParameter("page") != null){
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		int listCount = memberService.getListCount(memberId);
		int maxPage = (int)((double)listCount / limit + 0.9);
		int startPage = (((int)((double)page / limit + 0.9)) - 1) * limit + 1;
		int endPage = startPage + limit - 1;
    
		if(maxPage < endPage){
			endPage = maxPage;
		}
		
		ArrayList<WorkBoard> list = memberService.likeCompList(memberId, page);
		if(list != null){
			request.setAttribute("list", list);
			request.setAttribute("page", page);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("maxPage", maxPage);
			returnPage = "workboard/likeListBoard";
		}
		return returnPage;
	}
}