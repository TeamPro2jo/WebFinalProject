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
		BoardDTO data = sqlSession.selectOne("boardMapper.row", dto);
		return data;
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
		// 동적 SQL를 사용하여 게시판 종류, 작성자, 제목 검색 조건 유무에 따라 SQL 문이 동적으로 생성되도록 할 것임.
		return null;
	}

	@Override
	public boolean insert(BoardDTO dto) throws Exception {
		boolean result = false;
		int rs = 0;
		int seq = sqlSession.selectOne("boardMapper.seq");
		if(seq > 0) {
			dto.setBid(seq);
			rs = sqlSession.insert("boardMapper.boardInsert", dto);
			if(rs == 1) {
				rs = sqlSession.update("boardMapper.boardCLOB", dto);
				if(rs == 1) {
					System.out.println("CLOB 저장 완료!");
					result = true;
				}
			}
		}
		return result;
	}

	@Override
	public boolean update(BoardDTO dto) throws Exception {
		boolean result = false;
		int rs = sqlSession.update("boardMapper.boardUpdate", dto);		
		if(rs == 1) {
			result = true;
		}
		return result;
	}

	@Override
	public boolean delete(BoardDTO dto) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<BoardDTO> selectAll() throws Exception {
		List<BoardDTO> data = sqlSession.selectList("boardMapper.all");
		return data;
	}

	@Override
	public List<BoardDTO> selectList(BoardSearchDTO search) throws Exception {
		System.out.println("getSearchtype : " + search.getSearchtype());
		System.out.println("getSearch : " + search.getSearch());
		List<BoardDTO> data = sqlSession.selectList("boardMapper.boardSearch", search);
		return data;
	}
