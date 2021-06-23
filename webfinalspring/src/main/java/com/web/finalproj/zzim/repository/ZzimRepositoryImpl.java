package com.web.finalproj.zzim.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.finalproj.zzim.dto.ZzimDTO;

public class ZzimRepositoryImpl implements ZzimRepository {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public boolean insert(ZzimDTO dto) throws Exception {
		boolean result = false;

		return result;
	}


	@Override
	public boolean delete(ZzimDTO dto) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<ZzimDTO> selectAll() throws Exception {
		List<ZzimDTO> data = sqlSession.selectList("zzimMapper.all");
		return data;
	}

}
