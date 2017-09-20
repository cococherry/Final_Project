package org.kh.dajob.workhere.controller;


import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kh.dajob.member.model.service.MemberService;
import org.kh.dajob.workhere.model.service.WorkhereService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WorkhereController {

	@Autowired
	private WorkhereService workhereService;
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value = "jobList.do")
	public String jobList(HttpSession session, Model model) throws IOException {
		model.addAttribute("workherelist",workhereService.selectWorkhereList() );
		
		return "workhere/joblist";
	}
	
	@RequestMapping(value = "skillList.do")
	public String skillList(HttpSession session, Model model) throws IOException {
		model.addAttribute("workherelist",workhereService.selectWorkhereList() );
		
		return "workhere/skilllist";
	}

	@RequestMapping(value = "workhereDetail.do")
	public String workhereDetail(HttpSession session, HttpServletRequest request, Model model) throws IOException {
		model.addAttribute("workhere", workhereService.selectWorkhere(request.getParameter("workhere_no")));
		model.addAttribute("comtype", memberService.selectCompanyList());
		return "workhere/workheredetail";
	}
}
