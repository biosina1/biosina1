package com.javalec.sangho.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.spi.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.javalec.sangho.service.ProductService;
import com.javalec.sangho.service.ReplyService;
import com.javalec.sangho.vo.PageMakerVO;
import com.javalec.sangho.vo.PageVO;
import com.javalec.sangho.vo.ProductVO;
import com.javalec.sangho.vo.ReplyVO;

@Controller
@RequestMapping("/product")
public class ProductController {

	@Resource(name = "uploadPath")
	private String uploadPath;

	@Inject
	ServletContext context;

	@Inject
	private ProductService service;

	@RequestMapping(value = "/form", method = RequestMethod.GET)
	public String form(Model model) throws Exception {
		return "product/product_form";
	}

	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insert(HttpServletRequest request, ProductVO vo, MultipartFile file, MultipartFile file2, Model model)
			throws Exception {

		String attach_path = "/resources/image/";
		String p_img = attach_path + file.getOriginalFilename();
		String p_img2 = attach_path + file2.getOriginalFilename();

		System.out.println("p_img :: " + p_img);
		System.out.println("p_img2 :: " + p_img2);

		String path = uploadPath + attach_path;
		System.out.println("path ::" + path);

		vo.setP_img(p_img);
		vo.setP_img2(p_img2);

		service.insert(vo);

		String savedName = file.getOriginalFilename();
		String savedName2 = file2.getOriginalFilename();
		File target = new File(path, savedName);
		File target2 = new File(path, savedName2);
		FileCopyUtils.copy(file.getBytes(), target);
		FileCopyUtils.copy(file.getBytes(), target2);

		return "redirect:/product/form";
	}

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String listAll(@RequestParam("p_category") String p_category, PageVO vo, Model model) throws Exception {
		model.addAttribute("list", service.select(vo, p_category));
		/*
		 * PageMakerVO pagemaker = new PageMakerVO(); pagemaker.setPageVO(vo);
		 * pagemaker.setTotalCount(service.countPage(p_category));
		 * model.addAttribute("pageMaker", pagemaker);
		 */
		return "product/product_list";
	}
}
