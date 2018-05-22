package com.javalec.sangho.controller;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.javalec.sangho.service.MemberService;
import com.javalec.sangho.vo.LoginVO;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value = "/")
public class HomeController {

	@Inject
	MemberService service;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(HttpServletRequest request, Locale locale, Model model) throws Exception {
		return "body";
	}

	@RequestMapping(value = "/login_Form", method = RequestMethod.GET)
	public String login_Form(Locale locale, Model model) throws Exception {
		return "join_login/login_Form";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(HttpSession session, LoginVO vo, HttpServletResponse response) throws Exception {
		String returnURL = "";
		PrintWriter writer = response.getWriter();

		System.out.println(vo.getUserid());
		System.out.println(vo.getUserpw());

		int result = service.checkLogin(vo);

		if (result != 0) {
			session.setAttribute("userid", vo.getUserid());
			session.setAttribute("u_seq", result);
			returnURL = "redirect:/home";
		} else {
			writer.println("<script>alert(\"존재하지 않는 회원압니다.\");</script>");
			returnURL = "redirect:/login_Form";
		}

		return returnURL;
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session, HttpServletResponse response) throws Exception {
		session.removeAttribute("userid");
		return "redirect:/home";

	}

	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String ajaxTest() throws Exception {
		return "test";
	}
}
