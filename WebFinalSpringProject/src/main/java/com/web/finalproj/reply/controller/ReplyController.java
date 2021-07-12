package com.web.finalproj.reply.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.web.finalproj.account.dto.AccountDTO;
import com.web.finalproj.board.dto.BoardDTO;
import com.web.finalproj.reply.service.ReplyService;
import com.web.finalproj.reply.vo.ReplyVO;

@RestController
@RequestMapping("/reply")
public class ReplyController {

	@Inject
	ReplyService replyService;

	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public void insert(@ModelAttribute ReplyVO vo, HttpSession session) {
		int aid = ((AccountDTO) session.getAttribute("account")).getId();
		String aname = ((AccountDTO) session.getAttribute("account")).getNickname();

		vo.setAid(aid);
		vo.setAname(aname);
		replyService.create(vo);
	}

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView replyList(@RequestParam int bid, ModelAndView mv) {
		List<ReplyVO> list = replyService.list(bid);

		mv.setViewName("board/reply");
		mv.addObject("list", list);

		return mv;
	}

}