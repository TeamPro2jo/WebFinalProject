DROP TABLE message;
DROP SEQUENCE message_seq;

DROP TABLE chattroom;
DROP SEQUENCE chattroom_seq;

CREATE SEQUENCE message_seq start with 1 NOCACHE;
CREATE SEQUENCE chattroom_seq start with 1 NOCACHE;

CREATE TABLE chattroom(
	roomid NUMBER,
	myid VARCHAR2(64),
	partid VARCHAR2(64)
);

ALTER TABLE chattroom ADD CONSTRAINT chattroom_roomid_PK PRIMARY KEY(roomid);


COMMENT ON COLUMN chattroom.roomid IS '채팅방 식별 아이디';
COMMENT ON COLUMN chattroom.creator IS '채팅방 생성한 유저';
COMMENT ON COLUMN chattroom.participant IS '채팅방 참여한 유저';


CREATE TABLE message(
	mid NUMBER,
	sender NUMBER,
	receiver NUMBER,
	mcontents VARCHAR2(1024),
	sendtime DATE DEFAULT SYSDATE,
	readtime DATE DEFAULT SYSDATE,
	roomid NUMBER
);

ALTER TABLE message ADD CONSTRAINT message_mid_PK PRIMARY KEY(mid);
ALTER TABLE message MODIFY sender CONSTRAINT message_sender_NN NOT NULL;
ALTER TABLE message MODIFY receiver CONSTRAINT message_receiver_NN NOT NULL;
ALTER TABLE message MODIFY mcontents CONSTRAINT message_mcontents_NN NOT NULL;

COMMENT ON COLUMN message.mid IS '메시지 식별 아이디';
COMMENT ON COLUMN message.sender IS '메시지 보낸 사람';
COMMENT ON COLUMN message.receiver IS '메시지 받은 사람';
COMMENT ON COLUMN message.mcontents IS '메시지 내용';
COMMENT ON COLUMN message.sendtime IS '메시지 보낸 시간';
COMMENT ON COLUMN message.readtime IS '메시지 읽은 시간';
COMMENT ON COLUMN message.roomid IS '채팅방 식별 아이디';

