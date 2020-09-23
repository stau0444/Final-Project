CREATE TABLE board_cafe(
	num NUMBER PRIMARY KEY,
	writer VARCHAR2(100) NOT NULL,
	title VARCHAR2(100) NOT NULL,
	content CLOB,
	viewCount NUMBER, --조회수
	regdate DATE
);

CREATE SEQUENCE board_cafe_seq;

CREATE TABLE board_cafe_comment(
	num NUMBER PRIMARY KEY, --댓글의 글번호
	bno number default 0,   --게시글 번호
	writer VARCHAR2(100) not null,  --댓글 작성자의 아이디
	content VARCHAR2(500) not null, --댓글 내용
	target_id VARCHAR2(100), --댓글의 대상자 아이디
	ref_group NUMBER,
	comment_group NUMBER,
	deleted CHAR(3) DEFAULT 'no',
	regdate DATE
);

CREATE SEQUENCE board_cafe_comment_seq;

ALTER TABLE board_cafe_comment
ADD bno number default 0;

        
ALTER TABLE board_cafe_comment ADD
(
    CONSTRAINT board_cafe_comment
    FOREIGN KEY ( bno )
        REFERENCES board_cafe ( num )
);

drop sequence board_cafe_comment_seq;   --중복될수도 있으니 시퀀스를 삭제.
create sequence board_cafe_comment_seq  --시작값을 1로하고 1씩 증가하는 reply_seq 시퀀스를 생성함.
start with 1
increment by 1;