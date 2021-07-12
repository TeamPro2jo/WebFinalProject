package com.web.finalproj.reply.service;

import java.util.List;

import com.web.finalproj.reply.vo.ReplyVO;

public interface ReplyService {
    public List<ReplyVO> list(int bid);
    public void create(ReplyVO vo);
    public void update(ReplyVO vo);
    public int delete(int reid);
}
 