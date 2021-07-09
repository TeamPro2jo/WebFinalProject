package com.web.finalproj.board.controller;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.web.finalproj.zzim.service.ZzimService;
import com.web.finalproj.board.dto.BoardSearchDTO;
import com.web.finalproj.account.dto.AccountDTO;
import com.web.finalproj.account.service.AccountService;
import com.web.finalproj.board.dto.BoardDTO;
import com.web.finalproj.board.service.BoardService;
import com.web.finalproj.zzim.dto.ZzimDTO;

@Controller
@RequestMapping(value = "/board")
public class BoardController {

	@Autowired
	private BoardService board;
	
	@Autowired
	private AccountService account;
	
	@Autowired
	ZzimService zzim;
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public ModelAndView main() throws Exception {
		
		ModelAndView mv = new ModelAndView();
		
		List<BoardDTO> boardlist = null;
		boardlist = board.findAll();
		mv.setViewName("board/main");
		mv.addObject("boardlist", boardlist);
		
		return mv;
	}
	
	@RequestMapping(value = "", method = RequestMethod.POST)
	public ModelAndView main(@ModelAttribute BoardSearchDTO search, HttpServletRequest request) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		
		List<BoardDTO> boardlist = null;
		String[] typeList = request.getParameterValues("type");
		String[] areaList = request.getParameterValues("area");
		String[] statList = request.getParameterValues("stat");
		String[] dealList = request.getParameterValues("deal");
		search.setTypeList(typeList);
		search.setAreaList(areaList);
		search.setStatList(statList);
		search.setDealList(dealList);
		
		if((search.getSearchType() == null || search.getSearchType().equals("선택"))
				&& search.getArea() == null && search.getType() == null
				&& search.getStat() == null && search.getDeal() == null) {
			boardlist = board.findAll();
		} else {
			boardlist = board.findList(search);
			String typecheck = Arrays.toString(typeList).replace("[", "").replace("]", "").replace(" ", "");
			mv.addObject("typecheck", typecheck);
			String areacheck = Arrays.toString(areaList).replace("[", "").replace("]", "").replace(" ", "");
			mv.addObject("areacheck", areacheck);
			String statcheck = Arrays.toString(statList).replace("[", "").replace("]", "").replace(" ", "");
			mv.addObject("statcheck", statcheck);
			String dealcheck = Arrays.toString(dealList).replace("[", "").replace("]", "").replace(" ", "");
			mv.addObject("dealcheck", dealcheck);
		}
		mv.setViewName("board/main");
		mv.addObject("boardlist", boardlist);
		
		return mv;
	}
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public ModelAndView datail(@RequestParam int bid, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		ModelAndView mv = new ModelAndView("board/detail");
		mv.addObject("item", board.findId(bid));
		if(session.getAttribute("account") != null) {
			int aid = ((AccountDTO)session.getAttribute("account")).getId();
			ZzimDTO data = new ZzimDTO();
			data.setBid(bid);
			data.setAid(aid);
			boolean res = zzim.zzim(data);
			if(res) {
				mv.addObject("zzimcheck", true);
			} else {
				mv.addObject("zzimcheck", false);
			}
		}
		
		return mv;
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public ModelAndView write() throws Exception {
		ModelAndView mv = new ModelAndView("board/add");
		return mv;
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String write(Model m, @ModelAttribute BoardDTO dto) throws Exception {
		String forward = "";
		
		boolean res = board.add(dto);
		
		if(res) {
			forward = "redirect:/board/detail?bid=" + dto.getBid();
		} else {
			m.addAttribute("data", dto);
			forward = "board/add";
		}
		
		return forward;
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public ModelAndView modify(int bid) throws Exception {
		ModelAndView mv = new ModelAndView("board/update");
		mv.addObject("item", board.findId(bid));
		return mv;
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String modify(Model m, @ModelAttribute BoardDTO dto) throws Exception {
		String forward = "";
		
		System.out.print(dto.toString());
		
		boolean res = board.update(dto);
		
		if(res) {
			forward = "redirect:/board/detail?bid=" + dto.getBid();
		} else {
			m.addAttribute("item", dto);
			forward = "board/update";
		}
		
		return forward;
	}

	/**
	 * @param id 
	 * @return
	 */
	public ModelAndView delete(int bid) {
		// TODO implement here
		return null;
	}

	/**
	 * @param title 
	 * @param btype 
	 * @param aid 
	 * @return
	 */
	public ModelAndView search(String title, int btype, int aid) {
		// TODO implement here
		return null;
	}

}
