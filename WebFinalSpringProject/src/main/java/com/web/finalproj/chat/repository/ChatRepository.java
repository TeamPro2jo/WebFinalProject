package com.web.finalproj.chat.repository;

import java.util.List;

import com.web.finalproj.chat.dto.ChatroomDTO;
import com.web.finalproj.chat.dto.MessageDTO;

public interface ChatRepository {
	public void insertRoom(ChatroomDTO vo)throws Exception;
	public void insertMessage(MessageDTO vo)throws Exception;
	public List<MessageDTO> getMessageList(String str)throws Exception;
	public List<ChatroomDTO> getRoomList(String str)throws Exception;
	public List<ChatroomDTO> getRoomList2(String str)throws Exception;
}
