package com.web.finalproj.reply.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.web.finalproj.reply.dao.ReplyDAO;
import com.web.finalproj.reply.vo.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService {
    
    @Inject
    ReplyDAO replyDao;
    
    // 댓글 목록
    @Override
    public List<ReplyVO> list(int bid) {
        return replyDao.list(bid);
    }
    // 댓글 작성
    @Override
    public void create(ReplyVO vo) {
        replyDao.create(vo);
    }
    // 댓글 수정
    @Override
    public void update(ReplyVO vo) {
    	replyDao.update(vo);
 
    }
    // 댓글 삭제
    @Override
    public int delete(int reid) {
    	return replyDao.delete(reid);
 
    }

 
}