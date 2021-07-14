package com.web.finalproj.ajax.controller;

import java.util.List;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.finalproj.account.dto.AccountDTO;
import com.web.finalproj.account.service.AccountService;
import com.web.finalproj.chat.dao.ChatDAO;
import com.web.finalproj.chat.vo.ChatRoomVO;
import com.web.finalproj.chat.vo.MessageVO;

@Controller
@RequestMapping("/ajax/chat")
public class AjaxChatController {
	
	@Autowired
	ChatDAO dao;
	
	@Autowired
	AccountService account;
	
	@RequestMapping(value = "/recent", method = RequestMethod.GET
			, produces = "application/json; charset=utf-8")
		@ResponseBody	
		public String getRecentMsg(@RequestParam int roomid) throws Exception {
			MessageVO msg = dao.getRecentMessage(roomid);
			
			// response.setContentType("application/json; charset=utf-8");
			JSONObject json = new JSONObject();
			if(msg != null) {
				json.put("recent", msg.getMcontents());
				json.put("timestamp", msg.getSendtime());
			} else {
				json.put("recent", "no message");
			}
			return json.toJSONString();
		}
	
	@RequestMapping(value = "/unread", method = RequestMethod.GET
			, produces = "application/json; charset=utf-8")
		@ResponseBody	
		public String getUnReadCount(@RequestParam ChatRoomVO vo) throws Exception {
			ChatRoomVO roomVO = dao.isRoom(vo);
			int count = dao.getUnReadCount(roomVO.getMyid(), roomVO.getPartid());
			
			// response.setContentType("application/json; charset=utf-8");
			JSONObject json = new JSONObject();
			if(count < 0) {
				json.put("res", "fail");
			} else {
				json.put("res", count);
			}
			return json.toJSONString();
		}
	
	@RequestMapping(value = "/partname", method = RequestMethod.GET
			, produces = "application/json; charset=utf-8")
		@ResponseBody	
		public String getPartName(@RequestParam ChatRoomVO vo) throws Exception {
			int partid = vo.getPartid();
			AccountDTO dto = new AccountDTO();
			dto.setId(partid);
			String nickname = account.accountInfoDetail(dto).getNickname();
			
			// response.setContentType("application/json; charset=utf-8");
			JSONObject json = new JSONObject();
			if(nickname != null) {
				json.put("nickname", nickname);
			} 
			
			return json.toJSONString();
		}


}
