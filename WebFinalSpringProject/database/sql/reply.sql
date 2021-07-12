DROP TABLE reply;
DROP SEQUENCE reply_seq;

CREATE SEQUENCE reply_seq NOCACHE START WITH 1;
CREATE TABLE reply (
	reid NUMBER,
	bid NUMBER,
	aid NUMBER,
	aname NVARCHAR2(64),
	recontents NCLOB,
	rereplyid NUMBER,
	cdate DATE DEFAULT SYSDATE,
	udate DATE DEFAULT SYSDATE
);

ALTER TABLE reply ADD CONSTRAINT reply_reid_PK PRIMARY KEY(reid);
ALTER TABLE reply ADD CONSTRAINT reply_bid_FK FOREIGN KEY(bid) REFERENCES board(bid);
ALTER TABLE reply ADD CONSTRAINT reply_aid_FK FOREIGN KEY(aid) REFERENCES account(id);

ALTER TABLE reply MODIFY recontents CONSTRAINT reply_recontents_NN NOT NULL;