package com.javalec.sangho.controller;

import java.text.DateFormat;
import java.util.Date;
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
@RequestMapping(value = "/join")
public class JoinController {

	private static final Logger logger = LoggerFactory.getLogger(JoinController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 * 
	 * 
	 */
	
	@RequestMapping(value = "/join_Form", method = RequestMethod.GET)
	public String join_Form(Locale locale, Model model) {
		return "join_login/join_Form";
	}

}
