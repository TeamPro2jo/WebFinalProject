package com.web.finalproj.account.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.finalproj.account.dto.AccountDTO;
import com.web.finalproj.account.repository.AccountRepositoryImpl;

import com.web.finalproj.board.dto.BoardDTO;
import com.web.finalproj.zzim.dto.ZzimDTO;

@Service
public class AccountServiceImpl implements AccountService {
	
	@Autowired
	AccountRepositoryImpl dao;

	@Override
	public boolean join(AccountDTO dto) throws Exception {
		return dao.insert(dto);
	}
	
	@Override
	public boolean checkNickname(String nickname) throws Exception {
		// 사용중인 닉네임을 찾는 기능
		// 사용중이면 true, 사용하지 않으면 false 반환
		boolean result = true;
		int rs = dao.usedNickname(nickname);
		if(rs <= 0) {
			result = false;
		}
		return result;
	}

	@Override
	public boolean checkEmail(String email) throws Exception {
		// 사용중인 id을 찾는 기능
		// 사용중이면 true, 사용하지 않으면 false 반환
		boolean result = true;
		int rs = dao.usedEmail(email);
		if(rs == 0) {
			result = false;
		}
		return result;
	}

	@Override
	public void login(AccountDTO dto) throws Exception {
		AccountDTO data = dao.checkUser(dto);
		if(data != null) {
			// 로그인 성공
			dto.setId(data.getId());
			dto.setName(data.getName());
			dto.setNickname(data.getNickname());
			dto.setEmail(data.getEmail());
			dto.setPwd("");		
		} else {
			dto.setId(-1);
			dto.setPwd("");
		}
	}

	@Override
	public AccountDTO accountInfoDetail(AccountDTO dto) throws Exception {
		// 비지니스 로직
		return dao.select(dto);
	}
	
	@Override
	public List<BoardDTO> findlist(int aid) throws Exception {
		List<BoardDTO> data = dao.writelist(aid);
		return data;
	}

	@Override
	public List<BoardDTO> zzimlist(int aid) throws Exception {
		List<BoardDTO> data = dao.zzimlist(aid);
		return data;
	}

	@Override
	public boolean memberUpdate(AccountDTO dto) throws Exception {
		return dao.update(dto);
	}
	
	@Override
	public boolean memberDelete(AccountDTO dto) throws Exception {
		return dao.delete(dto);
	}
}
