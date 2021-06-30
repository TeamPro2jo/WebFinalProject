DROP TABLE account;
DROP SEQUENCE account_seq;

CREATE SEQUENCE account_seq NOCACHE;

CREATE TABLE account(
	id NUMBER,
	nickname NVARCHAR2(64),
	name NVARCHAR2(64),
	pwd NVARCHAR2(64),
	email NVARCHAR2(128),
	good int DEFAULT 0,
	bad int DEFAULT 0
);

ALTER TABLE account ADD CONSTRAINT account_id_PK PRIMARY KEY(id);
ALTER TABLE account MODIFY nickname CONSTRAINT account_nickname_NN NOT NULL;
ALTER TABLE account MODIFY name CONSTRAINT account_username_NN NOT NULL;
ALTER TABLE account MODIFY pWd CONSTRAINT account_password_NN NOT NULL;
ALTER TABLE account MODIFY email CONSTRAINT account_email_NN NOT NULL;

COMMENT ON COLUMN account.id IS '사용자 계정 식별 번호';
COMMENT ON COLUMN account.nickname IS '사용자 계정 닉네임';
COMMENT ON COLUMN account.name IS '사용자 이름';
COMMENT ON COLUMN account.pWd IS '사용자 로그인 암호';
COMMENT ON COLUMN account.email IS '사용자 이메일 주소(로그인 아이디로 사용)';
COMMENT ON COLUMN account.good IS '추천';
COMMENT ON COLUMN account.bad IS '비추천';


INSERT INTO account(id, nickname, name, pwd, email, good, bad) VALUES(account_seq.NEXTVAL, '관리자', 'admin', 'admin', 'admin@sample.com', 0, 0);
INSERT INTO account(id, nickname, name, pwd, email, good, bad) VALUES(account_seq.NEXTVAL, '김김김', 'kim', 'kim', 'kim@sample.com', 0, 0);
INSERT INTO account(id, nickname, name, pwd, email, good, bad) VALUES(account_seq.NEXTVAL, '박박박', 'park', 'park', 'park@sample.com', 0, 0);
INSERT INTO account(id, nickname, name, pwd, email, good, bad) VALUES(account_seq.NEXTVAL, '이이이', 'lee', 'lee', 'lee@sample.com', 0, 0);