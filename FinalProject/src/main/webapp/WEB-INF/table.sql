
-- user_all Table Create SQL
CREATE TABLE user_all
(
    user_id        VARCHAR2(50)    NOT NULL, 
    user_pwd       VARCHAR2(20)    NOT NULL, 
    user_name      VARCHAR2(20)    NOT NULL, 
    user_phone     VARCHAR2(20)    NOT NULL, 
    user_addr      VARCHAR2(20)    NULL, 
    user_p_code    VARCHAR2(20)    NULL, 
    user_sort      NUMBER          NOT NULL, 
    CONSTRAINT USER_ALL_PK PRIMARY KEY (user_id)
)
/

COMMENT ON TABLE user_all IS '통합회원 테이블'
/

COMMENT ON COLUMN user_all.user_id IS '회원ID'
/

COMMENT ON COLUMN user_all.user_pwd IS '비밀번호'
/

COMMENT ON COLUMN user_all.user_name IS '이름'
/

COMMENT ON COLUMN user_all.user_phone IS '전화번호'
/

COMMENT ON COLUMN user_all.user_addr IS '주소'
/

COMMENT ON COLUMN user_all.user_p_code IS '우편번호'
/

COMMENT ON COLUMN user_all.user_sort IS '계정구분'
/


-- user_all Table Create SQL
CREATE TABLE car_info
(
    m_name       VARCHAR2(50)    NOT NULL, 
    car_group    NUMBER          NOT NULL, 
    c_sort       NUMBER          NOT NULL, 
    company      NUMBER          NOT NULL, 
    CONSTRAINT CAR_INFO_PK PRIMARY KEY (m_name)
)
/

COMMENT ON TABLE car_info IS '차량 기본 정보 테이블'
/

COMMENT ON COLUMN car_info.m_name IS '모델명'
/

COMMENT ON COLUMN car_info.car_group IS '그룹'
/

COMMENT ON COLUMN car_info.c_sort IS '차종'
/

COMMENT ON COLUMN car_info.company IS '제조사'
/


-- user_all Table Create SQL
CREATE TABLE car_sell_info
(
    car_num            VARCHAR2(30)     NOT NULL, 
    m_name             VARCHAR2(50)     NOT NULL, 
    seller_id          VARCHAR2(50)     NOT NULL, 
    title              VARCHAR2(50)     NOT NULL, 
    s_price            NUMBER           NOT NULL, 
    automotive_fuel    VARCHAR2(20)     NOT NULL, 
    seater             NUMBER           NOT NULL, 
    color              VARCHAR2(20)     NOT NULL, 
    performance        NUMBER           NOT NULL, 
    expendables        NUMBER           NOT NULL, 
    c_history          varchar2(200)    NULL, 
    regdate            DATE             NOT NULL, 
    vehical_mile       NUMBER           NOT NULL, 
    car_option         varchar2(50)     NOT NULL, 
    car_year           varchar2(50)     NOT NULL, 
    vehical_gear       NUMBER           NOT NULL, 
    state              NUMBER           NOT NULL, 
    CONSTRAINT CAR_SELL_INFO_PK PRIMARY KEY (car_num)
)
/

ALTER TABLE car_sell_info MODIFY(car_year number);

COMMENT ON TABLE car_sell_info IS '차량 판매 정보 테이블'
/

COMMENT ON COLUMN car_sell_info.car_num IS '차량번호'
/

COMMENT ON COLUMN car_sell_info.m_name IS '모델명'
/

COMMENT ON COLUMN car_sell_info.seller_id IS '회원ID'
/

COMMENT ON COLUMN car_sell_info.title IS '제목'
/

COMMENT ON COLUMN car_sell_info.s_price IS '가격'
/

COMMENT ON COLUMN car_sell_info.automotive_fuel IS '연료'
/

COMMENT ON COLUMN car_sell_info.seater IS '인승'
/

COMMENT ON COLUMN car_sell_info.color IS '색상'
/

COMMENT ON COLUMN car_sell_info.performance IS '성능진단'
/

COMMENT ON COLUMN car_sell_info.expendables IS '소모품진단'
/

COMMENT ON COLUMN car_sell_info.c_history IS '사고이력'
/

COMMENT ON COLUMN car_sell_info.regdate IS '작성일'
/

COMMENT ON COLUMN car_sell_info.vehical_mile IS '주행거리'
/

COMMENT ON COLUMN car_sell_info.car_option IS '옵션명'
/

COMMENT ON COLUMN car_sell_info.car_year IS '연식'
/

COMMENT ON COLUMN car_sell_info.vehical_gear IS '자동차기어'
/

COMMENT ON COLUMN car_sell_info.state IS '진행상태'
/

ALTER TABLE car_sell_info
    ADD CONSTRAINT FK_car_sell_info_seller_id_use FOREIGN KEY (seller_id)
        REFERENCES user_all (user_id)
/

ALTER TABLE car_sell_info
    ADD CONSTRAINT FK_car_sell_info_m_name_car_in FOREIGN KEY (m_name)
        REFERENCES car_info (m_name)
/


-- user_all Table Create SQL
CREATE TABLE seller_review
(
    sr_num        NUMBER          NOT NULL, 
    seller_id     VARCHAR2(50)    NOT NULL, 
    user_id       VARCHAR2(50)    NOT NULL, 
    sr_title      VARCHAR2(50)    NOT NULL, 
    sr_content    CLOB            NOT NULL, 
    sr_score      NUMBER          NOT NULL, 
    sr_regdate    DATE            NOT NULL, 
    CONSTRAINT SELLER_REVIEW_PK PRIMARY KEY (sr_num)
)
/

CREATE SEQUENCE seller_review_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER seller_review_AI_TRG
BEFORE INSERT ON seller_review 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT seller_review_SEQ.NEXTVAL
    INTO :NEW.sr_num
    FROM DUAL;
END;
/

--DROP TRIGGER seller_review_AI_TRG;
/

--DROP SEQUENCE seller_review_SEQ;
/

COMMENT ON TABLE seller_review IS '판매자 리뷰 테이블'
/

COMMENT ON COLUMN seller_review.sr_num IS '글 번호'
/

COMMENT ON COLUMN seller_review.seller_id IS '판매자ID'
/

COMMENT ON COLUMN seller_review.user_id IS '회원ID'
/

COMMENT ON COLUMN seller_review.sr_title IS '제목'
/

COMMENT ON COLUMN seller_review.sr_content IS '내용'
/

COMMENT ON COLUMN seller_review.sr_score IS '평점'
/

COMMENT ON COLUMN seller_review.sr_regdate IS '작성일'
/

ALTER TABLE seller_review
    ADD CONSTRAINT FK_seller_review_user_id_user_ FOREIGN KEY (user_id)
        REFERENCES user_all (user_id)
/

ALTER TABLE seller_review
    ADD CONSTRAINT FK_seller_review_seller_id_car FOREIGN KEY (seller_id)
        REFERENCES car_sell_info (seller_id)
/


-- user_all Table Create SQL
CREATE TABLE favorit
(
    car_num    VARCHAR2(30)    NOT NULL, 
    user_id    VARCHAR2(50)    NOT NULL
)
/

COMMENT ON TABLE favorit IS '관심있는 차 테이블'
/

COMMENT ON COLUMN favorit.car_num IS '차량번호'
/

COMMENT ON COLUMN favorit.user_id IS '회원ID'
/

ALTER TABLE favorit
    ADD CONSTRAINT FK_favorit_user_id_user_all_us FOREIGN KEY (user_id)
        REFERENCES user_all (user_id)
/

ALTER TABLE favorit
    ADD CONSTRAINT FK_favorit_car_num_car_sell_in FOREIGN KEY (car_num)
        REFERENCES car_sell_info (car_num)
/


-- user_all Table Create SQL
CREATE TABLE car_image
(
    car_num      VARCHAR2(30)     NOT NULL, 
    seller_id    VARCHAR2(50)     NOT NULL, 
    img          VARCHAR2(300)    NULL   
)
/

COMMENT ON TABLE car_image IS '차량 이미지 테이블'
/

COMMENT ON COLUMN car_image.car_num IS '차량번호'
/

COMMENT ON COLUMN car_image.seller_id IS '판매자ID'
/

COMMENT ON COLUMN car_image.img IS '이미지'
/

ALTER TABLE car_image
    ADD CONSTRAINT FK_car_image_car_num_car_sell_ FOREIGN KEY (car_num, seller_id)
        REFERENCES car_sell_info (car_num, seller_id)
/


-- user_all Table Create SQL
CREATE TABLE message
(
    msg_num           NUMBER          NOT NULL, 
    sender            VARCHAR2(50)    NOT NULL, 
    receiver          VARCHAR2(50)    NOT NULL, 
    car_num           VARCHAR2(30)    NOT NULL, 
    msg_content       CLOB            NOT NULL, 
    sender_email      VARCHAR2(50)    NOT NULL, 
    receiver_email    VARCHAR2(50)    NOT NULL, 
    msg_regdate       DATE            NOT NULL, 
    CONSTRAINT MESSAGE_PK PRIMARY KEY (msg_num)
)
/

CREATE SEQUENCE message_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER message_AI_TRG
BEFORE INSERT ON message 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT message_SEQ.NEXTVAL
    INTO :NEW.msg_num
    FROM DUAL;
END;
/

--DROP TRIGGER message_AI_TRG;
/

--DROP SEQUENCE message_SEQ;
/

COMMENT ON TABLE message IS '쪽지 테이블'
/

COMMENT ON COLUMN message.msg_num IS '메세지 번호'
/

COMMENT ON COLUMN message.sender IS '발신자ID'
/

COMMENT ON COLUMN message.receiver IS '수신자ID'
/

COMMENT ON COLUMN message.car_num IS '차량번호'
/

COMMENT ON COLUMN message.msg_content IS '메세지 내용'
/

COMMENT ON COLUMN message.sender_email IS '발신자이메일'
/

COMMENT ON COLUMN message.receiver_email IS '수신자이메일'
/

COMMENT ON COLUMN message.msg_regdate IS '수신일자'
/

ALTER TABLE message
    ADD CONSTRAINT FK_message_sender_user_all_use FOREIGN KEY (sender)
        REFERENCES user_all (user_id)
/

ALTER TABLE message
    ADD CONSTRAINT FK_message_receiver_car_sell_i FOREIGN KEY (receiver, car_num)
        REFERENCES car_sell_info (seller_id, car_num)
/


-- user_all Table Create SQL
CREATE TABLE individual_question
(
    iq_num        NUMBER          NOT NULL, 
    user_id       VARCHAR2(50)    NOT NULL, 
    iq_content    CLOB            NOT NULL, 
    iq_regdate    DATE            NOT NULL, 
    CONSTRAINT INDIVIDUAL_QUESTION_PK PRIMARY KEY (iq_num)
)
/

CREATE SEQUENCE individual_question_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER individual_question_AI_TRG
BEFORE INSERT ON individual_question 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT individual_question_SEQ.NEXTVAL
    INTO :NEW.iq_num
    FROM DUAL;
END;
/

--DROP TRIGGER individual_question_AI_TRG;
/

--DROP SEQUENCE individual_question_SEQ;
/

COMMENT ON TABLE individual_question IS '개인 문의 테이블'
/

COMMENT ON COLUMN individual_question.iq_num IS '문의 번호'
/

COMMENT ON COLUMN individual_question.user_id IS '회원ID'
/

COMMENT ON COLUMN individual_question.iq_content IS '내용'
/

COMMENT ON COLUMN individual_question.iq_regdate IS '작성일'
/

ALTER TABLE individual_question
    ADD CONSTRAINT FK_individual_question_user_id FOREIGN KEY (user_id)
        REFERENCES user_all (user_id)
/


-- user_all Table Create SQL
CREATE TABLE qna
(
    qna_num     INT     NOT NULL, 
    question    CLOB    NULL, 
    anwser      CLOB    NULL, 
    CONSTRAINT QNA_PK PRIMARY KEY (qna_num)
)
/

CREATE SEQUENCE qna_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER qna_AI_TRG
BEFORE INSERT ON qna 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT qna_SEQ.NEXTVAL
    INTO :NEW.qna_num
    FROM DUAL;
END;
/

--DROP TRIGGER qna_AI_TRG;
/

--DROP SEQUENCE qna_SEQ;
/

COMMENT ON TABLE qna IS '자주 묻는 질문 테이블'
/

COMMENT ON COLUMN qna.qna_num IS '질문 번호'
/

COMMENT ON COLUMN qna.question IS '질문 내용'
/

COMMENT ON COLUMN qna.anwser IS '질문 답변'
/


-- user_all Table Create SQL
CREATE TABLE user_admin
(
    ip_num    VARCHAR2(100)    NOT NULL, 
    CONSTRAINT USER_ADMIN_PK PRIMARY KEY (ip_num)
)
/

COMMENT ON TABLE user_admin IS '관리자 IP 등록 페이지'
/

COMMENT ON COLUMN user_admin.ip_num IS 'IP번호'
/


-- user_all Table Create SQL
CREATE TABLE news
(
    n_num        NUMBER           NOT NULL, 
    n_title      varchar2(100)    NULL, 
    n_content    CLOB             NULL, 
    n_regdate    DATE             NULL, 
    CONSTRAINT NEWS_PK PRIMARY KEY (n_num)
)
/

CREATE SEQUENCE news_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER news_AI_TRG
BEFORE INSERT ON news 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT news_SEQ.NEXTVAL
    INTO :NEW.n_num
    FROM DUAL;
END;
/

--DROP TRIGGER news_AI_TRG;
/

--DROP SEQUENCE news_SEQ;
/

COMMENT ON TABLE news IS '자동차 관련 뉴스 테이블'
/

COMMENT ON COLUMN news.n_num IS '뉴스 글 번호'
/

COMMENT ON COLUMN news.n_title IS '제목'
/

COMMENT ON COLUMN news.n_content IS '내용'
/

COMMENT ON COLUMN news.n_regdate IS '작성일'
/