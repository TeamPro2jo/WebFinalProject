package com.web.finalproj.chat.service;

import java.util.List;

import com.web.finalproj.chat.dto.ChatroomDTO;
import com.web.finalproj.chat.dto.MessageDTO;

public interface ChatService {
	public void createRoom(ChatroomDTO vo)throws Exception;
	public ChatroomDTO isRoom(ChatroomDTO vo)throws Exception;
	public String getPartner(ChatroomDTO vo)throws Exception;
	public String getProfile(String str)throws Exception;
	public String getName(String str)throws Exception;

	public MessageDTO getRecentMessage(String str)throws Exception;
	//public String isGetMessageList(String str)throws Exception;
	
	public String getTutorId(String str)throws Exception;
	public List<ChatroomDTO> getRoomListTutor(String str)throws Exception;

	public int getAllCount(String str);
	
}