package com.web.finalproj.account.service;

import com.web.finalproj.account.dto.AccountDTO;

public interface AccountService {
	public AccountDTO accountInfoDetail(AccountDTO dto) throws Exception;
	public boolean join(AccountDTO dto) throws Exception;
	public boolean checkEmail(String email) throws Exception;
	public boolean checkNickname(String nickname) throws Exception;
	public void login(AccountDTO dto) throws Exception;
}
