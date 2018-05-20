package com.javalec.sangho.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.javalec.sangho.service.BoardService;
import com.javalec.sangho.vo.BoardVO;
import com.javalec.sangho.vo.PageMakerVO;
import com.javalec.sangho.vo.PageVO;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value = "/board")
public class BoardController {

	@Inject
	private BoardService service;

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	// 공지사항 목록 출력
	@RequestMapping(value = "/notice_list", method = RequestMethod.GET)
	public String notice_list(PageVO vo, Model model) throws Exception {
		logger.debug("board list....");
		model.addAttribute("notice_list", service.listPage2(vo));
		PageMakerVO pagemaker = new PageMakerVO();
		pagemaker.setPageVO(vo);
		pagemaker.setTotalCount(service.pageCount(vo));
		model.addAttribute("pageMaker", pagemaker);

		return "board/notice_list";
	}

	// 공지사항 폼 출력
	@RequestMapping(value = "/notice_form", method = RequestMethod.GET)
	public String notice_form(Model model) throws Exception {
		return "board/notice_form";
	}

	// 공지사항 게시물 생성
	@RequestMapping(value = "/notice_create", method = RequestMethod.POST)
	public String notice_create(HttpServletRequest request, BoardVO vo, Model model) throws Exception {
		request.setCharacterEncoding("utf-8");
		logger.debug("board create....");
		service.create(vo);
		return "redirect:/board/notice_list";
	}

	// 공지사항 내용 출력
	@RequestMapping(value = "/notice_content", method = RequestMethod.GET)
	public String notice_content(@RequestParam("seq") int seq, Model model) throws Exception {
		logger.debug("board content....");
		System.out.println("------------------------------ :: " + seq);
		service.hitup(seq);
		model.addAttribute("notice_content", service.read(seq));
		return "board/notice_content";
	}

	// 공지사항 삭제
	@RequestMapping(value = "/notice_delete", method = RequestMethod.POST)
	public String notice_remove(@RequestParam("seq") int seq, Model model) throws Exception {
		logger.debug("board delete....");
		service.delete(seq);
		return "redirect:/board/notice_list";
	}

	// 공지사항 수정 폼
	@RequestMapping(value = "/notice_modify_form", method = RequestMethod.GET)
	public String notice_modify_form(@RequestParam("seq") int seq, Model model) throws Exception {
		logger.debug("board modify_form....");
		model.addAttribute("notice_content", service.read(seq));
		return "board/notice_modify";
	}

	// 공지사항 수정
	@RequestMapping(value = "/notice_modify", method = RequestMethod.POST)
	public String notice_modify(BoardVO vo, Model model) throws Exception {
		logger.debug("board modify....");
		service.update(vo);
		int seq = vo.getSeq();
		return "redirect:/board/notice_content?seq=" + seq;
	}	
}
