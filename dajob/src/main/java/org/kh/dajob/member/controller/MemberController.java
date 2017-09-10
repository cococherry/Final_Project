package org.kh.dajob.member.controller;

import java.io.*;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kh.dajob.cert.model.service.CertService;
import org.kh.dajob.cert.model.vo.UserCert;
import org.kh.dajob.member.model.service.MemberService;
import org.kh.dajob.member.model.vo.Company;
import org.kh.dajob.member.model.vo.Member;
import org.kh.dajob.member.model.vo.User;
import org.kh.dajob.workboard.model.vo.WorkBoard;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private CertService certService;
	
	@RequestMapping(value = "login.do", method = RequestMethod.POST)
	public void loginMember(Member m, HttpSession session, HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=utf-8;");
		logger.info("loginMember() call...");
		PrintWriter chk = response.getWriter();

		Member member = memberService.loginMember(m);
		if(member != null){
			session.setAttribute("member", member); 
			chk.append("ok");
			chk.flush();
		} else {
			chk.append("no");
			chk.flush();
		}
		chk.close();
	}
	
	@RequestMapping("logout.do")
	public String logoutMember(HttpSession session){
		logger.info("logoutMember() call...");
		
		if(session.getAttribute("member") != null){			
			session.invalidate();
		}
		return "index";
	}
	
	@RequestMapping("enrollView.do")
	public String enrollView(Model model){
		logger.info("enrollView() call...");
		
		model.addAttribute("certList",certService.selectList());
		model.addAttribute("comTypeList",memberService.selectCompanyList());
		
		return "member/enroll";
	}
	
	@RequestMapping("myinfo.do")
	public String myinfoView(HttpSession session, Model model){
		logger.info("myinfoView() call...");
		Member m = (Member)session.getAttribute("member");
		String returnPage = null;
		
		if(m.getMember_type_code().equals("U")) {
			model.addAttribute("certVaules", certService.selectList());
			model.addAttribute("certList", certService.selectUserCertList(m));
			model.addAttribute("myinfo", memberService.selectUser(m));
			returnPage = "member/myinfo";
		} else if(m.getMember_type_code().equals("C")) {
			model.addAttribute("comType", memberService.selectCompanyList());
			model.addAttribute("myinfo", memberService.selectCompany(m));
			returnPage = "member/myinfo";
		} else {
			model.addAttribute("myinfo", memberService.loginMember(m));
			returnPage = "member/myinfo";
		}
		if(!returnPage.equals("member/myinfo")) {
			model.addAttribute("message", "회원 가입 서비스 실패!!");
			returnPage = "member/memberError";
		}
		
		return returnPage;
	}
	// 아이디 중복 체크
	@RequestMapping(value = "dupid.do", method = RequestMethod.POST)
	public void chkDupId(HttpServletRequest request, HttpServletResponse response) throws IOException{
		logger.info("chkDupId() call...");
		request.setCharacterEncoding("UTF-8");
		PrintWriter chk = response.getWriter();
		
		int result = memberService.checkIdDup(request.getParameter("userid"));
		
		if(result == 0){
			chk.append("ok");
			chk.flush();
		} else {
			chk.append("no");
			chk.flush();
		}
		chk.close();
	}
	
	@RequestMapping(value = "userEnroll.do", method = RequestMethod.POST)
	public String userInsert(HttpServletRequest request, Model model) throws UnsupportedEncodingException{
		logger.info("userInsert() call...");
		request.setCharacterEncoding("utf-8");
		String returnPage = null;
		
		String member_id = request.getParameter("member_id");
		String member_password = request.getParameter("member_password");
		String member_name = request.getParameter("member_name");
		String member_phone = request.getParameter("member_phone");
		String gender = request.getParameter("gender");
		Date birthday = Date.valueOf(request.getParameter("birthday"));
		int certCnt = Integer.parseInt(request.getParameter("certCnt"));
		
		StringBuilder sb = new StringBuilder();
		sb.append(request.getParameter("email1") + "@");
		sb.append(request.getParameter("email2"));
		String member_email = sb.toString();
		
		sb = new StringBuilder();
		sb.append(request.getParameter("post_code") + ",");
		sb.append(request.getParameter("addr1") + ",");
		sb.append(request.getParameter("addr2"));
		String member_address = sb.toString();
		
		// 유저의 자격증 정보 Map으로 취합
		Map<String, Object> map = null;
		
		int result = memberService.insertMember(new Member(member_id,member_password,"U",
				member_name,member_email,member_phone,member_address,"default.jpg"));
		if (result > 0) {
			result = memberService.insertUser(new User(member_id, gender, birthday, null, null));
			
			if(result > 0) {
				
				if(request.getParameter("certCnt") != null || certCnt > 0) {
					map = new HashMap<String, Object>();
					ArrayList<UserCert> list = new ArrayList<UserCert>();
					int i = 1;
					while(i < certCnt+1) {
						String cert_no = request.getParameter("cert"+i);
						Date cert_date = Date.valueOf(request.getParameter("certDate"+i));
						UserCert u = new UserCert(member_id, cert_no, cert_date);
						list.add(u);
						//map.put("cert_no", u);
						i++;
					}
					map.put("cert_no", list);
					result = certService.insertUserCert(map);
				} else {result = 1;}
				
				if(result > 0) {
					returnPage = "index";
				} else {
					model.addAttribute("message", "회원 자격증 정보 등록 실패!!");
					returnPage = "member/memberError";
				}
			} else {
				model.addAttribute("message", "회원 정보 등록 실패!!");
				returnPage = "member/memberError";
			}
		} else {
			model.addAttribute("message", "회원 가입 서비스 실패!!");
			returnPage = "member/memberError";
		}
		
		return returnPage;
	}
	
	@RequestMapping(value = "compEnroll.do", method = RequestMethod.POST)
	public String compInsert(HttpServletRequest request, Model model) throws UnsupportedEncodingException{
		logger.info("compInsert() call...");
		request.setCharacterEncoding("utf-8");
		String returnPage = null;
		
		String member_id = request.getParameter("member_id");
		String member_password = request.getParameter("member_password");
		String member_name = request.getParameter("member_name");
		String member_phone = request.getParameter("member_phone");
		
		StringBuilder sb = new StringBuilder();
		sb.append(request.getParameter("email1") + "@");
		sb.append(request.getParameter("email2"));
		String member_email = sb.toString();
		
		sb = new StringBuilder();
		sb.append(request.getParameter("post_code") + ",");
		sb.append(request.getParameter("addr1") + ",");
		sb.append(request.getParameter("addr2"));
		String member_address = sb.toString();
		
		String company_welfare = request.getParameter("company_wel");
		String company_name = request.getParameter("company_name");
		String company_type = request.getParameter("company_type");
		int company_staff = Integer.parseInt(request.getParameter("company_staff"));
		int company_capital = Integer.parseInt(request.getParameter("company_capital"));
		String company_code = request.getParameter("company_code");
		String company_tel = request.getParameter("company_tel");
		String company_fax = request.getParameter("company_fax");
		Date company_date = Date.valueOf(request.getParameter("company_date"));
		
		int result = memberService.insertMember(new Member(member_id,member_password,"C",
				member_name,member_email,member_phone,member_address,"default.jpg"));
		if (result > 0) {
			result = memberService.insertCompany(new Company(member_id, company_name, company_type, company_staff, company_capital, company_code, company_tel, company_fax, company_welfare, company_date));
			if(result > 0) {
				returnPage = "index";
			} else {
				model.addAttribute("message", "기업 정보 등록 실패!!");
				returnPage = "member/memberError";
			}
		} else {
			model.addAttribute("message", "회원 가입 서비스 실패!!");
			returnPage = "member/memberError";
		}
		
		return returnPage;
	}
	
	@RequestMapping("mupdate.do")
	public String memberUpdate(HttpServletRequest request, Model model, HttpSession session) throws UnsupportedEncodingException{
		logger.info("memberUpdate() call...");
		request.setCharacterEncoding("utf-8");
		String returnPage = null;
		
		String userId = request.getParameter("userid");		
		String userPwd = request.getParameter("userpwd");
		int age = Integer.parseInt(request.getParameter("age"));
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");

		StringBuilder sb = new StringBuilder();
		sb.append(request.getParameter("post") + ",");
		sb.append(request.getParameter("address1") + ",");
		sb.append(request.getParameter("address2"));
		String address = sb.toString();
		
		int result = memberService.updateMember(new Member());
		if (result > 0) {
			session.setAttribute("member", memberService.loginMember((Member)session.getAttribute("member")));
			returnPage = "index";
		} else {
			model.addAttribute("message", "회원 정보 수정 실패!!");
			returnPage = "member/memberError";
		}
		
		return returnPage;
	}
	
	@RequestMapping("mdelete.do")
	public String memberDelete(HttpSession session, Model model){
		logger.info("memberDelete() call...");
		Member m = (Member)session.getAttribute("member");
		int result = 0;
		String returnPage = null;
		if(m != null){			
			result = memberService.deleteMember(m.getMember_id());
			if (result > 0) {
				returnPage = "index";
				session.invalidate();
			} else {
				model.addAttribute("message", "회원 탈퇴 서비스 실패!!");
				returnPage = "member/memberError";
			}
		} else {
			model.addAttribute("message", "회원 탈퇴 불가, 정상적인 접속이 아닙니다.");
			returnPage = "member/memberError";
		}
		return returnPage;
	}
	
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