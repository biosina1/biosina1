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
import com.javalec.sangho.service.ProductService;
import com.javalec.sangho.vo.LoginVO;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value = "/")
public class HomeController {

	@Inject
	MemberService service;
	@Inject
	ProductService pservice;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(Locale locale, Model model) throws Exception {
		model.addAttribute("newitem", pservice.newitem());
		model.addAttribute("hititem", pservice.hititem());
		return "body";
	}
}
