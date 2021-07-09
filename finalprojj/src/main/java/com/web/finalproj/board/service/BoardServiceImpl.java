package com.web.finalproj.board.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.finalproj.board.dto.BoardDTO;
import com.web.finalproj.board.dto.BoardSearchDTO;
import com.web.finalproj.board.dto.BoardTypeDTO;
import com.web.finalproj.board.repository.BoardRepository;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardRepository dao;


	@Override
	public boolean add(BoardDTO dto) throws Exception {
		boolean res = dao.insert(dto);
		return res;
	}

	@Override
	public boolean update(BoardDTO dto) throws Exception {
		boolean res = dao.update(dto);
		return res;
	}

	@Override
	public boolean remove(BoardDTO dto) throws Exception {
		// TODO implement here
		return false;
	}
	
	@Override
	public BoardDTO findId(int id) throws Exception {
		BoardDTO data = new BoardDTO();
		data.setId(id);
		return dao.select(data);
	}
	
	@Override
	public List<BoardDTO> findType(int btype) throws Exception {
		// TODO implement here
		return null;
	}
	
	@Override
	public List<BoardDTO> findTitle(String title) throws Exception {
		// TODO implement here
		return null;
	}
	
	@Override
	public List<BoardDTO> findAuthor(int aid) throws Exception {
		// TODO implement here
		return null;
	}
	
	@Override
	public List<BoardDTO> findAll() throws Exception {
		List<BoardDTO> data = dao.selectAll();
		return data;
	}

	@Override
	public List<BoardTypeDTO> getBoardTypes() throws Exception {
		List<BoardTypeDTO> data = dao.selectBoardTypes();
		return data;
	}

	@Override
	public List<BoardDTO> findList(BoardSearchDTO search) throws Exception {
		List<BoardDTO> data = dao.selectList(search);
		return data;
	}

	@Override
	public List<Map<String, String>> uploadfiles(int id) throws Exception {
		return dao.uploadfiles(id);
	}

}