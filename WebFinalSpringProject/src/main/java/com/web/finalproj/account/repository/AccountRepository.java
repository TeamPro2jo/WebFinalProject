package com.web.finalproj.account.repository;

import java.util.List;

import com.web.finalproj.account.dto.AccountDTO;
import com.web.finalproj.board.dto.BoardDTO;
import com.web.finalproj.zzim.dto.ZzimDTO;

public interface AccountRepository {
	public AccountDTO select(AccountDTO dto) throws Exception;
	public int usedEmail(String email) throws Exception;
	public int usedNickname(String nickname) throws Exception;
	public AccountDTO checkUser(AccountDTO dto) throws Exception;
	public boolean insert(AccountDTO dto) throws Exception;
	public boolean update(AccountDTO dto) throws Exception;
	public boolean delete(AccountDTO dto) throws Exception;
	public List<BoardDTO> writelist(int aid) throws Exception;
	public List<BoardDTO> zzimlist(int aid) throws Exception;
}
