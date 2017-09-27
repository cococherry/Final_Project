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
	public ModelAndView interviewDelete(ModelAndView model, HttpServletRequest request) throws ParseException{
		
		int result = interviewService.deleteInterview(request.getParameter("interview_no"));
		if(result > 0) {
			model.setViewName("redirect:interviewList.do");
		} else {
			model.addObject("msg", "인터뷰 삭제 실패!");
			model.setViewName("404-page");
		}
		return model;
	}
	
	@RequestMapping(value="interviewUpd.do")
	public ModelAndView interviewUpd(ModelAndView model){
		/*String content = request.getParameter("content");
		String status = request.getParameter("status");
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm");
		java.util.Date date = df.parse(request.getParameter("start"));
		Timestamp startT = new Timestamp(date.getTime());
		System.out.println("start Time : "+startT);
		date = df.parse(request.getParameter("end"));
		Timestamp endT = new Timestamp(date.getTime());
		System.out.println("end Time : "+endT);
		System.out.println(startT);
		System.out.println(endT);
		System.out.println(content);
		System.out.println(status);
		
		int result = interviewService.updateInterview(new Interview(content,startT,endT,status));
		
		if(result > 0) {
			model.setViewName("redirect:interviewList.do");
		} else {
			model.addObject("msg", "공지사항 등록 실패!");
			model.setViewName("404-page");
		}
		*/
		model.setViewName("redirect:index.do");
		return model;
	}
	
	@RequestMapping(value = "interviewUpdateView.do")
	public String interviewUpdateView(HttpSession session,HttpServletRequest request, Model model) throws IOException {
		
		model.addAttribute("interview", interviewService.selectInterview(request.getParameter("interview_no")));
		Timestamp startdate = interviewService.selectInterview(request.getParameter("interview_no")).getInterview_start_date();
		Timestamp enddate = interviewService.selectInterview(request.getParameter("interview_no")).getInterview_end_date();
		SimpleDateFormat startdateformat = new SimpleDateFormat("yyyy년 MM월 dd일 hh:mm");
		SimpleDateFormat enddateformat = new SimpleDateFormat("yyyy년 MM월 dd일 hh:mm");
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
		i.setInterview_start_date(startT);
		i.setInterview_end_date(endT);
		System.out.println("Request Interview Info : "+i);
		
		int result = interviewService.insertInterview(i);
		if(result > 0) {
			model.setViewName("redirect:interviewList.do");
		} else {
			model.addObject("msg", "공지사항 등록 실패!");
			model.setViewName("404-page");
		}
		
	
		return model;
	}
}
