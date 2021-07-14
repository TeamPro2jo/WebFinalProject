package com.web.finalproj.account.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.finalproj.account.dto.AccountDTO;
import com.web.finalproj.board.dto.BoardDTO;
import com.web.finalproj.zzim.dto.ZzimDTO;

@Repository
public class AccountRepositoryImpl implements AccountRepository {
	
	@Autowired
	private SqlSession sqlSession;

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
		boolean result = false;
		int rs = sqlSession.update("accountMapper.updateAccount", dto);
		if(rs == 1) {
			result = true;
		}
		return result;
	}

	@Override
	public boolean delete(AccountDTO dto) throws Exception {
		boolean result = false;
		System.out.println("이거 테스트 " + dto.getEmail());
		AccountDTO data = sqlSession.selectOne("accountMapper.checkAccount", dto);
		if(data != null) {
			System.out.println("이거 테스트22 " + data.getEmail());
			int rs = sqlSession.delete("accountMapper.expireAccount", dto);
			if(rs == 1) {
				result = true;
			}
		}
		return result;
	}

	@Override
	public List<BoardDTO> writelist(int aid) throws Exception {
		return sqlSession.selectList("accountMapper.selectList", aid);
	}

	@Override
	public List<BoardDTO> zzimlist(int aid) {
		return sqlSession.selectList("accountMapper.zzimList", aid);
	}
}
