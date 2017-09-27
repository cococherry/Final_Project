package org.kh.dajob.interview.controller;

import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.ParseException;
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
import org.kh.dajob.notice.model.vo.Notice;
import org.kh.dajob.notice.model.vo.NoticeReply;
import org.kh.dajob.workhere.model.service.WorkhereService;
import org.kh.dajob.workhere.model.vo.Workhere;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sun.media.sound.SoftSynthesizer;

@Controller
public class InterviewController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private WorkhereService workhereService;
	
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
		Timestamp startdate = interviewService.selectInterview(request.getParameter("interview_no")).getInterview_start_date();
		Timestamp enddate = interviewService.selectInterview(request.getParameter("interview_no")).getInterview_end_date();
		SimpleDateFormat startdateformat = new SimpleDateFormat("yyyy년 MM월 dd일 hh:mm");
		SimpleDateFormat enddateformat = new SimpleDateFormat("yyyy년 MM월 dd일 hh:mm");
		System.out.println(startdate.getTime());
		System.out.println(startdateformat.format(startdate));
		model.addAttribute("startdate", startdateformat.format(startdate));
		model.addAttribute("enddate", enddateformat.format(enddate));
		return "interview/interviewupdate";
	}
	
	@RequestMapping(value = "interviewInsertView.do")
	public String interviewInsertView(HttpSession session, Model model, HttpServletRequest request) throws IOException {
		model.addAttribute("workhere", workhereService.selectWorkhere(request.getParameter("workhere_no")));
		return "interview/interviewinsert";
	}
	
	@RequestMapping(value = "interviewInsert.do", method = RequestMethod.POST)
	public ModelAndView interviewInsert(Interview i, ModelAndView model, HttpServletRequest request) throws ParseException{
		
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm");
		java.util.Date date = df.parse(request.getParameter("start"));
		Timestamp startT = new Timestamp(date.getTime());
		System.out.println("start Time : "+startT);
		
		date = df.parse(request.getParameter("end"));
		Timestamp endT = new Timestamp(date.getTime());
		System.out.println("end Time : "+endT);
		
		model.setViewName("index.do");
		/*if(start.length() == 22) {
			if(start.substring(14,16) == "오전") {
			System.out.println(n1.parse(start.substring(2,4)+ "0" + start.substring(6,7)+ start.substring(9,11)+start.substring(17,19)+start.substring(20,22)));
			}
			else {
				int a = Integer.parseInt(start.substring(17,19));
				int b = a+12;
				String c = Integer.toString(b);
				System.out.println(n1.parse(start.substring(2,4)+ "0" + start.substring(6,7)+ start.substring(9,11)+ c +start.substring(20,22)));
				
			}
			
		}
		
			else if(start.length() == 23) {
				
				if(start.substring(15,17)=="오전") {
				System.out.println(n1.parse(start.substring(2,4)+ start.substring(6,8)+ start.substring(10,12)+start.substring(18,20)+start.substring(21,23)));
				}
				
				else {
					int a = Integer.parseInt(start.substring(18,20));
					int b = a+12;
					String c = Integer.toString(b);
					System.out.println(n1.parse(start.substring(2,4)+ start.substring(6,8)+ start.substring(10,12)+ c +start.substring(21,23)));
					
				}
				
			}
		
		if(end.length() == 22) {
			
			if(end.substring(14,16) == "오전") {
			System.out.println(n2.parse(end.substring(2,4)+ "0" + end.substring(6,7)+ end.substring(9,11)+end.substring(17,19)+end.substring(20,22)));
			}
			else {
				int a = Integer.parseInt(end.substring(17,19));
				int b = a+12;
				String c = Integer.toString(b);
				System.out.println(n2.parse(end.substring(2,4)+ "0" + end.substring(6,7)+ end.substring(9,11)+ c +end.substring(20,22)));
			}
			
		}
			else if(end.length() == 23) {
				if(end.substring(15,17) == "오전") {
				System.out.println(n2.parse(end.substring(2,4)+ end.substring(6,8)+ end.substring(10,12)+end.substring(18,20)+end.substring(21,23)));
				}
				else {
					int a = Integer.parseInt(end.substring(18,20));
					int b = a+12;
					String c = Integer.toString(b);
					System.out.println(n2.parse(end.substring(2,4)+ end.substring(6,8)+ end.substring(10,12)+ c +end.substring(21,23)));
				}
			}*/
		
		/*int result = interviewService.insertInterview(i);
		if(result > 0) {
			model.setViewName("redirect:interviewList.do");
		} else {
			model.addObject("msg", "공지사항 등록 실패!");
			model.setViewName("404-page");
		}
		return model;*/
		return model;
	}
}
