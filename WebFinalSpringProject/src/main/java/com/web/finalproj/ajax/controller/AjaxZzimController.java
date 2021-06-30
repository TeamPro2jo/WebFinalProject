package com.web.finalproj.ajax.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.finalproj.account.dto.AccountDTO;
import com.web.finalproj.zzim.dto.ZzimDTO;
import com.web.finalproj.zzim.service.ZzimService;

@Controller
@RequestMapping("/ajax/board/")
public class AjaxZzimController {
	
	@Autowired
	ZzimService zzim;
	
	@RequestMapping(value = "/zzim", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	@ResponseBody
	public String zzim(@RequestParam int boardid, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		JSONObject json = new JSONObject();
		System.out.println("이거테스트중" + ((AccountDTO)session.getAttribute("account")).getId());
		int id = ((AccountDTO)session.getAttribute("account")).getId();
		ZzimDTO data = new ZzimDTO();
		data.setBid(boardid);
		data.setAid(id);
		boolean res = zzim.zzim(data);
		if(res) {
			System.out.println("t성공임!!!");
			boolean res2 = zzim.remove(data);
			if(res2) {
				System.out.println("삭제까지 성공!!!");
				json.put("result", "delete");
			} else {
				json.put("result", "deletefail");
			}
		} else {
			System.out.println("결과값없음 ㅡㅡ");
			boolean res3 = zzim.add(data);
			if(res3) {
				System.out.println("찜하기 성공!!!");
				json.put("result", "update");
			} else {
				System.out.println("대체왜 실패");
				json.put("result", "updatefail");
			}
		}
		return json.toJSONString();
	}
}
