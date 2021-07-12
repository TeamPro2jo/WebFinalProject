DROP TABLE board;
DROP SEQUENCE board_seq;

CREATE SEQUENCE board_seq NOCACHE;
CREATE TABLE board(
	bid NUMBER,
	aid NUMBER,
	aname NVARCHAR2(64),
	title NVARCHAR2(256),
	contents NCLOB,
	deal NUMBER,
	location NVARCHAR2(20),
	category NVARCHAR2(30),
	status NVARCHAR2(10),
	price NUMBER DEFAULT 0,
	vcnt NUMBER DEFAULT 0,
	cdate DATE DEFAULT SYSDATE,
	udate DATE DEFAULT SYSDATE
);

ALTER TABLE board ADD CONSTRAINT board_bid_PK PRIMARY KEY(bid);
ALTER TABLE board ADD CONSTRAINT board_aid_FK FOREIGN KEY(aid) REFERENCES account(id);
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
COMMENT ON COLUMN board.vcnt IS '조회수';
COMMENT ON COLUMN board.cdate IS '게시판 생성일';
COMMENT ON COLUMN board.udate IS '게시판 수정일';

INSERT INTO board values(board_seq.NEXTVAL, 2, '첫번째 게시글 유저1', '테스트1', 1, '서울', '디지털기기', '최상', 1000, 0, SYSDATE, SYSDATE);
INSERT INTO board values(board_seq.NEXTVAL, 3, '두번째 게시글 유저2', '테스트2', 2, '충북', '생활/가공식품', '중', 100000, 0, SYSDATE, SYSDATE);
INSERT INTO board values(board_seq.NEXTVAL, 1, '세번째 게시글 관리자', '테스트3', 1, '전남', '생활/가공식품', '하', 2000, 0, SYSDATE, SYSDATE);
INSERT INTO board values(board_seq.NEXTVAL, 4, '네번째 게시글 유저3', '테스트4', 1, '경북', '게임/취미', '상', 50000, 0, SYSDATE, SYSDATE);
INSERT INTO board values(board_seq.NEXTVAL, 5, '다섯번째 게시글 유저4', '테스트5', 2, '경기', '식물', '중', 15000, 0, SYSDATE, SYSDATE);
INSERT INTO board values(board_seq.NEXTVAL, 3, '여섯번째 게시글 유저2', '테스트6', 1, '경기', '유아용품', '상', 2600, 0, SYSDATE, SYSDATE);

UPDATE board
   SET contents = '테스트2'
 WHERE id = 2;
SELECT * FROM board;

SELECT a.bid
         , b.nickname AS aname
         , a.title
         , a.cdate
      FROM board a
      JOIN account b
        ON a.aid = b.id
     ORDER BY a.bid DESC;
     
SELECT * FROM board;