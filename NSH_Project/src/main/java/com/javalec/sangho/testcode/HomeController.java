package com.javalec.sangho.testcode;

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
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(HttpServletRequest request, Locale locale, Model model) {
		return "body";
	}

	@RequestMapping(value = "/login_Form", method = RequestMethod.GET)
	public String login_Form(Locale locale, Model model) {
		return "join_login/login_Form";
	}

	@RequestMapping(value = "/join_Form", method = RequestMethod.GET)
	public String join_Form(Locale locale, Model model) {
		return "join_login/join_Form";
	}

	@RequestMapping(value = "/notice", method = RequestMethod.GET)
	public String notice(Locale locale, Model model) {
		return "menu/notice";
	}
	
	@RequestMapping(value = "/arduino", method = RequestMethod.GET)
	public String arduino(Locale locale, Model model) {
		return "menu/arduino";
	}

}
