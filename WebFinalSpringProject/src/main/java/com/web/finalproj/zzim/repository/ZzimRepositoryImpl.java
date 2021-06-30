package com.web.finalproj.zzim.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.finalproj.zzim.dto.ZzimDTO;

@Repository
public class ZzimRepositoryImpl implements ZzimRepository{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public boolean zzimcheck(ZzimDTO dto) throws Exception {
		boolean res = false;
		ZzimDTO data = sqlSession.selectOne("zzimMapper.zzim", dto);
		if(data != null) {
			res = true;
		}
		return res;
	}
	
	@Override
	public boolean insert(ZzimDTO dto) throws Exception {
		boolean res = false;
		int seq = sqlSession.selectOne("zzimMapper.seq");
		if(seq > 0) {
			System.out.println("이값은 뭐야?" + seq);
			dto.setZid(seq);
			int result = sqlSession.insert("zzimMapper.update", dto);
			if(result == 1) {
				res = true;
			}
		}
		return res;
	}

	@Override
	public boolean delete(ZzimDTO dto) throws Exception {
		boolean res = false;
		int result = sqlSession.delete("zzimMapper.cancel", dto);
		if(result == 1) {
			res = true;
		}
		return res;
	}

	@Override
	public List<ZzimDTO> selectAll() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
