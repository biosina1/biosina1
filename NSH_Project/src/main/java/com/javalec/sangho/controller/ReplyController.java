package com.javalec.sangho.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.javalec.sangho.service.ReplyService;
import com.javalec.sangho.vo.PageMakerVO;
import com.javalec.sangho.vo.PageVO;
import com.javalec.sangho.vo.ReplyVO;

@RestController
@RequestMapping("/reply")
public class ReplyController {
	@Inject
	private ReplyService service;

	@RequestMapping(value = "", method = RequestMethod.POST)
	public ResponseEntity<String> register(@RequestBody ReplyVO vo) {
		ResponseEntity<String> entity = null;
		System.out.println("테스트");
		try {
			service.insert(vo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@RequestMapping(value = "/all/{bno}", method = RequestMethod.GET)
	public ResponseEntity<List<ReplyVO>> list(@PathVariable("bno") int bno) {
		ResponseEntity<List<ReplyVO>> entity = null;

		try {
			entity = new ResponseEntity<>(service.list(bno), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	@RequestMapping(value = "/update/{seq}", method = { RequestMethod.PUT, RequestMethod.PATCH })
	public ResponseEntity<List<ReplyVO>> update(@RequestBody ReplyVO vo, @PathVariable("seq") int seq) {
		ResponseEntity<List<ReplyVO>> entity = null;

		try {
			vo.setSeq(seq);
			service.update(vo);
			entity = new ResponseEntity<>(HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	@RequestMapping(value = "/delete/{seq}", method = RequestMethod.DELETE)
	public ResponseEntity<String> delete(@PathVariable("seq") int seq) {
		ResponseEntity<String> entity = null;
		try {
			service.delete(seq);
			entity = new ResponseEntity<>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@RequestMapping(value = "/{bno}/{page}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> listPage(@PathVariable("bno") int bno, @PathVariable("page") int page) {
		ResponseEntity<Map<String, Object>> entity = null;
		try {
			PageVO pagevo = new PageVO();
			pagevo.setPage(page);

			PageMakerVO vo = new PageMakerVO();
			vo.setPageVO(pagevo);

			Map<String, Object> map = new HashMap<>();
			List<ReplyVO> list = service.listPage(bno, pagevo);

			map.put("list", list);

			int count = service.count(bno);
			vo.setTotalCount(count);
			map.put("pageMaker", vo);

			entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}


}
