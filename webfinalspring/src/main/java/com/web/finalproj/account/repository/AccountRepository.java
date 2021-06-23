package com.web.finalproj.account.repository;

import com.web.finalproj.account.dto.AccountDTO;

public interface AccountRepository {
	public AccountDTO select(AccountDTO dto) throws Exception;
	public int usedEmail(String email) throws Exception;
	public int usedNickname(String nickname) throws Exception;
	public AccountDTO checkUser(AccountDTO dto) throws Exception;
	public boolean insert(AccountDTO dto) throws Exception;
	public boolean update(AccountDTO dto) throws Exception;
	public boolean delete(AccountDTO dto) throws Exception;
}
