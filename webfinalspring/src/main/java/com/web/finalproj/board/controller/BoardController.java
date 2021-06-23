package com.web.finalproj.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.web.finalproj.board.dto.BoardDTO;
import com.web.finalproj.board.dto.BoardSearchDTO;
import com.web.finalproj.board.service.BoardService;

@Controller
@RequestMapping(value = "/board")
public class BoardController {
	/**
	 * 빈 객체를 사용하여 BoardService 생성
	 */
	@Autowired
	private BoardService board;


	/**
	 * 게시판 메인 화면을 생성하기 위한 메서드
	 * /board 주소로 요청할 때 기능 동작
	 * /WEB-INF/views/board/main.jsp 로 포워딩 시킴
	 * @return
	 */
	@RequestMapping(value = "", method = RequestMethod.GET)
	public ModelAndView main(@ModelAttribute BoardSearchDTO search) throws Exception {
		// 전체 검색
		// 제목 검색
		// 작성자 검색
		// 게시판 구분 + 제목 검색
		// 게시판 구분 + 작성자 검색
		// @RequestParam, HttpServletRequest, @ModelAttribute
		ModelAndView mv = new ModelAndView();
		
		return mv;
	}
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public ModelAndView detail(@RequestParam int bid) throws Exception {
		ModelAndView mv = new ModelAndView("board/detail");

		return mv;
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public ModelAndView write() throws Exception {
		return null;
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String write(Model m, @ModelAttribute BoardDTO dto) throws Exception {
		String forward = "";
		
		boolean res = board.add(dto);
		
		if(res) {
			forward = "redirect:/board/detail?id=" + dto.getBid();
		} else {
			m.addAttribute("data", dto);
			forward = "board/add";
		}
		
		return forward;
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public ModelAndView modify(int id) throws Exception {
		ModelAndView mv = new ModelAndView("board/update");

		return mv;
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String modify(Model m, @ModelAttribute BoardDTO dto) throws Exception {
		String forward = "";
			
		return forward;
	}

	
	public ModelAndView delete(int id) {
		// TODO implement here
		return null;
	}

	
	public ModelAndView search(String title, int btype, int aid) {
		// TODO implement here
		return null;
	}

}
