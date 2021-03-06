
TRUNCATE TABLE TBL_PROJECT;
TRUNCATE TABLE TBL_PROJECT_FILE;
TRUNCATE TABLE TBL_REPLY;
TRUNCATE TABLE TBL_REVIEW_FILE;

ALTER TABLE TBL_REPLY ADD NICKNAME VARCHAR2(1000) NULL;
ALTER TABLE TBL_PROJECT ADD APPLY_COUNT NUMBER DEFAULT 0;
ALTER TABLE TBL_PROJECT ADD USER_NUMBER NUMBER;

SELECT * FROM TBL_REPLY;
SELECT * FROM TBL_USER;

INSERT INTO TBL_REPLY
(REPLY_NUMBER, REVIEW_NUMBER, USER_NUMBER, NICKNAME, CONTENT)
VALUES(SEQ_REPLY.NEXTVAL, 1, 1, (SELECT NICKNAME FROM TBL_USER WHERE USER_NUMBER =2), 'test4');

SELECT REPLY_NUMBER, REVIEW_NUMBER, USER_NUMBER, NICKNAME, CONTENT, RGISTER_DATE
FROM TBL_REPLY;

INSERT INTO TBL_REPLY 
(REPLY_NUMBER, REVIEW_NUMBER, USER_NUMBER, NICKNAME, CONTENT)
(SELECT SEQ_REPLY.NEXTVAL, REVIEW_NUMBER, USER_NUMBER, NICKNAME, CONTENT FROM TBL_REPLY);

INSERT INTO TBL_BOARD 
(BOARD_BNO, BOARD_TITLE, BOARD_CONTENT, BOARD_WRITER)
(SELECT SEQ_BOARD.NEXTVAL, BOARD_TITLE, BOARD_CONTENT, BOARD_WRITER FROM TBL_BOARD);

SELECT UUID, UPLOAD_PATH, NAME, IMAGE, REVIEW_NUMBER, FILE_NUMBER
FROM TBL_REVIEW_FILE;


DROP TABLE TBL_MESSAGE;

CREATE TABLE TBL_MESSAGE(
   MESSAGE_NUMBER NUMBER NOT NULL,
    SEND_USER_NUMBER   NUMBER NOT NULL,
    RECEIVE_USER_NUMBER   NUMBER NOT NULL,
    ROOM   VARCHAR2(1000),
    CONTENT   VARCHAR2(1000) NOT NULL,
    MESSAGE_DATE   DATE   DEFAULT   SYSDATE,   
    CONSTRAINT FK_MESSAGE_SEND_NUMBER FOREIGN KEY(SEND_USER_NUMBER)
    REFERENCES TBL_USER(USER_NUMBER) ON DELETE CASCADE,
    CONSTRAINT FK_MESSAGE_RECEIVE_NUMBER FOREIGN KEY(RECEIVE_USER_NUMBER)
    REFERENCES TBL_USER(USER_NUMBER) ON DELETE CASCADE,
    CONSTRAINT MESSAGE_PK PRIMARY KEY(MESSAGE_NUMBER)
);

CREATE SEQUENCE SEQ_REVIEWFILE


MERGE INTO TBL_PROJECT p
USING (
   SELECT COUNT(PROJECT_NUMBER) AS PT_COUNT, PROJECT_NUMBER 
   FROM TBL_PARTICIPATION
   GROUP BY PROJECT_NUMBER
) pt
ON (p.PROJECT_NUMBER = pt.PROJECT_NUMBER)
WHEN MATCHED THEN UPDATE SET p.APPLY_COUNT = PT_COUNT;

INSERT INTO TBL_FOLLOW
(FOLLOWING_NUMBER, FOLLOWER_NUMBER)
VALUES(1, 2);

INSERT INTO TBL_FOLLOW
(FOLLOWING_NUMBER, FOLLOWER_NUMBER)
VALUES(3, 2);

INSERT INTO TBL_FOLLOW
(FOLLOWING_NUMBER, FOLLOWER_NUMBER)
VALUES(2, 1);

INSERT INTO TBL_FOLLOW
(FOLLOWING_NUMBER, FOLLOWER_NUMBER)
VALUES(2, 3);

