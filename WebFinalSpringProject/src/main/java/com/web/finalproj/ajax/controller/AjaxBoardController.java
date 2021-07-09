package com.web.finalproj.ajax.controller;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.finalproj.board.service.BoardService;

@Controller
@RequestMapping("/ajax/board")
public class AjaxBoardController {

	@Autowired
	BoardService board;
	
	@RequestMapping(value = "/delete", method = RequestMethod.POST
			, produces = "application/json; charset=utf-8")
		@ResponseBody	
		public String boardDelete(@RequestParam int bid) throws Exception {
			boolean res = board.remove(bid);
			
			// response.setContentType("application/json; charset=utf-8");
			JSONObject json = new JSONObject();
			if(res) {
				json.put("res", "success");
				json.put("redirect", "");
			} else {
				json.put("res", "fail");
			}
			return json.toJSONString();
		}
}
