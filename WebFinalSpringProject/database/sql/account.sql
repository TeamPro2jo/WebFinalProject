DROP TABLE account;
DROP SEQUENCE account_seq;

CREATE SEQUENCE account_seq NOCACHE;
CREATE TABLE account(
	id NUMBER,
	pwd NVARCHAR2(20),
	name NVARCHAR2(20),
	nickname NVARCHAR2(20),
	email NVARCHAR2(30),
	good NUMBER DEFAULT 0,
	bad NUMBER DEFAULT 0
);

ALTER TABLE account ADD CONSTRAINT account_id_PK PRIMARY KEY(id);
ALTER TABLE account MODIFY pwd CONSTRAINT account_pwd_NN NOT NULL;
ALTER TABLE account MODIFY name CONSTRAINT account_name_NN NOT NULL;
ALTER TABLE account MODIFY nickname CONSTRAINT account_nickname_NN NOT NULL;
ALTER TABLE account MODIFY email CONSTRAINT account_email_NN NOT NULL;

COMMENT ON COLUMN account.id IS '유저 식별 번호';
COMMENT ON COLUMN account.pwd IS '유저 비밀번호';
COMMENT ON COLUMN account.name IS '유저 이름';
COMMENT ON COLUMN account.nickname IS '유저 닉네임';
COMMENT ON COLUMN account.email IS '유저 이메일';
COMMENT ON COLUMN account.good IS '유저 추천수';
COMMENT ON COLUMN account.bad IS '유저 비추천수';

INSERT INTO account values(account_seq.NEXTVAL, '1user1', '김유저', '닉넴유저1', 'user1@sample.com', 0, 0);
INSERT INTO account values(account_seq.NEXTVAL, '2user2', '나유저', '닉넴유저2', 'user2@sample.com', 0, 0);
UPDATE account
   SET good = 0, bad = 0
 WHERE id = 3;
SELECT * FROM account;