package org.kh.dajob.member.controller;

import java.io.*;
import java.net.URLEncoder;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.json.simple.JSONObject;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	private String fileName = null;
	
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
	/*
	@RequestMapping(value = "/fileUpload", method = RequestMethod.GET)
	   public String dragAndDrop(Model model) {
	       return "fileUpload";
	   }
	    */
	   @SuppressWarnings("unchecked")
	@RequestMapping(value = "fileUpload.do") //ajax에서 호출하는 부분
	   @ResponseBody // 결과를 응답 페이지에 담아 보냄
	   public String upload(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws UnsupportedEncodingException { //Multipart로 받는다.
		   //String member_id = multipartRequest.getParameter("member_id");
		   multipartRequest.setCharacterEncoding("UTF-8");
		   response.setContentType("application/json");
		   
		   String fileFullPath = "";
		      
	       Iterator<String> itr =  multipartRequest.getFileNames();
	       String root = multipartRequest.getSession().getServletContext().getRealPath("resources");
	       String savePath = root + "\\images\\userImage"; //설정파일로 뺀다.
	       logger.info("root : "+root);
	       logger.info("savePath : "+savePath);
	       while (itr.hasNext()) { //받은 파일들을 모두 돌린다.
	            
	           /* 기존 주석처리
	           MultipartFile mpf = multipartRequest.getFile(itr.next());
	           String originFileName = mpf.getfileName();
	           System.out.println("FILE_INFO: "+originFileName); //받은 파일 리스트 출력'
	           */
	    	    
	           MultipartFile mpf = multipartRequest.getFile(itr.next());
	           
	           fileName = mpf.getOriginalFilename(); //파일명
	           
	           File folder = new File(savePath + "\\tmp");
	           
	           if(folder.exists()) {
	        	   logger.info(folder.getName()+" Folder Already Exists..");
	        	   logger.info("Folder Destroy and Create new Files Process Start..");
	        	   File[] innerFiles = folder.listFiles();
	        	   logger.info("innerFile Counts are "+innerFiles.length);
	        	   for(File f : innerFiles){
	                   f.delete(); 
	               }
	        	   logger.info("innerFiles delete Complete");
	        	   folder.delete();
	           }
	           folder.mkdir();  // 폴더가 없다면 생성하세요~
	           logger.info("folder : "+folder);
	           //logger.info("need Folder : "+folder+"\\"+member_id);
	           
	           fileFullPath = folder+"\\"+fileName; //파일 전체 경로
           		try {
               //파일 저장
        	   		mpf.transferTo(new File(fileFullPath)); //파일저장 실제로는 service에서 처리
                
        	   		logger.info("fileName => "+fileName);
        	   		logger.info("fileFullPath => "+fileFullPath);
               } catch (Exception e) {
            	   logger.info("postTempFile_ERROR======>"+fileFullPath);
            	   e.printStackTrace();
               }
           }
	       
	       JSONObject jsonObj = new JSONObject();
	       jsonObj.put("path",URLEncoder.encode(fileFullPath , "UTF-8"));
	       
	   return jsonObj.toString();
       //return fileFullPath;
       }
	   
	@RequestMapping(value = "userEnroll.do", method = RequestMethod.POST)
	public String userInsert(HttpServletRequest request, Model model) throws IOException{
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
		
		String member_profile_img = request.getParameter("member_profile_img");
		if (member_profile_img == null) {
			member_profile_img = "default.jpg";
		} else {
			File originFolder = new File(member_profile_img);
			File renameFolder = new File(member_profile_img.replace("tmp\\", member_id+"\\"));
			logger.info("origin : "+member_profile_img);
			logger.info("rename : "+member_profile_img.replace("tmp\\", member_id+"\\"));
			if(!originFolder.renameTo(renameFolder)) {
				FileUtils.moveFile(originFolder, renameFolder);
			}
			member_profile_img = renameFolder.getPath();
		}
		member_profile_img = member_id+"/"+member_profile_img.substring(member_profile_img.lastIndexOf('\\')+1);
		
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
				member_name,member_email,member_phone,member_address,member_profile_img));
		if (result > 0) {
			result = memberService.insertUser(new User(member_id, gender, birthday, null, null));
			
			if(result > 0) {
				
				if(request.getParameter("certCnt") != null && certCnt > 0) {
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
	public String compInsert(HttpServletRequest request, Model model) throws IOException{
		logger.info("compInsert() call...");
		request.setCharacterEncoding("utf-8");
		String returnPage = null;
		
		String member_id = request.getParameter("member_id");
		String member_password = request.getParameter("member_password");
		String member_name = request.getParameter("member_name");
		String member_phone = request.getParameter("member_phone");
		
		String member_profile_img = request.getParameter("member_profile_img");
		if (member_profile_img == null) {
			member_profile_img = "default.jpg";
		} else {
			File originFolder = new File(member_profile_img);
			File renameFolder = new File(member_profile_img.replace("tmp\\", member_id+"\\"));
			logger.info("origin : "+member_profile_img);
			logger.info("rename : "+member_profile_img.replace("tmp\\", member_id+"\\"));
			if(!originFolder.renameTo(renameFolder)) {
				FileUtils.moveFile(originFolder, renameFolder);
			}
			member_profile_img = renameFolder.getPath();
		}
		member_profile_img = member_id+"/"+member_profile_img.substring(member_profile_img.lastIndexOf('\\')+1);
		
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
				member_name,member_email,member_phone,member_address, member_profile_img));
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
	
	@RequestMapping("userUpdate.do")
	public String userUpdate(HttpServletRequest request, Model model, HttpSession session) throws UnsupportedEncodingException{
		logger.info("userUpdate() call...");
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
		
		int result = memberService.updateMember(new Member(member_id,member_password,"U",
				member_name,member_email,member_phone,member_address,"default.jpg"));
		if (result > 0) {
			result = memberService.updateUser(new User(member_id, gender, birthday, null, null));
			
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
	
	@RequestMapping("compUpdate.do")
	public String compUpdate(HttpServletRequest request, Model model, HttpSession session) throws UnsupportedEncodingException{
		logger.info("compUpdate() call...");
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
				model.addAttribute("message", "기업 정보 수정 실패!!");
				returnPage = "member/memberError";
			}
		} else {
			model.addAttribute("message", "회원 수정 서비스 실패!!");
			returnPage = "member/memberError";
		}
		
		return returnPage;
	}
	
	@RequestMapping("mdelete.do")
	public String memberDelete(HttpSession session, Model model){
		logger.info("memberDelete() call...");
		Member m = (Member)session.getAttribute("member");
		Member delM = memberService.loginMember(m);
		
		int result = 0;
		String returnPage = null;
		if(m != null){			
			result = memberService.deleteMember(m.getMember_id());
			if (result > 0) {
				// 회원 탈퇴 시 관련 이미지 폴더도 삭제
				String root = session.getServletContext().getRealPath("resources");
			    String savePath = root + "\\images\\userImage"; //설정파일로 뺀다.
			       
				File memberImg = new File(savePath+"\\"+delM.getMember_id());
				System.out.println(memberImg.getPath());
				if(memberImg.exists()) {
		        	   logger.info(memberImg.getName()+" Folder Delete Start..");
		        	   logger.info("Folder Destroy and Create new Files Process Start..");
		        	   File[] innerFiles = memberImg.listFiles();
		        	   logger.info("innerFile Counts are "+innerFiles.length);
		        	   for(File f : innerFiles){
		                   f.delete(); 
		               }
		        	   logger.info("innerFiles delete Complete");
		        	   memberImg.delete();
		           }
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
	//마이페이지
	
		@RequestMapping(value = "resume.do")
		public String resumeGo(HttpSession session, Model model) {
			User user = memberService.selectUser((Member)session.getAttribute("member"));
			
			if(user != null){
				model.addAttribute("user", user);
				model.addAttribute("countCert", certService.countCert(((Member)session.getAttribute("member")).getMember_id()));
				model.addAttribute("certList", certService.selectUserCertList((Member)session.getAttribute("member")));
				model.addAttribute("myCertList", certService.selectMyCertList((Member)session.getAttribute("member")));
			} else {
				
			}
			
			return "mypage/resume";
		}
		
		@RequestMapping(value = "ability.do")
		public String abilityGo(HttpSession session, Model model) {
			User user = memberService.selectUser((Member)session.getAttribute("member"));
			
			if(user != null){
				model.addAttribute("user", user);
				model.addAttribute("countCert", certService.countCert(((Member)session.getAttribute("member")).getMember_id()));
				model.addAttribute("certList", certService.selectUserCertList((Member)session.getAttribute("member")));
				model.addAttribute("myCertList", certService.selectMyCertList((Member)session.getAttribute("member")));
			} else {
				
			}
			
			return "mypage/ability";
		}
}