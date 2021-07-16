package com.web.finalproj.chat.handler;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.inject.Inject;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;
import com.web.finalproj.chat.dao.ChatDAO;
import com.web.finalproj.chat.vo.ChatRoomVO;
import com.web.finalproj.chat.vo.MessageVO;

public class ChatWebSocketHandler extends TextWebSocketHandler {

	@Inject
	private ChatDAO dao;

	private List<WebSocketSession> sessionList;

	public ChatWebSocketHandler() {
		sessionList = new ArrayList<WebSocketSession>();
	}

	private Map<String, WebSocketSession> users = new ConcurrentHashMap<String, WebSocketSession>();

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		log(session.getId() + " 연결 됨!!");

		users.put(session.getId(), session);
		sessionList.add(session);
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		log(session.getId() + " 연결 종료됨");
		sessionList.remove(session);
		users.remove(session.getId());

	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println(message.getPayload());

		MessageVO messageVO = MessageVO.convertMessage(message.getPayload());

		System.out.println("1 : " + messageVO.toString());

		ChatRoomVO roomVO = new ChatRoomVO();
		roomVO.setMyid(messageVO.getSender());
		roomVO.setPartid(messageVO.getReceiver());

		ChatRoomVO croom = null;
		if (messageVO.getSender() != messageVO.getReceiver()) {
			System.out.println("같은 사람 아님");

			if (dao.isRoom(roomVO) == null) {
				System.out.println("채팅방 없음");
				dao.createRoom(roomVO);
				croom = dao.isRoom(roomVO);
				System.out.println("채팅방 생성 완료");
			} else {
				System.out.println("채팅방 있음");
				croom = dao.isRoom(roomVO);
			}
		}

		messageVO.setRoomid(croom.getRoomid());
		messageVO.setReceiver(roomVO.getPartid());
		

		dao.insertMessage(messageVO);
		MessageVO msg = dao.getRecentMessage(messageVO.getRoomid());
		
		// 모든 세션에 채팅 전달
		for (int i = 0; i < sessionList.size(); i++) {
			Gson gson = new Gson();
			String msgJson = gson.toJson(msg);
			WebSocketSession s = sessionList.get(i);
			s.sendMessage(new TextMessage(msgJson));
			System.out.println(msgJson);
		}
		
	}

	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		log(session.getId() + " 익셉션 발생: " + exception.getMessage());

	}

	private void log(String logmsg) {
		System.out.println(new Date() + " : " + logmsg);

	}

}