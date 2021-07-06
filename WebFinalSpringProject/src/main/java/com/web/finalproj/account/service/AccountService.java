package com.web.finalproj.account.service;

import java.util.List;

import com.web.finalproj.account.dto.AccountDTO;
import com.web.finalproj.board.dto.BoardDTO;
import com.web.finalproj.zzim.dto.ZzimDTO;

public interface AccountService {
	public AccountDTO accountInfoDetail(AccountDTO dto) throws Exception;
	public boolean join(AccountDTO dto) throws Exception;
	public boolean checkEmail(String email) throws Exception;
	public boolean checkNickname(String nickname) throws Exception;
	public void login(AccountDTO dto) throws Exception;
	public List<BoardDTO> findlist(int aid) throws Exception;
	public List<BoardDTO> zzimlist(int aid) throws Exception;
	public boolean memberUpdate(AccountDTO dto) throws Exception;
}
