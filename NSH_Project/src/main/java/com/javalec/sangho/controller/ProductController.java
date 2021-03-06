package com.javalec.sangho.controller;

import java.io.File;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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

import com.javalec.sangho.service.MemberService;
import com.javalec.sangho.service.ProductService;
import com.javalec.sangho.service.ReplyService;
import com.javalec.sangho.vo.CartListVO;
import com.javalec.sangho.vo.CartVO;
import com.javalec.sangho.vo.OrderProductVO;
import com.javalec.sangho.vo.OrderVO;
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
	@Inject
	private MemberService service2;

	@RequestMapping(value = "/form", method = RequestMethod.GET)
	public String form(Model model) throws Exception {
		return "product/product_form";
	}

	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insert(HttpServletRequest request, ProductVO vo, @RequestParam("file") MultipartFile file,
			@RequestParam("file2") MultipartFile file2, Model model) throws Exception {

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
		FileCopyUtils.copy(file2.getBytes(), target2);

		return "redirect:/product/form";
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(@RequestParam("p_img") String img, @RequestParam("p_img2") String img2,
			HttpServletRequest request, ProductVO vo,
			@RequestParam(value = "file", defaultValue = "") MultipartFile file,
			@RequestParam(value = "file2", defaultValue = "") MultipartFile file2, Model model) throws Exception {
		String attach_path = "/resources/image/";
		String path = uploadPath + attach_path;
		System.out.println(vo.getP_category());
		if (file.getOriginalFilename().equals("")) {
			vo.setP_img(img);

		} else {
			String p_img = attach_path + file.getOriginalFilename();
			System.out.println(p_img);
			vo.setP_img(p_img);
			String savedName = file.getOriginalFilename();
			File target = new File(path, savedName);
			FileCopyUtils.copy(file.getBytes(), target);
		}

		if (file2.getOriginalFilename().equals("")) {
			vo.setP_img2(img2);

		} else {
			String p_img2 = attach_path + file2.getOriginalFilename();
			vo.setP_img2(p_img2);
			String savedName2 = file2.getOriginalFilename();
			File target2 = new File(path, savedName2);
			FileCopyUtils.copy(file2.getBytes(), target2);
		}

		service.update(vo);

		return "redirect:/product/list?p_category=" + vo.getP_category();
	}

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String listAll(@RequestParam("p_category") String p_category, PageVO vo, Model model) throws Exception {

		vo.setPerPageNum(12);
		model.addAttribute("p_category", p_category);
		model.addAttribute("list", service.select(vo, p_category));
		PageMakerVO pagemaker = new PageMakerVO();
		pagemaker.setPageVO(vo);
		pagemaker.setTotalCount(service.countPage(p_category));
		model.addAttribute("pageMaker", pagemaker);
		model.addAttribute("category", p_category);
		return "product/product_list";
	}

	@RequestMapping(value = "/content", method = RequestMethod.GET)
	public String content(@RequestParam("seq") int seq, Model model) throws Exception {
		service.hitup(seq);
		model.addAttribute("product", service.content(seq));
		return "product/product_content";
	}

	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String modify(@RequestParam("seq") int seq, Model model) throws Exception {
		System.out.println(seq);
		model.addAttribute("product", service.content(seq));
		return "product/product_modify";
	}

	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(@RequestParam("seq") int seq, Model model) throws Exception {
		service.delete(seq);
		return "redirect:/home";
	}

	// 장바구니
	@RequestMapping(value = "/insertcart", method = RequestMethod.POST)
	public void insertcart(CartVO vo, Model model, HttpServletResponse response) throws Exception {
		System.out.println(vo.getCount());
		System.out.println(vo.getP_seq());
		System.out.println(vo.getSeq());
		System.out.println(vo.getU_seq());

		service.insertCart(vo);
		PrintWriter out = response.getWriter();
		out.print("<script>");
		out.print("alert('Add Cart Success');");
		out.print("history.back();");
		out.print("</script>");
	}

	@RequestMapping(value = "/updatecart", method = RequestMethod.POST)
	public String updatecart(CartVO vo, Model model) throws Exception {
		service.updateCart(vo);
		return "redirect:/product/selectcart?u_seq=" + vo.getU_seq();
	}

	@RequestMapping(value = "/deletecart", method = RequestMethod.POST)
	public String deletecart(@RequestParam("seq") int seq, Model model, HttpSession session) throws Exception {
		int u_seq = (int) session.getAttribute("u_seq");
		service.deleteCart(seq);
		return "redirect:/product/selectcart?u_seq=" + u_seq;
	}

	@RequestMapping(value = "/selectcart", method = RequestMethod.GET)
	public String selectcart(Model model, HttpSession session) throws Exception {
		int u_seq = (int) session.getAttribute("u_seq");
		System.out.println(u_seq);
		model.addAttribute("user", service2.userinfo(u_seq));
		model.addAttribute("list", service.selectCart(u_seq));
		return "product/product_cart";
	}

	@RequestMapping(value = "/addorder", method = RequestMethod.POST)
	public void addorder(HttpServletResponse response, HttpServletRequest request, OrderVO vo, Model model,
			HttpSession session) throws Exception {
		PrintWriter out = response.getWriter();

		// 주문번호 = 현재시간
		java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyyMMddHHmmss", java.util.Locale.KOREA);
		Long orderNum = Long.parseLong(formatter.format(new java.util.Date()));

		int u_seq = (int) session.getAttribute("u_seq");
		vo.setU_seq(u_seq);
		vo.setOrderNum(orderNum);
		service.addorder(vo);

		String[] p_seq = request.getParameterValues("p_seq");
		String[] count = request.getParameterValues("count");

		OrderProductVO ordervo[] = new OrderProductVO[p_seq.length];
		for (int i = 0; i < p_seq.length; i++) {
			ordervo[i] = new OrderProductVO();
			ordervo[i].setU_seq(u_seq);
			ordervo[i].setP_seq(Integer.parseInt(p_seq[i]));
			ordervo[i].setOrderNum(orderNum);
			ordervo[i].setOrder_count(Integer.parseInt(count[i]));
			service.order_product(ordervo[i]);
		}

		service.deleteCart2(u_seq);

		out.print("<script>");
		out.print("alert('Order Success');");
		out.print("location.href='/home';");
		out.print("</script>");
	}

	@RequestMapping(value = "/orderlist", method = RequestMethod.GET)
	public String orderlist(Model model, HttpSession session) throws Exception {
		int u_seq = (int) session.getAttribute("u_seq");
		model.addAttribute("order", service.order(u_seq));
		model.addAttribute("orderp", service.orderp(u_seq));
		return "order/order_list";
	}

	@RequestMapping(value = "/allorderlist", method = RequestMethod.GET)
	public String allorderlist(Model model) throws Exception {
		model.addAttribute("order", service.allorderlist());
		return "order/order_modify";
	}

	@RequestMapping(value = "/orderupdate", method = RequestMethod.GET)
	public String orderupdate(@RequestParam("orderNum") long orderNum, @RequestParam("status") String status,
			Model model) throws Exception {
		System.out.println(orderNum);
		System.out.println(status);
		service.orderupdate(orderNum, status);
		return "redirect:/product/allorderlist";
	}
}
