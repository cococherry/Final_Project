package org.kh.dajob.workboard.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kh.dajob.interview.model.vo.Interview;
import org.kh.dajob.member.model.service.MemberService;
import org.kh.dajob.member.model.vo.Member;
import org.kh.dajob.workJobAndSkill.model.service.WorkJobAndSkillService;
import org.kh.dajob.workboard.model.service.WorkBoardService;
import org.kh.dajob.workboard.model.vo.WorkBoard;
import org.kh.dajob.workhere.model.service.WorkhereService;
import org.kh.dajob.workhere.model.vo.Workhere;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;



@Controller
public class WorkBoardController {

	@Autowired
	private WorkBoardService workboardService;
	
	@Autowired
	private WorkhereService workhereService;
	
	@Autowired
	private WorkJobAndSkillService workjobandskillservice;
	
	@Autowired
	private MemberService memberservice;
	
	@RequestMapping(value = "likeCompList.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String likeCompList(HttpSession session, HttpServletRequest request){
		String returnPage = null;
		Member m = (Member)session.getAttribute("member");
		String memberId = m.getMember_id();
		
		int page = 1;
		int limit = 10;
		if(request.getParameter("page") != null){
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		int listCount = workboardService.getListCount(memberId);
		int maxPage = (int)((double)listCount / limit + 0.9);
		int startPage = (((int)((double)page / limit + 0.9)) - 1) * limit + 1;
		int endPage = startPage + limit - 1;
    
		if(maxPage < endPage){
			endPage = maxPage;
		}
		
		ArrayList<WorkBoard> list = workboardService.likeCompList(memberId, page, limit);
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
	
	@RequestMapping("lsearch.do")
	public String searchTitleList(HttpSession session, HttpServletRequest request){
		String returnPage = null;
		Member m = (Member)session.getAttribute("member");
		
		int page = 1;
		int limit = 10;
		if(request.getParameter("page") != null){
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		WorkBoard w = new WorkBoard();
		w.setMember_id(m.getMember_id());
		w.setWork_writer(request.getParameter("comp"));
		
		int listCount = workboardService.getListCount(w);
		int maxPage = (int)((double)listCount / limit + 0.9);
		int startPage = (((int)((double)page / limit + 0.9)) - 1) * limit + 1;
		int endPage = startPage + limit - 1;
    
		if(maxPage < endPage){
			endPage = maxPage;
		}
		
		ArrayList<WorkBoard> list = workboardService.likeCompList(w, page, limit);
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
	@RequestMapping(value = "deleteLikeOne.do", method = RequestMethod.POST)
	public void deleteOne(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws IOException {
		Member m = (Member)session.getAttribute("member");
		String member_id = m.getMember_id();
		String workNo = request.getParameter("work_no");
		//System.out.println("work_no : " + workNo);
		WorkBoard w = new WorkBoard();
		w.setMember_id(member_id);
		w.setWork_no(workNo);
		PrintWriter chk = response.getWriter();
		int result = workboardService.deleteOne(w);
		if(result > 0){
			chk.append("success");
			chk.flush();
		}else{
			chk.append("fail");
			chk.flush();
		}
		chk.close();
	}
	
	@RequestMapping (value = "workboardInsertview.do")
	public String workboardInsertview(HttpSession session, Model model) {
		model.addAttribute("job", workjobandskillservice.selectJobList());
		model.addAttribute("skill", workjobandskillservice.selectSkillList());
		Member m = (Member)session.getAttribute("member");
		model.addAttribute("company", memberservice.selectCompany(m));
		return "workboard/workboardinsert";
	}
	
	@RequestMapping (value = "workboardUpdateview.do")
	public String workboardUpdateview(HttpSession session, Model model,HttpServletRequest request) {
		model.addAttribute("job", workjobandskillservice.selectJobList());
		model.addAttribute("skill", workjobandskillservice.selectSkillList());
		Member m = (Member)session.getAttribute("member");
		model.addAttribute("workhere", workhereService.selectWorkhere(request.getParameter("workhere_no")));
		return "workboard/workboardupdate";
	}
	
	
	@RequestMapping(value = "workboardInsert.do", method = RequestMethod.POST)
	public ModelAndView workboardInsert(@RequestParam("date") Date date, ModelAndView model, HttpServletRequest request) throws ParseException{
		
		java.util.Date sdate = null;
		java.util.Date edate = null;
		String title = request.getParameter("title");
		String content = request.getParameter("content");

       /* String dateInString = request.getParameter("date");
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-mm-dd");
       
        
		Date date=(Date) formatter.parse(dateInString);*/
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm");
		String writer = request.getParameter("writer");
		String job = request.getParameter("job");
		String skill = request.getParameter("skill");
		String career = request.getParameter("career");
		String workplace = request.getParameter("workplace");
		Timestamp startdate = null;
		Timestamp enddate = null;
		
		sdate = df.parse(request.getParameter("start")); 
		edate = df.parse(request.getParameter("end")); 
		startdate = new Timestamp(sdate.getTime());
		enddate = new Timestamp(edate.getTime());
		int result = workboardService.workboardInsert(new WorkBoard(title,content,writer,date,job,skill,career,workplace,startdate,enddate));
		if(result > 0) {
			model.setViewName("redirect:jobList.do");
		} else {
			model.addObject("msg", "워크보드 등록 실패!");
			model.setViewName("404-page");
		}
		
		return model;
	}
	
	@RequestMapping(value = "workboardUpdate.do", method = RequestMethod.POST)
	public ModelAndView workboardUpdate(ModelAndView model, HttpServletRequest request) throws ParseException{
		
		java.util.Date sdate = null;
		java.util.Date edate = null;
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		 SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm");
		String job = request.getParameter("job");
		String skill = request.getParameter("skill");
		String career = request.getParameter("career");
		String workplace = request.getParameter("workplace");
		Timestamp startdate = null;
		Timestamp enddate = null;
		
		sdate = df.parse(request.getParameter("start")); 
		edate = df.parse(request.getParameter("end")); 
		System.out.println(sdate);
		System.out.println(edate);
		startdate = new Timestamp(sdate.getTime());
		enddate = new Timestamp(edate.getTime());
		String no=request.getParameter("no");
		int result = workhereService.updateWorkhere(new Workhere(title,content,job, skill,career, workplace, startdate, enddate,no));
		if(result > 0) {
			model.setViewName("redirect:jobList.do");
		} else {
			model.addObject("msg", "워크보드 수정 실패!");
			model.setViewName("404-page");
		}
		
		return model;
	}
}