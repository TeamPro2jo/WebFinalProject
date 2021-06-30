package com.web.finalproj.account.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.finalproj.account.dto.AccountDTO;

/**
 * 데이터베이스에 직접 연결되어 조작을 수행한다.
 */
@Repository		// bean에 등록
public class AccountRepositoryImpl implements AccountRepository {
	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public AccountDTO select(AccountDTO dto) throws Exception {
		return sqlSession.selectOne("accountMapper.selectAccount", dto);
	}
	
	@Override
	public int usedNickname(String nickname) throws Exception {
		return sqlSession.selectOne("accountMapper.checkNickname", nickname);
	}
	
	@Override
	public int usedEmail(String email) throws Exception {
		return sqlSession.selectOne("accountMapper.checkEmail", email);
	}
	
	@Override
	public AccountDTO checkUser(AccountDTO dto) throws Exception {
		return sqlSession.selectOne("accountMapper.checkLogin", dto);
	}
	
	@Override
	public boolean insert(AccountDTO dto) throws Exception {
		boolean result = false;
		int rs = sqlSession.insert("accountMapper.insertAccount", dto);
		if(rs == 1) {
			result = true;
		}
		return result;
	}
	
	@Override
	public boolean update(AccountDTO dto) throws Exception {
		return false;
	}
	
	@Override
	public boolean delete(AccountDTO dto) throws Exception {
		return false;
	}
	
}
