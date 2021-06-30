DROP TABLE zzim;
DROP SEQUENCE zzim_seq;

CREATE SEQUENCE zzim_seq NOCACHE;
CREATE TABLE zzim(
	zid NUMBER,
	aid NUMBER,
	bid NUMBER
);


ALTER TABLE zzim ADD CONSTRAINT zzim_zid_PK PRIMARY KEY(zid);
ALTER TABLE zzim ADD CONSTRAINT zzim_uid_FK FOREIGN KEY(aid) REFERENCES account(id);
ALTER TABLE zzim ADD CONSTRAINT zzim_bid_FK FOREIGN KEY(bid) REFERENCES board(bid);

INSERT INTO zzim values(zzim_seq.NEXTVAL, 1, 1);
INSERT INTO zzim values(zzim_seq.NEXTVAL, 1, 4);
INSERT INTO zzim values(zzim_seq.NEXTVAL, 1, 5);

SELECT *
  FROM board a
  JOIN zzim b
    ON a.bid = b.bid
 WHERE b.aid = 1;
     
     SELECT a.id
         , a.btype
         , b.name AS bname
         , a.aid
         , c.nickname AS aname
         , a.title
         , a.cdate
         , a.vcnt
      FROM board a
      JOIN board_type b
        ON a.btype = b.id
      JOIN account c
        ON a.aid = c.id
     WHERE a.deleted = 'n'
     ORDER BY a.id DESC
     
SELECT * FROM zzim;