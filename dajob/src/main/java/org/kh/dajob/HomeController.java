package org.kh.dajob;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "index.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		return "index";
	}
	
	@RequestMapping(value = "contact.do")
	public String contactGo() {
		
		return "contact";
	}
	
	@RequestMapping(value = "resume.do")
	public String resumeGo() {
		
		return "mypage/resume";
	}
	
	@RequestMapping(value = "404-page.do")
	public String pageNotFound(HttpServletRequest request, Model model) throws IOException {
		request.setCharacterEncoding("UTF-8");
		model.addAttribute("msg", request.getParameter("message"));
		
		return "404-page";
	}
	
}
