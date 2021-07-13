package com.web.finalproj.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.finalproj.board.dto.BoardDTO;
import com.web.finalproj.board.dto.BoardSearchDTO;
import com.web.finalproj.board.repository.BoardRepository;
import com.web.finalproj.fileupload.vo.FileUploadVO;

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
	public boolean remove(int bid) throws Exception {
		boolean res = dao.delete(bid);
		return res;
	}

	@Override
	public List<BoardDTO> findAll() throws Exception {
		List<BoardDTO> data = dao.selectAll();
		return data;
	}

	@Override
	public BoardDTO findId(int id) throws Exception {
		BoardDTO data = new BoardDTO();
		data.setBid(id);
		return dao.select(data);
	}

	@Override
	public List<BoardDTO> findType(int btype) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BoardDTO> findTitle(String title) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BoardDTO> findAuthor(int aid) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BoardDTO> findList(BoardSearchDTO search) throws Exception {
		List<BoardDTO> data = dao.selectList(search);
		return data;
	}
	
	@Override
	public boolean fileAdd(FileUploadVO vo) throws Exception {
		boolean res = dao.fileupload(vo);
		return res;
	}
	
	@Override
	public FileUploadVO getFile(int bid) throws Exception {
		FileUploadVO vo = dao.selectFile(bid);
				
		return vo;
	}
	
}
