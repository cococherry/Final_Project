package org.kh.dajob.interview.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.GregorianCalendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections.bag.SynchronizedSortedBag;
import org.apache.commons.lang.ObjectUtils;
import org.kh.dajob.interview.model.service.InterviewService;
import org.kh.dajob.interview.model.vo.Interview;
import org.kh.dajob.member.model.service.MemberService;
import org.kh.dajob.member.model.vo.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sun.media.sound.SoftSynthesizer;

@Controller
public class InterviewController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private InterviewService interviewService;
	
	@RequestMapping(value = "interviewList.do")
	public String interviewList(HttpSession session, Model model) throws IOException {
		model.addAttribute("interviewlist", interviewService.selectInterviewList((Member)session.getAttribute("member")));
		return "interview/interviewlist";
	}
	
	@RequestMapping(value = "interviewCompanyList.do")
	public String interviewCompanyList(HttpSession session, Model model) throws IOException {
		model.addAttribute("interviewlist", interviewService.selectInterviewList((Member)session.getAttribute("member")));
		return "interview/interviewcompanylist";
	}
	
	@RequestMapping(value = "interviewInsert.do")
	public String interviewInsert(HttpSession session, Model model) throws IOException {
		model.addAttribute("company", memberService.selectCompany((Member)session.getAttribute("member")));
		model.addAttribute("interviewlist", interviewService.selectInterviewList((Member)session.getAttribute("member")));
		return "interview/interviewinsert";
	}
	
	@RequestMapping(value = "interviewDetail.do")
	public String interviewDetail(HttpSession session, HttpServletRequest request, Model model) throws IOException {
		model.addAttribute("interview", interviewService.selectInterview(request.getParameter("interview_no")));
		return "interview/interviewdetail";
	}
	
	@RequestMapping(value = "interviewDelete.do")
	public String interviewDelete(HttpSession session, Model model) throws IOException {
		model.addAttribute("company", memberService.selectCompany((Member)session.getAttribute("member")));
		model.addAttribute("interviewlist", interviewService.selectInterviewList((Member)session.getAttribute("member")));
		return "interview/interviewDetail";
	}
	
	@RequestMapping(value = "interviewUpdate.do")
	public String interviewUpdate(HttpSession session, Model model,HttpServletRequest request) throws IOException {
		model.addAttribute("company", memberService.selectCompany((Member)session.getAttribute("member")));
		model.addAttribute("interviewlist", interviewService.selectInterviewList((Member)session.getAttribute("member")));
		String date = request.getParameter("paymentTime");
		Date paymentTime = new Date(
				new GregorianCalendar(Integer.parseInt(date.substring(0, 4)), Integer.parseInt(date.substring(4, 6)),
						Integer.parseInt(date.substring(6, 8)), Integer.parseInt(date.substring(8, 10)),
						Integer.parseInt(date.substring(10, 12))).getTimeInMillis());
		
		return "interview/interviewlist";
	}
	
	@RequestMapping(value = "interviewUpdateView.do")
	public String interviewUpdateView(HttpSession session,HttpServletRequest request, Model model) throws IOException {
		
		model.addAttribute("interview", interviewService.selectInterview(request.getParameter("interview_no")));
		Date startdate = interviewService.selectInterview(request.getParameter("interview_no")).getInterview_start_date();
		Date enddate = interviewService.selectInterview(request.getParameter("interview_no")).getInterview_end_date();
		SimpleDateFormat startdateformat = new SimpleDateFormat("yyyy년 MM월 dd일 hh:mm");
		SimpleDateFormat enddateformat = new SimpleDateFormat("yyyy년 MM월 dd일 hh:mm");
		System.out.println(startdate.getTime());
		System.out.println(startdateformat.format(startdate));
		model.addAttribute("startdate", startdateformat.format(startdate));
		model.addAttribute("enddate", enddateformat.format(enddate));
		return "interview/interviewupdate";
	}
}
