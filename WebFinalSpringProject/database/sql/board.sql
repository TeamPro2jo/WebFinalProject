DROP TABLE board;
DROP SEQUENCE board_seq;

CREATE SEQUENCE board_seq NOCACHE;
CREATE TABLE board(
	bid NUMBER,
	aid NUMBER,
	aname VARCHAR2(64),
	title VARCHAR2(256),
	contents NCLOB,
	deal NUMBER,
	location VARCHAR2(20),
	category VARCHAR2(30),
	status VARCHAR2(10),
	price NUMBER DEFAULT 0,
	recnt NUMBER DEFAULT 0,
	vcnt NUMBER DEFAULT 0,
	cdate DATE DEFAULT SYSDATE,
	udate DATE DEFAULT SYSDATE
);

ALTER TABLE board ADD CONSTRAINT board_bid_PK PRIMARY KEY(bid);
ALTER TABLE board ADD CONSTRAINT board_aid_FK FOREIGN KEY(aid) REFERENCES account(id) ON DELETE CASCADE;
ALTER TABLE board MODIFY aid CONSTRAINT board_aid_NN NOT NULL;
ALTER TABLE board MODIFY title CONSTRAINT board_title_NN NOT NULL;
ALTER TABLE board MODIFY contents CONSTRAINT board_contents_NN NOT NULL;
ALTER TABLE board MODIFY deal CONSTRAINT board_deal_NN NOT NULL;
ALTER TABLE board MODIFY category CONSTRAINT board_category_NN NOT NULL;
ALTER TABLE board MODIFY status CONSTRAINT board_status_NN NOT NULL;
ALTER TABLE board MODIFY price CONSTRAINT board_price_NN NOT NULL;

COMMENT ON COLUMN board.bid IS '게시판 식별 번호';
COMMENT ON COLUMN board.aid IS '게시판 작성자 식별 번호';
COMMENT ON COLUMN board.title IS '게시판 제목';
COMMENT ON COLUMN board.contents IS '게시판 내용';
COMMENT ON COLUMN board.deal IS '거래 방법(직거래/택배거래)';
COMMENT ON COLUMN board.location IS '거래 지역(택배거래면 NULL 가능)';
COMMENT ON COLUMN board.category IS '물품 종류';
COMMENT ON COLUMN board.status IS '물품 상태(최상/상/중/하)';
COMMENT ON COLUMN board.price IS '가격';
COMMENT ON COLUMN board.recnt IS '댓글수';
COMMENT ON COLUMN board.vcnt IS '조회수';
COMMENT ON COLUMN board.cdate IS '게시판 생성일';
COMMENT ON COLUMN board.udate IS '게시판 수정일';














SELECT * FROM board;








