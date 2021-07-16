package com.web.finalproj.chat.dao;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.web.finalproj.account.dto.AccountDTO;
import com.web.finalproj.chat.vo.ChatRoomVO;
import com.web.finalproj.chat.vo.MessageVO;

@Repository
public class ChatDAOImpl implements ChatDAO {

	@Inject
	private SqlSession session;

	private static String namespace = "ChatMapper";

	@Override
	public void createRoom(ChatRoomVO vo) throws Exception {
		// TODO Auto-generated method stub
		session.insert(namespace + ".createRoom", vo);
	}

	@Override
	public ChatRoomVO isRoom(ChatRoomVO vo) throws Exception {
		// TODO Auto-generated method stub

		ChatRoomVO roomvo = null;
		roomvo = session.selectOne(namespace + ".isRoom", vo);

		return roomvo;
	}

	@Override
	public void insertMessage(MessageVO vo) throws Exception {
		// TODO Auto-generated method stub
		session.insert(namespace + ".insertMessage", vo);
	}

	@Override
	public List<AccountDTO> getPartner(int myid) throws Exception {
		// TODO Auto-generated method stub

		List<AccountDTO> partlist = session.selectList(namespace + ".getPartner", myid);
		return partlist;
	}


	@Override
	public String getName(int id) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + ".getName", id);
	}

	@Override
	public List<MessageVO> getMessageList(int roomid) throws Exception {
		// TODO Auto-generated method stub

		return session.selectList(namespace + ".getMessageList", roomid);

	}

	@Override
	public List<ChatRoomVO> getRoomList(int myid) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace + ".getRoomList", myid);
	}

	@Override
	public MessageVO getRecentMessage(int roomid) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + ".getRecentMessage", roomid);
	}


	@Override
	public void updateReadTime(int myid, int partid) throws Exception {
		// TODO Auto-generated method stub

		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("myid", myid);
		map.put("partid", partid);
		session.update(namespace + ".updateReadTime", map);
	}

	@Override
	public int getUnReadCount(int myid, int partid) throws Exception {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("myid", myid);
		map.put("partid", partid);

		return session.selectOne(namespace + ".getUnReadCount", map);
	}
	

}