package com.web.finalproj.board.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.finalproj.board.dto.BoardDTO;
import com.web.finalproj.board.dto.BoardSearchDTO;


@Repository
public class BoardRepositoryImpl implements BoardRepository {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public BoardDTO select(BoardDTO dto) throws Exception {
		return sqlSession.selectOne("boardMapper.row", dto);
	}

	@Override
	public List<BoardDTO> selectAll() throws Exception {
		return sqlSession.selectList("boardMapper.all");
	}

	@Override
	public void selectAuthor(int aid) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void selectTitle(String title) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<BoardDTO> selectList(BoardDTO dto) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BoardDTO> selectList(BoardSearchDTO search) throws Exception {
		return sqlSession.selectList("boardMapper.boardSearch", search);
	}

	@Override
	public boolean insert(BoardDTO dto) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean update(BoardDTO dto) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delete(BoardDTO dto) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}
}
