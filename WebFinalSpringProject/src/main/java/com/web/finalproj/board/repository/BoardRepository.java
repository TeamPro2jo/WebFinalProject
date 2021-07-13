package com.web.finalproj.board.repository;

import java.util.List;

import com.web.finalproj.board.dto.BoardDTO;
import com.web.finalproj.board.dto.BoardSearchDTO;
import com.web.finalproj.fileupload.vo.FileUploadVO;

public interface BoardRepository {
	public BoardDTO select(BoardDTO dto) throws Exception;
	public List<BoardDTO> selectAll() throws Exception;
	public void selectAuthor(int aid) throws Exception;
	public void selectTitle(String title)  throws Exception;
	public List<BoardDTO> selectList(BoardDTO dto)  throws Exception;
	public List<BoardDTO> selectList(BoardSearchDTO search)  throws Exception;
	public boolean insert(BoardDTO dto)  throws Exception;
	public boolean update(BoardDTO dto)  throws Exception;
	public boolean delete(int bid)  throws Exception;
	public boolean fileupload(FileUploadVO vo) throws Exception;
	public FileUploadVO selectFile(int bid) throws Exception;
}
