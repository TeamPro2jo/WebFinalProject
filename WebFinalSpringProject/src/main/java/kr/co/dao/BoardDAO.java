package kr.co.dao;

import java.util.List;

import kr.co.vo.BoardVO;
//DAO (DATA ACCESS OBJECT)
// 데이터 베이스 접속과 관련된 메서드를 정의
public interface BoardDAO {

	// 게시글 작성
	public void write(BoardVO boardVO) throws Exception;
	
	// 게시물 목록 조회
		public List<BoardVO> list() throws Exception;
}