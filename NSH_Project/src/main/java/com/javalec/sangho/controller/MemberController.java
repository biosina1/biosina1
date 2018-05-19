package com.javalec.sangho.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javalec.sangho.service.MemberService;
import com.javalec.sangho.vo.MemberVO;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value = "/join")
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
		return "join_login/join_Form";
	}

	@RequestMapping(value = "/checkId", method = RequestMethod.POST)
	public @ResponseBody int checkId(HttpServletRequest request, Model model) {
		String userid = request.getParameter("userid");
		System.out.println("userid :: " + userid);
		int result = service.checkId(userid);
		System.out.println("result :: " + result);
		return result;
	}

	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String checkId(MemberVO vo, Model model) {
		service.insert(vo);
		return "redirect:/login_Form";
	}


	// @RequestMapping(value = "/delete", method = RequestMethod.POST)
	// public String checkId(MemberVO vo, Model model) {
	// }

}
