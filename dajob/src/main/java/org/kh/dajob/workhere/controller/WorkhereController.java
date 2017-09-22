package org.kh.dajob.workhere.controller;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kh.dajob.member.model.service.MemberService;
import org.kh.dajob.workhere.model.service.WorkhereService;
import org.kh.dajob.workhere.model.vo.Workhere;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javafx.scene.control.Alert;

@Controller
public class WorkhereController {

	@Autowired
	private WorkhereService workhereService;
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value = "jobList.do")
	public String jobList(HttpSession session, Model model, HttpServletRequest request) throws IOException {

		int currentPage = 1;
		//한 페이지당 출력할 목록 갯수
		int limit = 8;
		int listCount = workhereService.getListCount();
		int maxPage = (int)((double)listCount / limit + 0.875);
		//전달된 페이지값 추출
		if(request.getParameter("page") != null)
			currentPage = Integer.parseInt(request.getParameter("page"));
		model.addAttribute("workherelist",workhereService.selectWorkhereList(currentPage, limit));
		model.addAttribute("comtype", memberService.selectCompanyList());
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("maxPage",maxPage);
		model.addAttribute("listCount", listCount);
		return "workhere/joblist";
	}
	
	@RequestMapping(value = "skillList.do")
	public String skillList(HttpSession session, Model model, HttpServletRequest request) throws IOException {
		int currentPage = 1;
		//한 페이지당 출력할 목록 갯수
		int limit = 8;
		int listCount = workhereService.getListCount();
		int maxPage = (int)((double)listCount / limit + 0.875);
		//전달된 페이지값 추출
		if(request.getParameter("page") != null)
			currentPage = Integer.parseInt(request.getParameter("page"));
		model.addAttribute("workherelist",workhereService.selectWorkhereList(currentPage, limit));
		model.addAttribute("comtype", memberService.selectCompanyList());
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("maxPage",maxPage);
		model.addAttribute("listCount", listCount);
		return "workhere/skilllist";
	}

	@RequestMapping(value = "workhereDetail.do")
	public String workhereDetail(HttpSession session, HttpServletRequest request, Model model) throws IOException {
		Workhere wh = workhereService.selectWorkhere(request.getParameter("workhere_no"));
		String[] skill = wh.getWork_skill().split(" ");
		model.addAttribute("workhere", wh);
		model.addAttribute("skill", skill);
		
		return "workhere/workheredetail";
	}
	
	@RequestMapping(value = "workhereDelete.do")
	public String workhereDelete(HttpServletRequest request,HttpServletResponse response, Model model) throws IOException {
		String workhere = workhereService.selectWorkhere(request.getParameter("workhere_no")).getWork_no();
		int result = workhereService.deleteWorkhere(workhere);
		PrintWriter pw = response.getWriter();
		if(result > 0) {
			pw.write(notice_repno);
			pw.flush();
		} else {
			pw.write("fail");
			pw.flush();
		}
		return "index";
	}
	
}
