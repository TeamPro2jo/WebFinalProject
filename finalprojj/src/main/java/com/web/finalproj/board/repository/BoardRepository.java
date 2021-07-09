package com.web.finalproj.board.repository;

import java.util.*;

import com.web.finalproj.board.dto.BoardDTO;
import com.web.finalproj.board.dto.BoardSearchDTO;
import com.web.finalproj.board.dto.BoardTypeDTO;

/**
 * 
 */
public interface BoardRepository {
	public BoardDTO select(BoardDTO dto) throws Exception;
	public List<BoardDTO> selectAll() throws Exception;
	public void selectType(int btype) throws Exception;
	public void selectAuthor(int aid) throws Exception;
	public void selectTitle(String title)  throws Exception;
	public List<BoardDTO> selectList(BoardDTO dto)  throws Exception;
	public List<BoardDTO> selectList(BoardSearchDTO search)  throws Exception;
	public boolean insert(BoardDTO dto)  throws Exception;
	public boolean update(BoardDTO dto)  throws Exception;
	public boolean delete(BoardDTO dto)  throws Exception;
	public List<BoardTypeDTO> selectBoardTypes() throws Exception;
	public List<Map<String, String>> uploadfiles(int id) throws Exception;
}