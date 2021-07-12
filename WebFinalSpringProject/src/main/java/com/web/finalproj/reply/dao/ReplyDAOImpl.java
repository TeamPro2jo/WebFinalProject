package com.web.finalproj.reply.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.web.finalproj.reply.vo.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {
    @Inject
    SqlSession sqlSession;
    
    @Override
    public List<ReplyVO> list(int bid) {
        return sqlSession.selectList("replyMapper.listReply", bid);
    }

    @Override
    public void create(ReplyVO vo) {
        sqlSession.insert("replyMapper.insertReply", vo);
    }

    @Override
    public void update(ReplyVO vo) {
    	sqlSession.update("reply.updateReply", vo);
 
    }

    @Override
    public int delete(int reid) {
    	return sqlSession.delete("reply.deleteReply", reid);
 
    }
 
}