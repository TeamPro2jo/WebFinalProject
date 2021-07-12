package com.web.finalproj.chat.dao;

import java.util.List;

import com.web.finalproj.account.dto.AccountDTO;
import com.web.finalproj.chat.vo.ChatRoomVO;
import com.web.finalproj.chat.vo.MessageVO;

public interface ChatDAO {

	public void createRoom(ChatRoomVO vo)throws Exception;
	public ChatRoomVO isRoom(ChatRoomVO vo)throws Exception;
	public void insertMessage(MessageVO vo)throws Exception;
	public List<AccountDTO> getPartner(int myid)throws Exception;
	public String getName(int id)throws Exception;
	public List<MessageVO> getMessageList(int roomid)throws Exception;
	public List<ChatRoomVO> getRoomList(int myid)throws Exception;
	public MessageVO getRecentMessage(int roomid)throws Exception;
	//public String isGetMessageList(String str)throws Exception;
	public void updateReadTime(int myid, int partid)throws Exception;
	public int getUnReadCount(int myid, int partid)throws Exception;

	
}