/*** Final 데이터 베이스 스크립트 Ver 1.7 ***/
/* ID : dajob / PWD : dajob1710 */

/** 1.7 ver 스크립트 초기화를 위한 테이블 삭제 **/

DROP TABLE MEMBER_TYPE CASCADE CONSTRAINTS;
DROP TABLE MEMBER CASCADE CONSTRAINTS;
DROP TABLE MEMBER_USER CASCADE CONSTRAINTS;
DROP TABLE COMP_TYPE CASCADE CONSTRAINTS;
DROP TABLE MEMBER_COMPANY CASCADE CONSTRAINTS;
DROP TABLE CERT CASCADE CONSTRAINTS;
DROP TABLE USER_CERT CASCADE CONSTRAINTS;

DROP VIEW VW_USER;
DROP VIEW VW_COMPANY;
DROP VIEW VW_TOTALCERT;
DROP VIEW VW_LIKELIST;
DROP VIEW VW_LIKECOMPLIST;

DROP TABLE ITINFO CASCADE CONSTRAINTS;
DROP SEQUENCE SEQ_ITINFO;

DROP TABLE NOTICE CASCADE CONSTRAINTS;
DROP SEQUENCE SEQ_NOTICE;
DROP TABLE NOTICE_REPLY CASCADE CONSTRAINTS;
DROP SEQUENCE SEQ_NO_REP;

DROP TABLE WORKJOB CASCADE CONSTRAINTS;
DROP TABLE SKILL CASCADE CONSTRAINTS;

DROP TABLE WORK_BOARD CASCADE CONSTRAINTS;
DROP SEQUENCE SEQ_WORK;
DROP TABLE WORK_BOARD_REVIEW CASCADE CONSTRAINTS;

DROP TABLE INTERVIEW CASCADE CONSTRAINTS;
DROP SEQUENCE SEQ_INTERVIEW;

DROP TABLE POWERLINK CASCADE CONSTRAINTS;
DROP TRIGGER TR_POWERLINK;
DROP PROCEDURE PR_POWERLINK;

DROP TABLE LIKELIST CASCADE CONSTRAINTS;
DROP TABLE SAL_AVG;

/* Power Link 잡 삭제 */
BEGIN
   DBMS_SCHEDULER.DROP_JOB(
        JOB_NAME   => 'JOB_PR_TIMER',
        FORCE      => FALSE);
END;
/


--------------->> MEMBER 영역 <<---------------
CREATE TABLE MEMBER_TYPE(
       MEMBER_TYPE_CODE VARCHAR2(2) CONSTRAINT PK_MTYPE PRIMARY KEY,   /* 구분 코드 */
       MEMBER_TYPE_NAME VARCHAR2(30)    /* 구분 명 */
);

COMMENT ON TABLE MEMBER_TYPE IS '회원 구분';
COMMENT ON COLUMN MEMBER_TYPE.MEMBER_TYPE_CODE IS '구분 코드';
COMMENT ON COLUMN MEMBER_TYPE.MEMBER_TYPE_NAME IS '구분 명';

CREATE TABLE MEMBER (
	MEMBER_ID VARCHAR2(30) CONSTRAINT PK_MEMBER PRIMARY KEY, /* 아이디 */
	MEMBER_PASSWORD VARCHAR2(30) NOT NULL, /* 비밀번호 */
	MEMBER_TYPE_CODE VARCHAR2(2) NOT NULL, /* 구분 코드 */
	MEMBER_NAME VARCHAR2(30) NOT NULL, /* 이름 */
       MEMBER_EMAIL VARCHAR2(30) NOT NULL, /* 이메일 */
	MEMBER_PHONE VARCHAR2(30) NOT NULL, /* 전화번호 */
	MEMBER_ADDRESS VARCHAR2(300) NOT NULL, /* 주소 */
	MEMBER_SIGN_DATE DATE DEFAULT SYSDATE, /* 가입일 */
	MEMBER_PROFILE_IMG VARCHAR2(50) DEFAULT 'default.jpg', /* 프로필 이미지 */
       CONSTRAINT FK_M_TYPE FOREIGN KEY(MEMBER_TYPE_CODE) REFERENCES MEMBER_TYPE ON DELETE SET NULL
);

COMMENT ON TABLE MEMBER IS '회원 정보';
COMMENT ON COLUMN MEMBER.MEMBER_ID IS '아이디';
COMMENT ON COLUMN MEMBER.MEMBER_PASSWORD IS '비밀번호';
COMMENT ON COLUMN MEMBER.MEMBER_TYPE_CODE IS '회원구분코드';
COMMENT ON COLUMN MEMBER.MEMBER_NAME IS '성명';
COMMENT ON COLUMN MEMBER.MEMBER_EMAIL IS '이메일';
COMMENT ON COLUMN MEMBER.MEMBER_PHONE IS '전화번호';
COMMENT ON COLUMN MEMBER.MEMBER_ADDRESS IS '주소';
COMMENT ON COLUMN MEMBER.MEMBER_SIGN_DATE IS '가입일';
COMMENT ON COLUMN MEMBER.MEMBER_PROFILE_IMG IS '프로필IMG';

CREATE TABLE MEMBER_USER(
       MEMBER_ID VARCHAR2(30) NOT NULL UNIQUE,    /* 아이디 */
       GENDER VARCHAR2(3),       /* 성별 */       
	     BIRTHDAY DATE NOT NULL, /* 생년월일 */
	     RESUME_DATA VARCHAR2(3000), /* 이력서 */
       RESUMEFILE VARCHAR2(50) DEFAULT NULL,   /* 첨부파일 */
       CONSTRAINT FK_U_MEMBER FOREIGN KEY(MEMBER_ID) REFERENCES MEMBER ON DELETE CASCADE
);

COMMENT ON TABLE MEMBER_USER IS '일반회원';
COMMENT ON COLUMN MEMBER_USER.MEMBER_ID IS '아이디';
COMMENT ON COLUMN MEMBER_USER.GENDER IS '성별';
COMMENT ON COLUMN MEMBER_USER.BIRTHDAY IS '생년월일';
COMMENT ON COLUMN MEMBER_USER.RESUME_DATA IS '이력서';
COMMENT ON COLUMN MEMBER_USER.RESUMEFILE IS '첨부파일';

CREATE TABLE COMP_TYPE(
       COMPANY_TYPE VARCHAR2(3) CONSTRAINT PK_CTYPE PRIMARY KEY,  /* 기업 구분코드 */
       COMPANY_TNAME VARCHAR2(30) /* 기업 구분 명 */
);

COMMENT ON TABLE COMP_TYPE IS '기업구분';
COMMENT ON COLUMN COMP_TYPE.COMPANY_TYPE IS '기업구분코드';
COMMENT ON COLUMN COMP_TYPE.COMPANY_TNAME IS '기업구분명';

CREATE TABLE MEMBER_COMPANY(
       MEMBER_ID VARCHAR2(30) NOT NULL UNIQUE,    /* 아이디 */
       COMPANY_NAME VARCHAR2(50), /* 회사명 */
       COMPANY_TYPE VARCHAR2(3) CONSTRAINT NN_CTYPE NOT NULL, /* 회사구분 */
       COMPANY_STAFF NUMBER NOT NULL, /* 회사 사원 수 */
       COMPANY_CAPITAL NUMBER, /* 회사 자본 */
       COMPANY_CODE VARCHAR2(12) NOT NULL, /* 사업자등록번호 */
       COMPANY_TEL VARCHAR2(13),  /* 회사 대표번호 */
       COMPANY_FAX VARCHAR2(13),  /* 회사 팩스번호 */
       COMPANY_WELFARE VARCHAR2(100), /* 회사 복지 */
       COMPANY_DATE DATE NOT NULL, /* 회사 창립연도 */
       CONSTRAINT FK_C_MEMBER FOREIGN KEY(MEMBER_ID) REFERENCES MEMBER ON DELETE CASCADE,
       CONSTRAINT FK_CTYPE FOREIGN KEY(COMPANY_TYPE) REFERENCES COMP_TYPE ON DELETE SET NULL
);

COMMENT ON TABLE MEMBER_COMPANY IS '기업회원';
COMMENT ON COLUMN MEMBER_COMPANY.MEMBER_ID IS '아이디';
COMMENT ON COLUMN MEMBER_COMPANY.COMPANY_NAME IS '회사명';
COMMENT ON COLUMN MEMBER_COMPANY.COMPANY_TYPE IS '회사구분';
COMMENT ON COLUMN MEMBER_COMPANY.COMPANY_STAFF IS '사원수';
COMMENT ON COLUMN MEMBER_COMPANY.COMPANY_CAPITAL IS '회사자본';
COMMENT ON COLUMN MEMBER_COMPANY.COMPANY_CODE IS '사업자등록번호';
COMMENT ON COLUMN MEMBER_COMPANY.COMPANY_TEL IS 'TEL';
COMMENT ON COLUMN MEMBER_COMPANY.COMPANY_FAX IS 'FAX';
COMMENT ON COLUMN MEMBER_COMPANY.COMPANY_WELFARE IS '복지사항';
COMMENT ON COLUMN MEMBER_COMPANY.COMPANY_DATE IS '창립연도';

CREATE TABLE CERT(
       CERT_NO VARCHAR2(14) CONSTRAINT PK_CERT PRIMARY KEY,  /* 자격증구분코드 */
       CERT_NAME VARCHAR2(45),  /* 자격증명 */
       CERT_TYPE VARCHAR2(30)  /* 자격증분류 */
);

COMMENT ON TABLE CERT IS '자격증';
COMMENT ON COLUMN CERT.CERT_NO IS '자격증코드';
COMMENT ON COLUMN CERT.CERT_NAME IS '자격증명';
COMMENT ON COLUMN CERT.CERT_TYPE IS '자격증분류';

CREATE TABLE USER_CERT(
       MEMBER_ID VARCHAR2(30) NOT NULL,  /* 아이디 */
       CERT_NO VARCHAR2(14) NOT NULL,    /* 자격증코드 */
       CERT_DATE DATE,           /* 취득일 */
       CONSTRAINT FK_CU_ID FOREIGN KEY(MEMBER_ID) REFERENCES MEMBER ON DELETE CASCADE,
       CONSTRAINT FK_CERTNO FOREIGN KEY(CERT_NO) REFERENCES CERT ON DELETE CASCADE,
       CONSTRAINT PK_CERT_M PRIMARY KEY(MEMBER_ID,CERT_NO) /* 1:n 기본 복합키 */
);

COMMENT ON TABLE USER_CERT IS '보유자격LIST';
COMMENT ON COLUMN USER_CERT.MEMBER_ID IS '보유자';
COMMENT ON COLUMN USER_CERT.CERT_NO IS '자격증코드';
COMMENT ON COLUMN USER_CERT.CERT_DATE IS '취득일';

CREATE OR REPLACE VIEW VW_USER
AS SELECT * FROM MEMBER
JOIN MEMBER_USER USING(MEMBER_ID);

CREATE OR REPLACE VIEW VW_COMPANY
AS SELECT * FROM MEMBER
JOIN MEMBER_COMPANY USING(MEMBER_ID);

-------------->> IT정보 게시판 (IT) <<--------------

CREATE TABLE ITINFO(
       ITINFO_NO VARCHAR2(14) CONSTRAINT PK_ITINFO PRIMARY KEY, /* IT게시번호 */
       ITINFO_TITLE VARCHAR2(300), /* 제목 */
       ITINFO_CONTENT VARCHAR2(3000), /* 내용 */
       ITINFO_IMG VARCHAR2(50),    /*  */
       ITINFO_DATE DATE DEFAULT SYSDATE
);

COMMENT ON TABLE ITINFO IS 'IT정보';
COMMENT ON COLUMN ITINFO.ITINFO_NO IS 'IT게시코드';
COMMENT ON COLUMN ITINFO.ITINFO_TITLE IS '제목';
COMMENT ON COLUMN ITINFO.ITINFO_CONTENT IS '내용';
COMMENT ON COLUMN ITINFO.ITINFO_IMG IS '썸네일';
COMMENT ON COLUMN ITINFO.ITINFO_DATE IS '게시일';

CREATE SEQUENCE SEQ_ITINFO
       START WITH 1
       INCREMENT BY 1
       MAXVALUE 99
       MINVALUE 0
       NOCACHE
       CYCLE;

--------------->> 공지사항 (NO) <<---------------

CREATE TABLE NOTICE(
       NOTICE_NO VARCHAR2(14) CONSTRAINT PK_NOTICE PRIMARY KEY,
       NOTICE_TITLE VARCHAR2(300),
       NOTICE_CONTENT VARCHAR2(3000),
       NOTICE_DATE DATE DEFAULT SYSDATE
);

COMMENT ON TABLE NOTICE IS '공지사항';
COMMENT ON COLUMN NOTICE.NOTICE_NO IS '공지코드';
COMMENT ON COLUMN NOTICE.NOTICE_TITLE IS '제목';
COMMENT ON COLUMN NOTICE.NOTICE_CONTENT IS '내용';
COMMENT ON COLUMN NOTICE.NOTICE_DATE IS '공지일';

CREATE SEQUENCE SEQ_NOTICE
       START WITH 1
       INCREMENT BY 1
       MAXVALUE 99
       MINVALUE 0
       NOCACHE
       CYCLE;

CREATE TABLE NOTICE_REPLY(
       NOTICE_REPNO VARCHAR2(14) CONSTRAINT PK_NO_REP PRIMARY KEY,
       NOTICE_NO VARCHAR2(14),
       NOTICE_REP_CONTENT VARCHAR2(3000),
       NOTICE_REP_WRITER VARCHAR2(30),
       NOTICE_REP_DATE DATE DEFAULT SYSDATE,
       NOTICE_REP_LEVEL NUMBER DEFAULT 0,
       NOTICE_REP_REF VARCHAR2(14) DEFAULT NULL,
       CONSTRAINT FK_NOTICE_NO FOREIGN KEY(NOTICE_NO) REFERENCES NOTICE ON DELETE CASCADE,
       CONSTRAINT FK_NO_REP_REF FOREIGN KEY(NOTICE_REP_REF) REFERENCES NOTICE_REPLY ON DELETE CASCADE
);

CREATE SEQUENCE SEQ_NO_REP
       START WITH 1
       INCREMENT BY 1
       MAXVALUE 99
       MINVALUE 0
       NOCACHE
       CYCLE;

--------------->> WORK HERE (WH) <<---------------
CREATE TABLE WORKJOB (
       JOB_CODE VARCHAR2(30) CONSTRAINT PK_JOB PRIMARY KEY,
       JOB_NAME VARCHAR2(30) CONSTRAINT UK_JN UNIQUE
);

CREATE TABLE SKILL (
       SKILL_CODE VARCHAR2(30) CONSTRAINT PK_SKILL PRIMARY KEY,
       SKILL_NAME VARCHAR2(30) CONSTRAINT UK_SN UNIQUE
);

CREATE TABLE WORK_BOARD(
	WORK_NO VARCHAR2(14) CONSTRAINT PK_WORK_NO PRIMARY KEY,
	WORK_TITLE VARCHAR2(300),
	WORK_CONTENT VARCHAR2(3000),
	WORK_WRITER VARCHAR2(30),
	WORK_DATE DATE DEFAULT SYSDATE,
	WORK_JOB VARCHAR2(30),
	WORK_SKILL VARCHAR2(30),
	WORK_CAREER VARCHAR2(30),
	WORK_WORKPLACE VARCHAR2(300), /* 근무 지역 */
	WORK_STARTDATE DATE DEFAULT SYSDATE,
	WORK_ENDDATE DATE DEFAULT SYSDATE+14,
       CONSTRAINT FK_WORK_WR FOREIGN KEY(WORK_WRITER) REFERENCES MEMBER ON DELETE CASCADE,
       CONSTRAINT FK_WORK_JB FOREIGN KEY(WORK_JOB) REFERENCES WORKJOB ON DELETE CASCADE,
       CONSTRAINT FK_WORK_SK FOREIGN KEY(WORK_SKILL) REFERENCES SKILL ON DELETE CASCADE
);

CREATE SEQUENCE SEQ_WORK
       START WITH 1
       INCREMENT BY 1
       MAXVALUE 99
       MINVALUE 0
       NOCACHE
       CYCLE;
       
--INSERT INTO WORK_BOARD VALUES('111','222','333',NULL,DEFAULT,NULL,NULL,NULL,DEFAULT,DEFAULT);
--select * from WORK_BOARD;
--rollback;

CREATE TABLE WORK_BOARD_REVIEW(
       WORK_NO VARCHAR2(14) NOT NULL,
       WORK_REVIEWER VARCHAR2(30) NOT NULL,
       WORK_REVIEW_CONTENT VARCHAR2(450),
       WORK_REVIEW_DATE DATE DEFAULT SYSDATE,
       WORK_REVIEW_SCORE NUMBER(1) CHECK (WORK_REVIEW_SCORE IN (1,2,3,4,5)),
       CONSTRAINT FK_WREVIEW FOREIGN KEY(WORK_NO) REFERENCES WORK_BOARD ON DELETE CASCADE,
       CONSTRAINT FK_WREVIEWER FOREIGN KEY(WORK_REVIEWER) REFERENCES MEMBER ON DELETE CASCADE,
       CONSTRAINT PK_WREVIEW PRIMARY KEY(WORK_NO,WORK_REVIEWER) /* 1:n 기본 복합키 */
);

--------------->> INTERVIEW 영역 <<---------------
CREATE TABLE INTERVIEW(
  INTERVIEW_NO VARCHAR2(14) CONSTRAINT PK_INTVW PRIMARY KEY, /* 인터뷰번호 */
  INTERVIEWER VARCHAR2(30) NOT NULL,    /* 회사 */
  INTERVIEWEE VARCHAR2(30) NOT NULL,    /* 구직자 */
  INTERVIEW_QUESTION VARCHAR2(3000),   /* 질문 */
  INTERVIEW_ANSWER VARCHAR2(3000) NOT NULL,       /* 답변 */
  INTERVIEW_STARTDATE DATE DEFAULT SYSDATE,   /* 면접시작시간 */
  INTERVIEW_ENDDATE DATE DEFAULT SYSDATE,   /* 면접종료시간 */
  INTERVIEW_STATUS VARCHAR2(10) NOT NULL,      /* 면접상태 */
  WORK_NO VARCHAR2(14),      /* 구직게시글번호 */
  CONSTRAINT FK_INTERVIEWER FOREIGN KEY(INTERVIEWER) REFERENCES MEMBER_COMPANY(MEMBER_ID) ON DELETE CASCADE,
  CONSTRAINT FK_INTERVIEWEE FOREIGN KEY(INTERVIEWEE) REFERENCES MEMBER_USER(MEMBER_ID) ON DELETE CASCADE,
  CONSTRAINT FK_WORK_NO FOREIGN KEY(WORK_NO) REFERENCES WORK_BOARD ON DELETE CASCADE
);

COMMENT ON TABLE INTERVIEW IS '인터뷰';
COMMENT ON COLUMN INTERVIEW.INTERVIEW_NO IS '인터뷰번호';
COMMENT ON COLUMN INTERVIEW.INTERVIEWER IS '회사';
COMMENT ON COLUMN INTERVIEW.INTERVIEWEE IS '구직자';
COMMENT ON COLUMN INTERVIEW.INTERVIEW_QUESTION IS '질문';
COMMENT ON COLUMN INTERVIEW.INTERVIEW_ANSWER IS '답변';
COMMENT ON COLUMN INTERVIEW.INTERVIEW_STARTDATE IS '면접시작시간';
COMMENT ON COLUMN INTERVIEW.INTERVIEW_ENDDATE IS '면접종료시간';
COMMENT ON COLUMN INTERVIEW.INTERVIEW_STATUS IS '면접상태';
COMMENT ON COLUMN INTERVIEW.WORK_NO IS '구직게시글번호';

CREATE SEQUENCE SEQ_INTERVIEW
       START WITH 1
       INCREMENT BY 1
       MAXVALUE 99
       MINVALUE 0
       NOCACHE
       CYCLE;
       
--------------->> POWERLINK 영역 <<---------------
CREATE TABLE POWERLINK(
  MEMBER_ID VARCHAR2(30) NOT NULL,    /* 아이디 */
  POWERLINK_DATE DATE DEFAULT SYSDATE, /* 신청일 */
  POWERLINK_CNT NUMBER DEFAULT 0,    /* 신청횟수 */
  POWERLINK_TIME NUMBER DEFAULT 0,   /* 남은시간 */
  CONSTRAINT FK_PL_ID FOREIGN KEY(MEMBER_ID) REFERENCES MEMBER_COMPANY(MEMBER_ID) ON DELETE SET NULL
);

COMMENT ON TABLE POWERLINK IS '파워링크';
COMMENT ON COLUMN POWERLINK.POWERLINK_DATE IS '신청일';
COMMENT ON COLUMN POWERLINK.POWERLINK_CNT IS '신청횟수';
COMMENT ON COLUMN POWERLINK.MEMBER_ID IS '아이디';
COMMENT ON COLUMN POWERLINK.POWERLINK_TIME IS '남은시간';

--SELECT * FROM VW_COMPANY;

CREATE TRIGGER TR_POWERLINK
     AFTER
     INSERT ON MEMBER_COMPANY
     REFERENCING NEW AS NEW OLD AS OLD
     FOR EACH ROW
     DECLARE
       v_id VARCHAR2(30);
     BEGIN
       v_id := :NEW.MEMBER_ID;
       INSERT INTO POWERLINK(MEMBER_ID, POWERLINK_TIME, POWERLINK_DATE)
       VALUES(v_id, DEFAULT, TO_DATE('2017-01-01','RRRR-MM-DD'));
     END; 
     /
-- 1시간에 1번 구동하는 POWERLINK JOB_SCHEDULER

CREATE OR REPLACE PROCEDURE PR_POWERLINK
     IS
     BEGIN 
       UPDATE POWERLINK
       SET POWERLINK_TIME = POWERLINK_TIME - 1
       WHERE POWERLINK_TIME > 0;

     END PR_POWERLINK; 
     /
--SELECT * FROM SYS.USER_PROCEDUREs;
--SELECT * FROM USER_SCHEDULER_JOBS;

BEGIN
    DBMS_SCHEDULER.CREATE_JOB (
            job_name => 'DAJOB.JOB_PR_TIMER',
            job_type => 'PLSQL_BLOCK',
            job_action => 'DAJOB.PR_POWERLINK;',
            number_of_arguments => 0,
            start_date => SYSTIMESTAMP,
            repeat_interval => 'FREQ = HOURLY;INTERVAL = 1;',
            end_date => NULL,
            auto_drop => FALSE,
            comments => '파워링크 타이머 스케줄러 등록');

    DBMS_SCHEDULER.SET_ATTRIBUTE( 
             name => 'DAJOB.JOB_PR_TIMER', 
             attribute => 'logging_level', value => DBMS_SCHEDULER.LOGGING_OFF);
      
    DBMS_SCHEDULER.enable(
             name => 'DAJOB.JOB_PR_TIMER');
END;
/
EXEC DBMS_SCHEDULER.RUN_JOB('DAJOB.JOB_PR_TIMER');
--BEGIN
--      -- 잡 삭제
--      DBMS_JOB.REMOVE(job_no);
--      COMMIT;
--    END;
-- OR execute dbms_job.remove(잡번호);

-- JOB SCHEDULER 조회
--SELECT job, last_date, last_sec, next_date, next_sec, broken, interval, failures, what
--FROM   user_jobs;

--------------->> 기타 <<---------------
-- 좋아요 등록
CREATE TABLE LIKELIST(
       MEMBER_ID VARCHAR2(30),
       WORK_NO VARCHAR2(14),
       CONSTRAINT FK_LL_UID FOREIGN KEY(MEMBER_ID) REFERENCES MEMBER_USER(MEMBER_ID) ON DELETE CASCADE,
       CONSTRAINT FK_LL_WORKNO FOREIGN KEY(WORK_NO) REFERENCES WORK_BOARD ON DELETE CASCADE,
       CONSTRAINT PK_LL PRIMARY KEY (MEMBER_ID, WORK_NO)
);

-- 평균 연봉 기준
CREATE TABLE SAL_AVG(
       CERT_COUNT NUMBER,
       SAL_MIN NUMBER,
       SAL_MAX NUMBER
);

--선호기업리스트 VIEW
CREATE OR REPLACE VIEW VW_LIKECOMPLIST (WORK_NO, WORK_WRITER, WORK_SKILL, WORK_CAREER, WORK_WORKPLACE, WORK_STARTDATE, WORK_ENDDATE, MEMBER_ID)
AS SELECT WORK_NO, WORK_WRITER, WORK_SKILL, WORK_CAREER, WORK_WORKPLACE, WORK_STARTDATE, WORK_ENDDATE, MEMBER_ID FROM WORK_BOARD 
 JOIN LIKELIST USING(WORK_NO) ORDER BY WORK_ENDDATE ASC, WORK_WRITER ASC;

------->> 안재성 VIEW 생성부분 <<-------

-- CERT와 USER_CERT를 합친 뷰
CREATE OR REPLACE VIEW VW_TOTALCERT (MEMBER_ID, CERT_NAME, CERT_TYPE, CERT_DATE)
AS SELECT MEMBER_ID, CERT_NAME, CERT_TYPE, CERT_DATE FROM USER_CERT
JOIN CERT USING(CERT_NO);

-- 유저가 선호기업으로 지정해놓은 회사명과 그 해당하는 게시글의 정보를 불러오기위한 뷰
CREATE OR REPLACE VIEW VW_LIKELIST(MEMBER_ID, COMPANY_NAME, WORK_TITLE)
AS SELECT L.MEMBER_ID, C.COMPANY_NAME, W.WORK_TITLE
FROM LIKELIST L
JOIN WORK_BOARD W USING(WORK_NO)
JOIN VW_COMPANY C ON(W.WORK_WRITER = C.MEMBER_ID);

--------------->> 상민 VIEW 생성부분 <<---------------

-- Work here 샘플데이터
INSERT INTO WORK_BOARD VALUES('WO'||TO_CHAR(TO_DATE('1707141030','RRMMDDHH24MI'),'RRMMDDHH24MI')||LPAD(1,2,'0'),'급구합니다','랩 잘하는 친구 BRING IT!!','comp11',TO_DATE('1707141030','RRMMDDHH24MI'),'SW개발','JAVA ORACLE','없음','서울시 강남구',DEFAULT,DEFAULT);

--VW_WORKHERE
CREATE OR REPLACE VIEW VW_WORKHERE (WORK_NO,WORK_TITLE,WORK_CONTENT,WORK_WRITER,WORK_DATE,WORK_JOB,WORK_SKILL,WORK_CAREER,WORK_WORKPLACE,WORK_STARTDATE,WORK_ENDDATE,MEMBER_ID,  COMPANY_NAME , COMPANY_TYPE, COMPANY_STAFF, COMPANY_CAPITAL, COMPANY_CODE, COMPANY_TEL, COMPANY_FAX, COMPANY_WELFARE, COMPANY_DATE)
AS SELECT WORK_NO,WORK_TITLE,WORK_CONTENT,WORK_WRITER,WORK_DATE,WORK_JOB,WORK_SKILL,WORK_CAREER,WORK_WORKPLACE,WORK_STARTDATE,WORK_ENDDATE,MEMBER_ID,  COMPANY_NAME , COMPANY_TYPE, COMPANY_STAFF, COMPANY_CAPITAL, COMPANY_CODE, COMPANY_TEL, COMPANY_FAX, COMPANY_WELFARE, COMPANY_DATE FROM WORK_BOARD
JOIN MEMBER_COMPANY ON(MEMBER_COMPANY.MEMBER_ID = WORK_BOARD.WORK_WRITER);
commit;

--INTERVIEW 샘플데이터
INSERT INTO INTERVIEW VALUES('IN'||TO_CHAR(TO_DATE('1707141030','RRMMDDHH24MI'),'RRMMDDHH24MI')||LPAD(1,2,'0'),'comp11','user11','당신의 미래 가치관에 대해서 10000자로 서술하시오.',NULL,TO_DATE('1707141030','RRMMDDHH24MI'),TO_DATE('1707141130','RRMMDDHH24MI'),'H','WO170714103001');



CREATE OR REPLACE VIEW VW_INTERVIEW (INTERVIEW_NO,INTERVIEWER,INTERVIEWEE,INTERVIEW_QUESTION,INTERVIEW_ANSWER,INTERVIEW_START_DATE,INTERVIEW_END_DATE,INTERVIEW_STATUS,WORK_NO,MEMBER_ID,COMPANY_NAME,COMPANY_TYPE,COMPANY_STAFF,COMPANY_CAPITAL,COMPANY_CODE,COMPANY_TEL,COMPANY_FAX,COMPANY_WELFARE,COMPANY_DATE)
AS SELECT INTERVIEW_NO,INTERVIEWER,INTERVIEWEE,INTERVIEW_QUESTION,INTERVIEW_ANSWER,INTERVIEW_START_DATE,INTERVIEW_END_DATE,INTERVIEW_STATUS,WORK_NO,MEMBER_ID,COMPANY_NAME,COMPANY_TYPE,COMPANY_STAFF,COMPANY_CAPITAL,COMPANY_CODE,COMPANY_TEL,COMPANY_FAX,COMPANY_WELFARE,COMPANY_DATE FROM INTERVIEW
JOIN MEMBER_COMPANY ON(MEMBER_COMPANY.MEMBER_ID = INTERVIEW.INTERVIEWER);
commit;
select * from vw_interview;

--------------->> Sample Data <<---------------

INSERT INTO MEMBER_TYPE VALUES('A','관리자');
INSERT INTO MEMBER_TYPE VALUES('U','일반회원');
INSERT INTO MEMBER_TYPE VALUES('C','기업회원');

INSERT INTO COMP_TYPE VALUES('T1','소기업');
INSERT INTO COMP_TYPE VALUES('T2','중소기업');
INSERT INTO COMP_TYPE VALUES('T3','중견기업');
INSERT INTO COMP_TYPE VALUES('T4','대기업');
INSERT INTO COMP_TYPE VALUES('T5','공기업');
INSERT INTO COMP_TYPE VALUES('T6','외국계기업');
INSERT INTO COMP_TYPE VALUES('T7','벤처기업');

INSERT INTO WORKJOB VALUES(1,'웹 개발자');
INSERT INTO WORKJOB VALUES(2,'웹 퍼블리셔');
INSERT INTO WORKJOB VALUES(3,'웹 디자이너');
INSERT INTO WORKJOB VALUES(4,'임베디드 개발자');
INSERT INTO WORKJOB VALUES(5,'시스템 엔지니어');
INSERT INTO WORKJOB VALUES(6,'DB 관리자');
INSERT INTO WORKJOB VALUES(7,'서버 관리자');

INSERT INTO SKILL VALUES(1,'JAVA');
INSERT INTO SKILL VALUES(2,'Databases');
INSERT INTO SKILL VALUES(3,'Spring');
INSERT INTO SKILL VALUES(4,'C/C++');
INSERT INTO SKILL VALUES(5,'UNIX/LINUX');

INSERT INTO MEMBER VALUES('admin','admin','A','관리자','firerain4@naver.com','010-5688-2293','22020,서울시,강남구 역삼동',SYSDATE,'admin.jpg');
INSERT INTO MEMBER(MEMBER_ID,MEMBER_PASSWORD,MEMBER_TYPE_CODE,MEMBER_NAME,MEMBER_EMAIL,
MEMBER_PHONE,MEMBER_ADDRESS,MEMBER_SIGN_DATE,MEMBER_PROFILE_IMG)
VALUES('user11','pass11','U','유정훈','jeonghun@iei.or.kr',
'010-1111-2222','22020,서울시,강남구 역삼동',SYSDATE,'user11/yjh.jpg');
INSERT INTO MEMBER_USER(MEMBER_ID,GENDER,BIRTHDAY,RESUMEFILE)
VALUES('user11','M',SYSDATE,NULL);
INSERT INTO MEMBER(MEMBER_ID,MEMBER_PASSWORD,MEMBER_TYPE_CODE,MEMBER_NAME,MEMBER_EMAIL,
MEMBER_PHONE,MEMBER_ADDRESS,MEMBER_SIGN_DATE,MEMBER_PROFILE_IMG)
VALUES('user22','pass22','U','나상민','sm9171@iei.or.kr',
'010-2222-3333','22020,서울특별시,관악구 신림동',SYSDATE,'user22/test2.jpg');
INSERT INTO MEMBER_USER(MEMBER_ID,GENDER,BIRTHDAY,RESUMEFILE)
VALUES('user22','M',SYSDATE,NULL);
INSERT INTO MEMBER(MEMBER_ID,MEMBER_PASSWORD,MEMBER_TYPE_CODE,MEMBER_NAME,MEMBER_EMAIL,
MEMBER_PHONE,MEMBER_ADDRESS,MEMBER_SIGN_DATE,MEMBER_PROFILE_IMG)
VALUES('user33','pass33','U','김효현','kimhyohyeon@iei.or.kr',
'010-3333-4444','22020,서울특별시,서초구 반포동',SYSDATE,'user33/test3.jpg');
INSERT INTO MEMBER_USER(MEMBER_ID,GENDER,BIRTHDAY,RESUMEFILE)
VALUES('user33','M',SYSDATE,NULL);
INSERT INTO MEMBER(MEMBER_ID,MEMBER_PASSWORD,MEMBER_TYPE_CODE,MEMBER_NAME,MEMBER_EMAIL,
MEMBER_PHONE,MEMBER_ADDRESS,MEMBER_SIGN_DATE,MEMBER_PROFILE_IMG)
VALUES('user44','pass44','U','안재성','jaesung@iei.or.kr',
'010-4444-5555','22020,서울특별시, 송파구 잠실동',SYSDATE,'user44/test4.jpg');
INSERT INTO MEMBER_USER(MEMBER_ID,GENDER,BIRTHDAY,RESUMEFILE)
VALUES('user44','M',SYSDATE,NULL);
INSERT INTO MEMBER(MEMBER_ID,MEMBER_PASSWORD,MEMBER_TYPE_CODE,MEMBER_NAME,MEMBER_EMAIL,
MEMBER_PHONE,MEMBER_ADDRESS,MEMBER_SIGN_DATE,MEMBER_PROFILE_IMG)
VALUES('user55','pass55','U','정진모','jinmo@iei.or.kr',
'010-5555-6666','22020,경기도 용인시, 수지구 동천동',SYSDATE,'user55/test5.jpg');
INSERT INTO MEMBER_USER(MEMBER_ID,GENDER,BIRTHDAY,RESUMEFILE)
VALUES('user55','M',SYSDATE,NULL);
INSERT INTO MEMBER(MEMBER_ID,MEMBER_PASSWORD,MEMBER_TYPE_CODE,MEMBER_NAME,MEMBER_EMAIL,
MEMBER_PHONE,MEMBER_ADDRESS,MEMBER_SIGN_DATE,MEMBER_PROFILE_IMG)
VALUES('user66','pass66','U','유재영','jaeyoungboy@iei.or.kr',
'010-6666-7777','22020,서울특별시, 동작구 상도동',SYSDATE,'default.jpg');
INSERT INTO MEMBER_USER(MEMBER_ID,GENDER,BIRTHDAY,RESUMEFILE)
VALUES('user66','M',SYSDATE,NULL);
INSERT INTO MEMBER(MEMBER_ID,MEMBER_PASSWORD,MEMBER_TYPE_CODE,MEMBER_NAME,MEMBER_EMAIL,
MEMBER_PHONE,MEMBER_ADDRESS,MEMBER_SIGN_DATE,MEMBER_PROFILE_IMG)
VALUES('user77','pass77','U','배윤경','prettygirl@iei.or.kr',
'010-6666-7777','22020,강원도 춘천시, 효자동',SYSDATE,'default.jpg');
INSERT INTO MEMBER_USER(MEMBER_ID,GENDER,BIRTHDAY,RESUMEFILE)
VALUES('user77','F',SYSDATE,NULL);
INSERT INTO MEMBER(MEMBER_ID,MEMBER_PASSWORD,MEMBER_TYPE_CODE,MEMBER_NAME,MEMBER_EMAIL,
MEMBER_PHONE,MEMBER_ADDRESS,MEMBER_SIGN_DATE,MEMBER_PROFILE_IMG)
VALUES('user88','pass88','U','서지혜','cutygirl@iei.or.kr',
'010-7777-8888','22020,인천광역시 옹진군, 백령면 진촌리',SYSDATE,'default.jpg');
INSERT INTO MEMBER_USER(MEMBER_ID,GENDER,BIRTHDAY,RESUMEFILE)
VALUES('user88','F',SYSDATE,NULL);
INSERT INTO MEMBER(MEMBER_ID,MEMBER_PASSWORD,MEMBER_TYPE_CODE,MEMBER_NAME,MEMBER_EMAIL,
MEMBER_PHONE,MEMBER_ADDRESS,MEMBER_SIGN_DATE,MEMBER_PROFILE_IMG)
VALUES('user99','pass99','U','김세린','beutifulgirl@iei.or.kr',
'010-8888-9999','22020,전라북도 익산시, 모현동',SYSDATE,'default.jpg');
INSERT INTO MEMBER_USER(MEMBER_ID,GENDER,BIRTHDAY,RESUMEFILE)
VALUES('user99','F',SYSDATE,NULL);
INSERT INTO MEMBER(MEMBER_ID,MEMBER_PASSWORD,MEMBER_TYPE_CODE,MEMBER_NAME,MEMBER_EMAIL,
MEMBER_PHONE,MEMBER_ADDRESS,MEMBER_SIGN_DATE,MEMBER_PROFILE_IMG)
VALUES('user00','pass00','U','배주현','irin@iei.or.kr',
'010-9999-0000','22020,대구광역시, 중구 동인동',SYSDATE,'default.jpg');
INSERT INTO MEMBER_USER(MEMBER_ID,GENDER,BIRTHDAY,RESUMEFILE)
VALUES('user00','F',SYSDATE,NULL);

INSERT INTO MEMBER(MEMBER_ID,MEMBER_PASSWORD,MEMBER_TYPE_CODE,
MEMBER_NAME,MEMBER_EMAIL,MEMBER_PHONE,MEMBER_ADDRESS,MEMBER_SIGN_DATE,MEMBER_PROFILE_IMG)
VALUES('comp11','pass11','C','김한조','comp11@iei.or.kr','010-2111-1111','22021,서울시,강남구 선릉동',SYSDATE,'comp11/comp11.jpg');
INSERT INTO MEMBER_COMPANY(MEMBER_ID,COMPANY_TYPE,COMPANY_NAME,COMPANY_STAFF,COMPANY_CAPITAL,
COMPANY_CODE,COMPANY_TEL,COMPANY_FAX,COMPANY_WELFARE,COMPANY_DATE)
VALUES('comp11','T3','가나주식회사',250,150,'402-00-00001','02-0001-0001',
'02-0001-0002','4대보험,유류비 지원,야근 수당',TO_DATE('2000-02-01','RRRR-MM-DD'));
INSERT INTO MEMBER(MEMBER_ID,MEMBER_PASSWORD,MEMBER_TYPE_CODE,
MEMBER_NAME,MEMBER_EMAIL,MEMBER_PHONE,MEMBER_ADDRESS,MEMBER_SIGN_DATE,MEMBER_PROFILE_IMG)
VALUES('comp22','pass22','C','다길마크','comp22@iei.or.kr','010-2112-1111','221,서울시,강남구 서초동',SYSDATE,'comp22/comp22.jpg');
INSERT INTO MEMBER_COMPANY(MEMBER_ID,COMPANY_TYPE,COMPANY_NAME,COMPANY_STAFF,COMPANY_CAPITAL,
COMPANY_CODE,COMPANY_TEL,COMPANY_FAX,COMPANY_WELFARE,COMPANY_DATE)
VALUES('comp22','T2','동막골 주식회사',250,150,'402-01-00001','02-0002-0001',
'02-0002-0002','4대보험,상여금 지급',TO_DATE('2010-07-15','RRRR-MM-DD'));
INSERT INTO MEMBER(MEMBER_ID,MEMBER_PASSWORD,MEMBER_TYPE_CODE,
MEMBER_NAME,MEMBER_EMAIL,MEMBER_PHONE,MEMBER_ADDRESS,MEMBER_SIGN_DATE,MEMBER_PROFILE_IMG)
VALUES('comp33','pass33','C','다리우스 장','comp33@iei.or.kr','010-2113-1111','210,서울시,강남구 논현동',SYSDATE,'comp33/comp33.jpg');
INSERT INTO MEMBER_COMPANY(MEMBER_ID,COMPANY_TYPE,COMPANY_NAME,COMPANY_STAFF,COMPANY_CAPITAL,
COMPANY_CODE,COMPANY_TEL,COMPANY_FAX,COMPANY_WELFARE,COMPANY_DATE)
VALUES('comp33','T4','IT 유니언즈',250,150,'402-02-00001','02-0003-0001',
'02-0003-0002','4대보험,유류비 지원,상여금 지급,야근 수당,자기개발비 지원',TO_DATE('1998-10-25','RRRR-MM-DD'));
--SELECT * FROM POWERLINK;
--UPDATE POWERLINK SET POWERLINK_CNT = POWERLINK_CNT + 1, POWERLINK_TIME = 120;

INSERT INTO CERT VALUES('CE170101010000','OCJP','JAVA');
INSERT INTO CERT VALUES('CE170101010001','OCWCD','JAVA');
INSERT INTO CERT VALUES('CE170101010002','OCBCD','JAVA');
INSERT INTO CERT VALUES('CE170101010003','SQLD','DB');
INSERT INTO CERT VALUES('CE170101010004','SQLP','DB');
INSERT INTO CERT VALUES('CE170101010005','DAsP','DB');
INSERT INTO CERT VALUES('CE170101010006','DAP','DB');
INSERT INTO CERT VALUES('CE170101010007','ADsP','DB');
INSERT INTO CERT VALUES('CE170101010008','ADP','DB');
INSERT INTO CERT VALUES('CE170101010009','사무자동화기사','공통');
INSERT INTO CERT VALUES('CE170101010010','정보처리기사','공통');
INSERT INTO CERT VALUES('CE170101010011','정보처리산업기사','공통');
INSERT INTO CERT VALUES('CE170101010012','컴퓨터활용1급','공통');
INSERT INTO CERT VALUES('CE170101010013','리눅스마스터1급','공통');
INSERT INTO CERT VALUES('CE170101010014','MOS','공통');

INSERT ALL
   INTO USER_CERT(MEMBER_ID, CERT_NO, CERT_DATE)
	VALUES ('user11','CE170101010006',SYSDATE)
   INTO USER_CERT(MEMBER_ID, CERT_NO, CERT_DATE)
	VALUES ('user11','CE170101010009',SYSDATE)
   INTO USER_CERT(MEMBER_ID, CERT_NO, CERT_DATE)
	VALUES ('user11','CE170101010010',SYSDATE)
   INTO USER_CERT(MEMBER_ID, CERT_NO, CERT_DATE)
	VALUES ('user11','CE170101010011',SYSDATE)
   INTO USER_CERT(MEMBER_ID, CERT_NO, CERT_DATE)
	VALUES ('user22','CE170101010007',SYSDATE)
   INTO USER_CERT(MEMBER_ID, CERT_NO, CERT_DATE)
	VALUES ('user22','CE170101010009',SYSDATE)
   INTO USER_CERT(MEMBER_ID, CERT_NO, CERT_DATE)
	VALUES ('user22','CE170101010010',SYSDATE)
   INTO USER_CERT(MEMBER_ID, CERT_NO, CERT_DATE)
	VALUES ('user33','CE170101010001',SYSDATE)
   INTO USER_CERT(MEMBER_ID, CERT_NO, CERT_DATE)
	VALUES ('user33','CE170101010003',SYSDATE)
   INTO USER_CERT(MEMBER_ID, CERT_NO, CERT_DATE)
	VALUES ('user33','CE170101010005',SYSDATE)
SELECT * FROM DUAL;

INSERT INTO NOTICE VALUES('NO'||TO_CHAR(TO_DATE('1707121425','RRMMDDHH24MI'),'RRMMDDHH24MI')||LPAD(1,2,'0'),'DAJOB OPEN','THE DIRECT JOB',TO_DATE('2017-01-05','RRRR-MM-DD'));
INSERT INTO NOTICE VALUES('NO'||TO_CHAR(TO_DATE('1701061110','RRMMDDHH24MI'),'RRMMDDHH24MI')||LPAD(1,2,'1'),'DAJOB TEST Notice','DAJOB TEST Notice',TO_DATE('2017-01-06','RRRR-MM-DD'));
INSERT INTO NOTICE VALUES('NO'||TO_CHAR(TO_DATE('1701061112','RRMMDDHH24MI'),'RRMMDDHH24MI')||LPAD(1,2,'2'),'DAJOB TEST Search Title','DAJOB TEST Search Title',TO_DATE('2017-01-07','RRRR-MM-DD'));
INSERT INTO NOTICE VALUES('NO'||TO_CHAR(TO_DATE('1701061113','RRMMDDHH24MI'),'RRMMDDHH24MI')||LPAD(1,2,'3'),'DAJOB TEST Paging','DAJOB TEST Paging',TO_DATE('2017-01-08','RRRR-MM-DD'));
INSERT INTO NOTICE VALUES('NO'||TO_CHAR(TO_DATE('1701061114','RRMMDDHH24MI'),'RRMMDDHH24MI')||LPAD(1,2,'4'),'DAJOB TEST Reply','DAJOB TEST Reply',TO_DATE('2017-01-09','RRRR-MM-DD'));
INSERT INTO NOTICE VALUES('NO'||TO_CHAR(TO_DATE('1701061115','RRMMDDHH24MI'),'RRMMDDHH24MI')||LPAD(1,2,'5'),'DAJOB TEST Reply Level','DAJOB TEST Reply Level',TO_DATE('2017-01-10','RRRR-MM-DD'));
INSERT INTO NOTICE VALUES('NO'||TO_CHAR(TO_DATE('1707130239','RRMMDDHH24MI'),'RRMMDDHH24MI')||LPAD(1,2,'0'),'[축]개업기념','이벤트 개최 행사 진행중 ! ',TO_DATE('2017-04-15','RRRR-MM-DD'));
INSERT INTO NOTICE VALUES('NO'||TO_CHAR(TO_DATE('1707142030','RRMMDDHH24MI'),'RRMMDDHH24MI')||LPAD(1,2,'0'),'[긴급] 서버 점검','서버점검이 있을 예정이오니 신속히 로그아웃을 하고 홈페이지를 닫아주세요',TO_DATE('2017-06-10','RRRR-MM-DD'));
INSERT INTO NOTICE VALUES('NO'||TO_CHAR(TO_DATE('1707151124','RRMMDDHH24MI'),'RRMMDDHH24MI')||LPAD(1,2,'0'),'[긴급] 서버 점검기간 연장 안내문','서버 점검이 지연되어 기간이 늘어남을 알립니다.',TO_DATE('2017-07-11','RRRR-MM-DD'));
INSERT INTO NOTICE VALUES('NO'||TO_CHAR(TO_DATE('1707152130','RRMMDDHH24MI'),'RRMMDDHH24MI')||LPAD(1,2,'0'),'[공지] 서버 점검 완료 공지','서버점검이 완료 되었습니다.',TO_DATE('2017-07-12','RRRR-MM-DD'));
INSERT INTO NOTICE VALUES('NO'||TO_CHAR(TO_DATE('1707171530','RRMMDDHH24MI'),'RRMMDDHH24MI')||LPAD(1,2,'0'),'[공지] 관련 기업에 대하여','관련 기업을 찾으시는 회원분들께 안내 말씀 드립니다. 본 사이트의 주 목적은 제 1장 관련된 해당 기업의 정보를 공유할 수 있습니다.',TO_DATE('2017-07-13','RRRR-MM-DD'));
INSERT INTO NOTICE VALUES('NO'||TO_CHAR(TO_DATE('1707182130','RRMMDDHH24MI'),'RRMMDDHH24MI')||LPAD(1,2,'0'),'[공지] 내가 원하는 기업에 대하여','나와 맞는 기업을 찾기위해 내 정보를 마이페이지나 체크박스를 통하여 취득한 자격증 전공한 기술 등 을 보고 기업을 찾을 수 있습니다.',TO_DATE('2017-07-15','RRRR-MM-DD'));
INSERT INTO NOTICE VALUES('NO'||TO_CHAR(TO_DATE('1707182230','RRMMDDHH24MI'),'RRMMDDHH24MI')||LPAD(1,2,'0'),'[공지]  서버 관리자 모집','서버 관리자를 모집합니다. 지원조건은 만 19세 이상 만 30세 미만의 여성 우대이며, 남성은 경력자 우대 스프링 코드를 구현해보신 분을 모집합니다.',TO_DATE('2017-07-15','RRRR-MM-DD'));
INSERT INTO NOTICE VALUES('NO'||TO_CHAR(TO_DATE('1707182330','RRMMDDHH24MI'),'RRMMDDHH24MI')||LPAD(1,2,'0'),'[Inform] SERVER WINTER EVENT','COLD WINTER EVENT COME HERE WE FIND IT MY SELF',TO_DATE('2017-07-17','RRRR-MM-DD'));
INSERT INTO NOTICE VALUES('NO'||TO_CHAR(TO_DATE('1707190130','RRMMDDHH24MI'),'RRMMDDHH24MI')||LPAD(1,2,'0'),'[공지] 해외 기업 협약 안내문','해외기업을 선호하시는 분들은 해외 기업과 협약서를 같이 제출하여 지원할 수 있습니다.',TO_DATE('2017-07-17','RRRR-MM-DD'));
INSERT INTO NOTICE VALUES('NO'||TO_CHAR(TO_DATE('1707190330','RRMMDDHH24MI'),'RRMMDDHH24MI')||LPAD(1,2,'0'),'[Inform] Notice about Career staff', 'When resigning from a job role, it is considered best practice to give your employer the notice period as stated in your contract before you depart. This period of time allows your employer to plan for your departure, and to ensure that your job responsibilities are fully covered as to not disrupt the business and work flow.',TO_DATE('2017-07-17','RRRR-MM-DD'));
INSERT INTO NOTICE VALUES('NO'||TO_CHAR(TO_DATE('1707191030','RRMMDDHH24MI'),'RRMMDDHH24MI')||LPAD(1,2,'0'),'[공지] KG모빌리언스 크롬 브라우저 일부버전 오류관련 공지','현재 크롬 웹브라우저 및 웹뷰 일부 버전에서 오류현상이 발생중이므로 하단 내용 참고 부탁드립니다.',TO_DATE('2017-07-15','RRRR-MM-DD'));
INSERT INTO NOTICE VALUES('NO'||TO_CHAR(TO_DATE('1707192130','RRMMDDHH24MI'),'RRMMDDHH24MI')||LPAD(1,2,'0'),'[긴급] 다날 휴대폰 결제 정산관련 사용중지 안내','현재 다날 휴대폰 결제를 이용하고있는 상점에서 "익주정산(매출 주의 익주 수요일)", "익초 정산(매출월의 익월 5일)" 주기로 선택하여 계약한 상점은 정상결제 진행이 안되고 있는 부분으로,
기능 수정전까지 다날 휴대폰 결제 사용을 중지해 주시기 바라며 다날쪽과 확인하여 빠른시일내로 정상처리 될 수있도록 하겠습니다.',TO_DATE('2017-07-16','RRRR-MM-DD'));
INSERT INTO NOTICE VALUES('NO'||TO_CHAR(TO_DATE('1707201530','RRMMDDHH24MI'),'RRMMDDHH24MI')||LPAD(1,2,'0'),'[공지] 다음 커머스원 기업 업데이트 일시 중단_8/16 (수요일)','DB 작업으로 인해, 커머스원의 기업 업데이트  작업이 2017년 8월 16일 14시부터 18시까지 중단됩니다. 작업 종료 후 스케쥴에 따라 정상적으로 상품 수집을 진행할 예정이며, 기존에 커머스원을 통해 기업 업데이트가 지연되는 문제들도 정상적으로 업데이트 진행될 예정입니다',TO_DATE('2017-07-16','RRRR-MM-DD'));
INSERT INTO NOTICE VALUES('NO'||TO_CHAR(TO_DATE('1707222030','RRMMDDHH24MI'),'RRMMDDHH24MI')||LPAD(1,2,'0'),'[긴급] 오류 점검 일시 금일 오후 밤 10시부터','데이터 업데이트로 인한 오류및 점검 수정이 있을 예정이오니 오후 10시 이후 서비스가 중단될 예정입니다.',TO_DATE('2017-08-17','RRRR-MM-DD'));

INSERT INTO NOTICE_REPLY VALUES('NP170722012001','NO170720153001','넵, 알겠습니다.','user11',SYSDATE,0,NULL);
INSERT INTO NOTICE_REPLY VALUES('NP170722012002','NO170720153001','빨리 정상화 되면 좋겠네요.','user22',SYSDATE,1,'NP170722012001');
INSERT INTO NOTICE_REPLY VALUES('NP170722013002','NO170720153001','그러게요. 관리자님 고생 많으시네요.','user44',SYSDATE,1,'NP170722012001');
INSERT INTO NOTICE_REPLY VALUES('NP170722012003','NO170720153001','넵, 숙지할게요~~','user33',SYSDATE,0,NULL);
INSERT INTO NOTICE_REPLY VALUES('NP170722012004','NO170720153001','숙지하겠습니다','user44',SYSDATE,0,NULL);
INSERT INTO NOTICE_REPLY VALUES('NP170723012001','NO170722203001','무플 방지 위원회에서 왔... 죄송합니다.','user11',SYSDATE,0,NULL);
INSERT INTO NOTICE_REPLY VALUES('NP170723012002','NO170722203001','넵, 알겠습니다.','user22',SYSDATE,1,'NP170723012001');
INSERT INTO NOTICE_REPLY VALUES('NP170723012003','NO170722203001','예압!!','user33',SYSDATE,2,'NP170723012002');

INSERT INTO POWERLINK VALUES('comp11',TO_DATE('2017-08-11','RRRR-MM-DD'),2,0);
INSERT INTO POWERLINK VALUES('comp11',TO_DATE('2017-09-10','RRRR-MM-DD'),2,0);
INSERT INTO POWERLINK VALUES('comp22',TO_DATE('2017-09-05','RRRR-MM-DD'),1,0);
INSERT INTO POWERLINK VALUES('comp22',TO_DATE('2017-10-04','RRRR-MM-DD'),1,420);
INSERT INTO POWERLINK VALUES('comp33',TO_DATE('2017-08-21','RRRR-MM-DD'),2,0);
INSERT INTO POWERLINK VALUES('comp33',TO_DATE('2017-09-11','RRRR-MM-DD'),3,0);
INSERT INTO POWERLINK VALUES('comp33',TO_DATE('2017-10-01','RRRR-MM-DD'),1,264);

INSERT INTO SAL_AVG VALUES(1,2000,2200);
INSERT INTO SAL_AVG VALUES(3,2200,2400);
INSERT INTO SAL_AVG VALUES(5,2400,2600);
INSERT INTO SAL_AVG VALUES(7,2600,2800);
INSERT INTO SAL_AVG VALUES(9,2800,3000);

INSERT INTO ITINFO VALUES('IT170812022000','인공 지능과 고급 머신 러닝','인공 지능과 고급 머신 러닝은 딥 러닝(deep learning), 신경망, 자연어 처리 등 다양한 기술 및 기법으로 이루어진다. 이외에도 많은 첨단 기법들이 전통적인 규칙 기반 알고리즘을 넘어 이해, 학습, 예측 및 적응할 뿐 아니라 잠재적으로 스스로 가동되는 자율 시스템을 만들어낸다. 이것이 바로 스마트 기기를 ''지능적'' 으로 보이도록 만든다.<br><br>
데이비드 설리 부사장은 "응용 AI와 고급 머신 러닝을 통해 로봇, 자율주행차, 가전 기기와 같은 물리적 디바이스뿐 아니라, 가상 개인 비서(VPA: Virtual Personal Assistant)나 스마트 어드바이저(smart advisor)와 같은 앱 및 서비스와 같이 다양한 종류의 지능형 구현이 이뤄지고 있다. 이는 새로운 유형의 지능형 앱과 사물을 제공하는 동시에, 다양한 메시 디바이스와 기존 소프트웨어 및 서비스 솔루션들을 위한 내장형 인텔리전스를 제공하게 될 것"으로 전망했다.'
,'itinfoImage/image1.jpg',TO_DATE('2017-08-12','RRRR-MM-DD'));
INSERT INTO ITINFO VALUES('IT170813022000','지능형 앱(Intelligent App)','가상 개인 비서와 같은 지능형 앱은 실제 비서의 일부 기능들을 수행할 수 있어 이메일 우선순위 분류와 같은 일상적인 업무를 보다 쉽게 처리할 수 있도록 도와주며, 가장 중요한 콘텐츠 및 상호 작용을 선택해 사용자들의 업무 효율성을 높여준다. 가상 고객 도우미(VCA: Virtual Customer Assistant)와 같은 지능형 앱은 영업 및 고객 서비스에서 보다 전문적으로 업무를 처리한다. 이와 같이 지능형 앱은 업무의 특성과 업무 공간 구조를 변화시킬 가능성을 지니고 있다.<br><br>
데이비드 설리 부사장은 "향후 10년 안으로 대부분의 앱과 애플리케이션, 서비스는 일정 수준의 AI를 탑재하게 될 것”이라며 “이는 앱과 서비스를 위한 AI와 머신 러닝의 적용 범위를 지속해서 발전 및 확장하는 장기적인 트렌드를 형성할 것"이라고 말했다.'
,'itinfoImage/image2.jpg',TO_DATE('2017-08-13','RRRR-MM-DD'));
INSERT INTO ITINFO VALUES('IT170814022000','지능형 사물(Intelligent Things)','지능형 사물은 융통성이 없는 프로그래밍 모델의 실행력을 넘어 응용 AI와 머신 러닝을 통해 고급 기능을 수행하고, 주변 환경이나 사람들과 보다 자연스럽게 소통하는 물리적 사물이다. 가트너는 드론, 자율 주행차, 스마트 기기와 같은 지능형 사물이 점차 확산되면서 개별 지능형 사물에서 협업 지능형 사물 모델로 전환되리라 전망했다.'
,'itinfoImage/image3.jpg',TO_DATE('2017-08-14','RRRR-MM-DD'));
INSERT INTO ITINFO VALUES('IT170815022000','가상 현실 및 증강 현실','가상현실(VR) 및 증강현실(AR)과 같은 몰입형 기술들은 사람들간, 또는 사람과 소프트웨어 시스템이 소통하는 방식을 바꾸고 있다. 데이비드 설리 부사장은 "개인 및 기업용 몰입형 콘텐츠와 애플리케이션 분야는 2021년까지 폭발적으로 성장할 전망이다.<br><br>
VR과 AR 기능은 디지털 메시와 결합되어 사용자에게 초개인화(hyperpersonalized) 앱이나 서비스 형태로 제공되는 정보의 흐름을 조정할 수 있는 역량을 갖춘 보다 원활한 디바이스 시스템을 구축하게 될 것이다. 몰입형 애플리케이션은 다양한 모바일, 웨어러블, 사물인터넷(IoT) 및 다수의 센서를 탑재한 환경의 통합으로 고립된 1인 경험을 뛰어넘는 경험을 제공할 것이다. 방과 공간들은 사물을 통해 활성화되고, 메시를 통한 연결은 몰입형 가상 세계와 함께 나타나고 사용될 것"이라고 말했다.'
,'itinfoImage/image4.jpg',TO_DATE('2017-08-15','RRRR-MM-DD'));
INSERT INTO ITINFO VALUES('IT170816022000','디지털 트윈(Digital Twin)','물리적 사물이나 시스템의 동적 소프트웨어 모델인 디지털 트윈은 센서 데이터를 통해 현재 상태 파악하고, 변화에 대응하며, 운영 개선 및 가치 향상을 제공한다. 디지털 트윈은 메타데이터(분류, 구성, 구조)를 포함해, 조건이나 상태(위치, 기온), 이벤트 데이터(시계열), 애널리틱스(알고리즘, 규칙)와 같은 복합적인 요소를 포함한다.<br><br>
3~5년 안에 수백만 개의 사물이 디지털 트윈으로 표현될 것이다. 기업들은 디지털 트윈을 통해 장비 서비스에 대한 능동적인 수리 및 계획 수립 및 제조 공정 계획, 공장 가동, 장비 고장 예측, 운영 효율성 향상, 개선된 제품 개발이 가능해질 것이다. 이와 같이 디지털 트윈은 숙련된 인력과 압력 게이지나 압력 밸브와 같은 전통적인 모니터링 및 제어 기기의 조합을 위한 대안이 될 것이다.'
,'itinfoImage/image5.jpg',TO_DATE('2017-08-16','RRRR-MM-DD'));
INSERT INTO ITINFO VALUES('IT170817022000','블록체인과 분산 장부(Distributed Ledgers)','블록체인은 비트코인 및 기타 토큰과 같은 가치 교환 거래가 블록 단위로 순차적으로 분류된 형태의 분산 장부이다. 각 블록은 기존 블록에 연결되고 P2P 네트워크를 통해 기록되며, 암호화 트러스트 및 인증 방식을 사용한다. 블록체인과 분산 장부 개념은 업계의 경영 모델을 변화시킬 수 있다는 가능성을 보여준다는 점에서 주목을 받고 있다. 현재 금융 서비스 업계와 관련하여 과장된 주장들이 있지만, 음원 유통, 신원 확인, 타이틀 등록 및 공급망 등에서 다양하게 활용될 가능성이 있다.<br><br>
데이비드 설리 부사장은 "분산 장부는 혁신을 가져올 가능성을 지니고 있지만, 대부분의 계획들은 아직 알파 및 베타 테스트 초기 단계에 머물러 있다"고 말했다.'
,'itinfoImage/image6.jpg',TO_DATE('2017-08-17','RRRR-MM-DD'));
INSERT INTO ITINFO VALUES('IT170818022000','대화형 시스템(Conversational System)','현재 대화형 인터페이스는 주로 스피커, 스마트폰, 태블릿, PC, 자동차 등에 탑재되는 챗봇(chatbot)과 음성 지원 기기에 중점을 두고 있다. 하지만, 디지털 메시는 사람들이 애플리케이션과 정보에 접근하거나 사람, 소셜 커뮤니티, 정부 및 기업과 소통할 때 사용되는 확장된 디바이스를 포함한다. <br><br>
디바이스 메시는 전통적인 데스크톱 컴퓨터와 모바일 기기를 뛰어넘어 사람과 소통할 수 있는 광범위한 디바이스를 아우른다. 디바이스 메시가 확장되면서 통신 모델이 확장되고, 보다 다양한 기기간 협력적 소통이 등장하면서 새로운 지속적이면서 편재된 디지털 경험을 위한 기반을 마련하게 될 것이다.'
,'itinfoImage/image7.jpg',TO_DATE('2017-08-18','RRRR-MM-DD'));
INSERT INTO ITINFO VALUES('IT170819022000','메시 앱 및 서비스 아키텍처(MASA)','메시 앱 및 서비스 아키텍처(MASA: Mesh App and Service Architecture)에서 모바일 앱, 웹 앱, 데스크톱 앱, IoT 앱은 광범위한 백엔드 서비스 메시로 연결되어 사용자가 ‘애플리케이션’으로 인식하는 것을 만든다. 이 아키텍처는 서비스를 압축하고 조직의 경계 전반에서 API를 다양한 수준으로 노출시켜 서비스의 신속성 및 확장성에 대한 요구와 서비스의 조합(composition) 및 재사용 간의 균형을 유지한다.<br><br>
MASA는 사용자들이 데스크톱, 스마트폰, 자동차와 같은 디지털 메시에서 최적화된 솔루션을 보유할 수 있도록 하고, 이렇게 서로 다른 채널을 이동하는 동안에도 지속적인 경험을 제공한다.'
,'itinfoImage/image8.jpg',TO_DATE('2017-08-19','RRRR-MM-DD'));
INSERT INTO ITINFO VALUES('IT170820022000','디지털 기술 플랫폼(Digital Technology Platform)','디지털 기술 플랫폼은 디지털 비즈니스를 위한 기본적인 구성 요소를 제공하며, 디지털 비즈니스를 실현하기 위한 핵심 기술이다. 가트너는 디지털 비즈니스의 새로운 역량과 비즈니스 모델을 실현하기 위해 필수적인 5가지 핵심 요소로 정보 시스템, 고객 경험, 분석 및 인텔리전스, IoT, 비즈니스 생태계를 선정했다. 모든 기업은 5가지 디지털 기술 플랫폼 중 어느 정도는 보유하고 있을 것이다.<br><br>
이 5가지 플랫폼은 디지털 비즈니스를 구축하는데 기본적인 구성 요소이며, 디지털 비즈니스를 실현하기 위해 갖춰야 할 핵심 기술이다.'
,'itinfoImage/image9.jpg',TO_DATE('2017-08-20','RRRR-MM-DD'));
INSERT INTO ITINFO VALUES('IT170821022000','능동형 보안 아키텍처(Adaptive Security Architecture)','지능형 디지털 메시와 관련 디지털 기술 플랫폼, 애플리케이션 아키텍처는 보안 측면에서 그 어느 때보다 복잡해지고 있다. 데이비드 설리 부사장은 "기존의 보안 기술들은 IoT 플랫폼을 보호하기 위한 기준으로 활용되어야 한다. 특히 사용자 및 기업의 활동을 모니터링하는 것은 IoT 시나리오에 추가되어야 하는 중요한 기능이다.<br><br>
하지만, IoT의 한계는 수많은 IT 보안 담당자들에게 새로운 영역으로 새로운 취약 지점 영역을 생성하고 있기 때문에 새로운 교정 툴과 프로세스가 필요하며 IoT 플랫폼 관련 프로젝트에서는 이를 반드시 고려해야 할 것"이라고 강조했다.'
,'itinfoImage/image10.jpg',TO_DATE('2017-08-21','RRRR-MM-DD'));

commit;

-----------------------------------------------
