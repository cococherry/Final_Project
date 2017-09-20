package org.kh.dajob.notice.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;

import org.kh.dajob.member.controller.MemberController;
import org.kh.dajob.member.model.service.MemberService;
import org.kh.dajob.notice.model.service.NoticeService;
import org.kh.dajob.notice.model.vo.Notice;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class NoticeController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping("nlist.do")
	public String noticeList(Model model, HttpServletRequest request){
		logger.info("noticeList() call...");
		//페이지 값 처리용
		int currentPage = 1;
		//한 페이지당 출력할 목록 갯수
		int limit = 8;
		int listCount = noticeService.getListCount();
		int maxPage = (int)((double)listCount / limit + 0.875);
		//전달된 페이지값 추출
		if(request.getParameter("page") != null)
			currentPage = Integer.parseInt(request.getParameter("page"));
		
		model.addAttribute("nlist",noticeService.selectNoticeList(currentPage, limit));
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("maxPage",maxPage);
		model.addAttribute("listCount", listCount);
		return "notice/noticeListView";
	}
	
	@RequestMapping("ntitle.do")
	public String noticeTitleList(Model model, HttpServletRequest request){
		logger.info("noticeTitleList() call...");
		//페이지 값 처리용
		int currentPage = 1;
		//한 페이지당 출력할 목록 갯수
		int limit = 8;
		int listCount = noticeService.getListCount();
		int maxPage = (int)((double)listCount / limit + 0.875);
		//전달된 페이지값 추출
		if(request.getParameter("page") != null)
			currentPage = Integer.parseInt(request.getParameter("page"));
		
		model.addAttribute("nlist",noticeService.selectNoticeTitle(request.getParameter("s")));
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("maxPage",maxPage);
		model.addAttribute("listCount", listCount);
		return "notice/noticeListView";
	}
		
	@RequestMapping("ninsertView.do")
	public String noticeInsertView(){
		logger.info("noticeInsertView() call...");
		
		return "notice/noticeInsertView";
	}
	
	@RequestMapping("ndetail.do")
	public String noticeDetailView(Model model, HttpServletRequest request, @RequestParam("notice_no") String notice_no){
		logger.info("noticeDetailView() call...");
		//페이지 값 처리용
		int currentPage = 1;
		
		if(request.getParameter("page") != null)
			currentPage = Integer.parseInt(request.getParameter("page"));
		//System.out.println(noticeService.selectOne(request.getParameter("notice_no")));
		model.addAttribute("notice",noticeService.selectOne(notice_no));
		//model.addAttribute("mlist",memberService.selectMemberAll());
		model.addAttribute("noticeReply",noticeService.selectReplyList(notice_no));
		model.addAttribute("currentPage",currentPage);
		return "notice/noticeDetailView";
	}
	
	@RequestMapping(value = "ninsert.do", method = RequestMethod.POST)
	public ModelAndView noticeInsert(Notice n, ModelAndView model){
		logger.info("noticeInsert() call...");
		//페이지 값 처리용
		System.out.println(n);
		int result = noticeService.insertNotice(n);
		if(result > 0) {
			model.setViewName("redirect:nlist.do");
		} else {
			model.addObject("msg", "공지사항 등록 실패!");
			model.setViewName("404-page");
		}
		return model;
	}
	
	@RequestMapping(value = "nupdateView.do", produces = "text/plain;charset=UTF-8")
	public ModelAndView noticeUpdateView(@RequestParam("notice_no") String notice_no, ModelAndView mv){
		logger.info("noticeUpdateView() call...");
		Notice result = noticeService.selectOne(notice_no);
		if(result != null) {
			mv.addObject("notice", result);
			mv.setViewName("notice/noticeUpdateView");
		} else {
			mv.addObject("msg", "공지사항 수정 페이지 로드 실패!!");
			mv.setViewName("404-page");
		}
		return mv;
	}
	
	@RequestMapping("nupdate.do")
	public ModelAndView noticeUpdate(Notice n, ModelAndView mv){
		logger.info("noticeUpdate() call...");
		int result = noticeService.updateNotice(n);
		Notice notice = noticeService.selectOne(n.getNotice_no());
		if(result > 0) {
			mv.addObject("notice", notice);
			mv.setViewName("redirect:nlist.do");
		} else {
			mv.addObject("msg", "공지사항 삭제 에러!!");
			mv.setViewName("404-page");
		}
		return mv;
	}
	
	@RequestMapping(value = "ndelete.do", produces = "text/plain;charset=UTF-8")
	public ModelAndView noticeDelete(@RequestParam("notice_no") String notice_no, ModelAndView mv) throws IOException{
		logger.info("noticeDelete() call...");
		int result = noticeService.deleteNotice(notice_no);
		if(result > 0) {
			mv.setViewName("redirect:nlist.do");
		} else {
			mv.addObject("msg", "공지사항 삭제 에러!!");
			mv.setViewName("404-page");
		}
		
		return mv;
	}
}
