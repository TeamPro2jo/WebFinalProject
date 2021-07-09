package com.web.finalproj.chat.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import com.web.finalproj.chat.dao.ChatDAO;
import com.web.finalproj.chat.vo.ChatRoomVO;
import com.web.finalproj.chat.vo.MessageVO;

@Controller
@RequestMapping(value = "/chatting")
public class ChatController {
	
	@Autowired
	private ChatDAO dao;
	
	@Autowired
	private AccountService account;
	

	@RequestMapping(value = "/chatlist", method = RequestMethod.GET)
	public String chatlist(Model m, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		int id = ((AccountDTO)session.getAttribute("account")).getId();
		
		List<ChatRoomVO> chatlist = dao.getRoomList(id);
		
		m.addAttribute("chatlist", chatlist);
		
		return "chat/chatlist";
	}
	
	@RequestMapping(value = "/chatroom", method = RequestMethod.GET)
	public String chatroom(Model m, int partid, @ModelAttribute AccountDTO dto, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		int myid = ((AccountDTO)session.getAttribute("account")).getId();

		dto.setId(myid);
		AccountDTO mydto = account.accountInfoDetail(dto);
		
		dto.setId(partid);
		AccountDTO partdto = account.accountInfoDetail(dto);
		
		System.out.print("myid="+myid+" partid="+partid);
		
		m.addAttribute("myaccount", mydto);
		m.addAttribute("partaccount", partdto);
		
		return "chat/chatroom";
	}
}