CREATE DATABASE pnpe;

USE pnpe;

-- 회원(member) 테이블 생성
CREATE TABLE MEMBER(
	id VARCHAR(16) NOT NULL,   -- (아이디)
	pw VARCHAR(330) NOT NULL,   -- (비밀번호)
	NAME VARCHAR(100) NOT NULL,   -- (이름)
	email VARCHAR(100) NOT NULL,   -- (이메일)
	tel VARCHAR(13),   -- (전화번호)
	regdate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,   -- (가입일)
	POINT INT DEFAULT 0,   -- (포인트)
	PRIMARY KEY (id)
);

INSERT INTO MEMBER(id, pw, NAME, email, tel) VALUES('admin', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', '관리자', 'admin@playnplay.com', '010-1004-1004');

SELECT* FROM member;

-- 게시판(board) 테이블 생성
CREATE TABLE board(
	bno INT(11) PRIMARY KEY AUTO_INCREMENT,   -- (게시글 번호) 자동 발생
	boardType INT NOT NULL,   -- (게시글 타입) 
	title VARCHAR(200) NOT NULL,   -- (게시글 제목)
	content VARCHAR(1000),   -- (게시글 내용)
	author VARCHAR(16) NOT NULL,   -- (작성자)
	resdate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,   -- (등록일)
	cnt INT DEFAULT 0   -- (조회수)
);

CREATE VIEW boardList AS (SELECT b.bno AS bno, b.boardType AS boardType, b.title AS title, b.content AS content, b.author AS author, b.resdate AS resdate, b.cnt as cnt, m.name AS name FROM board b, member m WHERE b.author=m.id order BY b.bno ASC);

-- 댓글(comment) 테이블 생성
CREATE TABLE comment(
   cno INT PRIMARY KEY AUTO_INCREMENT,   -- (댓글번호) 자동발생
	author VARCHAR(16) NOT NULL,   -- (댓글 작성자)
	content VARCHAR(1000) NOT NULL,   -- (댓글 내용)
	resdate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,   -- (댓글 등록일)
	bno INT(11) NOT NULL   -- (해당 게시글 번호)
);

CREATE VIEW commentList AS (SELECT c.cno AS cno, c.author AS author, c.content AS content, c.resdate AS resdate, c.bno AS bno, m.name AS name FROM comment c, member m WHERE c.author=m.id order BY c.cno ASC);
    
-- 문의(qna) 테이블 생성
CREATE TABLE qna(
	qno INT PRIMARY KEY AUTO_INCREMENT,   -- (문의번호) 자동발생
	title VARCHAR(100) NOT NULL,   -- (문의 제목)
	content VARCHAR(1000) NOT NULL,   -- (문의 내용)
	answer VARCHAR(1000) NOT NULL,   -- (답변 내용)
	author VARCHAR(16),   -- (문의 작성자)
	resdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),   -- (문의 등록일자)
	answerdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),   -- (답변 등록일자)
	answeryn BOOLEAN DEFAULT false -- 질문(0), 답변(1)
);

CREATE VIEW qnaList AS (SELECT q.qno AS qno, q.title AS title, q.content AS content, q.answer AS answer, q.author AS author, q.resdate AS resdate, q.answerdate AS answerdate, q.answeryn AS answeryn, m.name AS name FROM qna q, member m WHERE q.author=m.id order BY q.qno ASC);