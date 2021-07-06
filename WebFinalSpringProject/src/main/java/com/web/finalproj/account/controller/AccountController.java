package com.web.finalproj.account.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.web.finalproj.account.dto.AccountDTO;
import com.web.finalproj.account.service.AccountService;

import com.web.finalproj.board.dto.BoardDTO;

@Controller
@RequestMapping(value = "/account")

public class AccountController {
	
	@Autowired
	private AccountService account;
	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join() {
		return "account/join";
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(Model m, @ModelAttribute AccountDTO dto) throws Exception {
		String forward = "";
		
		// 서비스의 join 메서드 호출
		boolean result = account.join(dto);
		
		if(result) {
			// 가입 성공 했을 때 로그인 페이지로 리다이렉트
			forward = "redirect:/account/login";
		} else {
			// 가입 실패 했을 때 회원가입 페이지 재전송
			m.addAttribute("data", dto);
			m.addAttribute(forward);
			forward = "account/join";
		}
		
		return forward;
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "account/login";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Model m, @ModelAttribute AccountDTO dto, HttpServletRequest req) throws Exception {
		String forward = "";
		account.login(dto);
		
		if(dto.getId() > 0) {
			// dto.getId() 값이 0 보다 큰 경우 로그인 성공
			HttpSession session = req.getSession();
			session.setAttribute("account", dto);
			session.setAttribute("logined", true);
			forward = "redirect:/board";  //주소이름으로 하고 싶으면 redirect: 붙이기
		} else {
			// dto.getId() 값이 0 보다 크지 않은 경우 로그인 실패
			m.addAttribute("data", dto);
			m.addAttribute("error", "로그인 실패");
			forward = "account/login";
		}
		
		return forward;
	}
	
	@RequestMapping(value = "/logout")
	public ModelAndView logout(HttpSession session) {
		session.invalidate();
		ModelAndView mv = new ModelAndView("redirect:/");
		return mv;
	}
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String userDetail(Model m, @ModelAttribute AccountDTO dto) throws Exception {
		AccountDTO data = account.accountInfoDetail(dto);
		m.addAttribute("data", data);
		return "user/detail";
	}

	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String userDetail(Model m, @ModelAttribute AccountDTO dto, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		int id = ((AccountDTO)session.getAttribute("account")).getId();
		dto.setId(id);
		
		AccountDTO data = account.accountInfoDetail(dto);
		m.addAttribute("data", data);
		
		List<BoardDTO> writelist = account.findlist(dto.getId());
		List<BoardDTO> zzimlist = account.zzimlist(dto.getId());
		m.addAttribute("writelist", writelist);
		m.addAttribute("zzimlist", zzimlist);
		
		return "account/mypage";
	}
	
	/*회원정보 수정*/
	@RequestMapping(value= "/memberupdate", method = RequestMethod.GET)
	public String memberupdate(Model m, @ModelAttribute AccountDTO dto, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		int id = ((AccountDTO)session.getAttribute("account")).getId();
		dto.setId(id);
		String email = ((AccountDTO)session.getAttribute("account")).getEmail();
		dto.setEmail(email);
		
		AccountDTO data = account.accountInfoDetail(dto);
		m.addAttribute("data", data);
		return "account/memberupdate";
	}
	
	@RequestMapping(value= "/memberupdate", method = RequestMethod.POST)
	public String memberupdate( @ModelAttribute AccountDTO dto, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		
		account.memberUpdate(dto);
		session.invalidate();
		
		return "redirect:/account/login";
	}
	
}
