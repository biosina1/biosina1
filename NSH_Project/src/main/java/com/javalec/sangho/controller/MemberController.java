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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javalec.sangho.service.MemberService;
import com.javalec.sangho.vo.LoginVO;
import com.javalec.sangho.vo.MemberVO;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value = "/member")
public class MemberController {

	@Inject
	MemberService service;

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 * 
	 * 
	 */

	@RequestMapping(value = "/join_Form", method = RequestMethod.GET)
	public String join_Form(Model model) {
		return "member/join_Form";
	}

	@RequestMapping(value = "/checkId", method = RequestMethod.POST)
	public @ResponseBody int checkId(HttpServletRequest request, Model model) {
		String userid = request.getParameter("userid");
		int result = service.checkId(userid);
		return result;
	}

	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String checkId(MemberVO vo, Model model) {
		service.insert(vo);
		return "redirect:/login_Form";
	}

	@RequestMapping(value = "/modifyform", method = RequestMethod.GET)
	public String modifyform(HttpSession session, Model model) {
		int u_seq = (int) session.getAttribute("u_seq");
		model.addAttribute("user", service.userinfo(u_seq));
		return "member/user_modify";
	}

	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modify(MemberVO vo, Model model) {
		service.update(vo);
		return "redirect:/home";
	}

	@RequestMapping(value = "/orderlist", method = RequestMethod.GET)
	public String orderlist(MemberVO vo, Model model) {
		service.update(vo);
		return "redirect:/home";
	}
	// @RequestMapping(value = "/delete", method = RequestMethod.POST)
	// public String checkId(MemberVO vo, Model model) {
	// }

	// 로그인
	
	@RequestMapping(value = "/login_Form", method = RequestMethod.GET)
	public String login_Form(Model model) throws Exception {
		return "/member/l_Form";
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
			returnURL = "redirect:/member/login_Form";
		}

		return returnURL;
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session, HttpServletResponse response) throws Exception {
		session.removeAttribute("u_seq");
		session.removeAttribute("userid");
		return "redirect:/home";

	}

}
