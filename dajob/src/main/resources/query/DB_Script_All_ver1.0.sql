/*** Final 데이터 베이스 스크립트 Ver 1.0 ***/
/* ID : dajob / PWD : dajob1710 */

/** 1.0 ver 스크립트 초기화를 위한 테이블 삭제 **/

DROP TABLE MEMBER_TYPE CASCADE CONSTRAINTS;
DROP TABLE MEMBER CASCADE CONSTRAINTS;
DROP TABLE MEMBER_USER CASCADE CONSTRAINTS;
DROP TABLE COMP_TYPE CASCADE CONSTRAINTS;
DROP TABLE MEMBER_COMPANY CASCADE CONSTRAINTS;
DROP TABLE CERT CASCADE CONSTRAINTS;
DROP TABLE USER_CERT CASCADE CONSTRAINTS;
DROP VIEW VW_USER;
DROP VIEW VW_COMPANY;

DROP TABLE ITINFO CASCADE CONSTRAINTS;
DROP SEQUENCE SEQ_ITINFO;

DROP TABLE NOTICE CASCADE CONSTRAINTS;
DROP SEQUENCE SEQ_NOTICE;
DROP TABLE NOTICE_REPLY CASCADE CONSTRAINTS;
DROP SEQUENCE SEQ_NO_REP;

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
	MEMBER_PROFILE_IMG VARCHAR2(50) DEFAULT 'default.img', /* 프로필 이미지 */
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
       RESUMEFILE VARCHAR2(50) DEFAULT NULL,   /* 첨부파일 */
       CONSTRAINT FK_U_MEMBER FOREIGN KEY(MEMBER_ID) REFERENCES MEMBER ON DELETE CASCADE
);

COMMENT ON TABLE MEMBER_USER IS '일반회원';
COMMENT ON COLUMN MEMBER_USER.MEMBER_ID IS '아이디';
COMMENT ON COLUMN MEMBER_USER.GENDER IS '성별';
COMMENT ON COLUMN MEMBER_USER.BIRTHDAY IS '생년월일';
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
       CONSTRAINT FK_WORK_WR FOREIGN KEY(WORK_WRITER) REFERENCES MEMBER ON DELETE CASCADE
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
  INTERVIEW_DATE DATE DEFAULT SYSDATE,   /* 면접시간 */
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
COMMENT ON COLUMN INTERVIEW.INTERVIEW_DATE IS '면접시간';
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
  CONSTRAINT FK_PL_ID FOREIGN KEY(MEMBER_ID) REFERENCES MEMBER_COMPANY(MEMBER_ID) ON DELETE CASCADE
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
       INSERT INTO POWERLINK(MEMBER_ID, POWERLINK_CNT, POWERLINK_TIME)
       VALUES(v_id, DEFAULT, DEFAULT);
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
       MEMBER_ID,
       WORK_NO,
       CONSTRAINT FK_LL_UID FOREIGN KEY(MEMBER_ID) REFERENCES MEMBER_USER(MEMBER_ID) ON DELETE CASCADE,
       CONSTRAINT FK_LL_WORKNO FOREIGN KEY(WORK_NO) REFERENCES WORK_BOARD ON DELETE CASCADE
);

-- 평균 연봉 기준
CREATE TABLE SAL_AVG(
       CERT_COUNT NUMBER,
       SAL_MIN NUMBER,
       SAL_MAX NUMBER
);

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

INSERT INTO MEMBER VALUES('admin','admin','A','관리자','firerain4@naver.com','010-5688-2293','22020,서울시,강남구 역삼동',SYSDATE,DEFAULT);
INSERT INTO MEMBER(MEMBER_ID,MEMBER_PASSWORD,MEMBER_TYPE_CODE,MEMBER_NAME,MEMBER_EMAIL,
MEMBER_PHONE,MEMBER_ADDRESS,MEMBER_SIGN_DATE,MEMBER_PROFILE_IMG)
VALUES('user11','pass11','U','유정훈','jeonghun@iei.or.kr',
'010-1111-2222','22020,서울시,강남구 역삼동',SYSDATE,'default.jpg');
INSERT INTO MEMBER_USER(MEMBER_ID,GENDER,BIRTHDAY,RESUMEFILE)
VALUES('user11','M',SYSDATE,NULL);

INSERT INTO MEMBER(MEMBER_ID,MEMBER_PASSWORD,MEMBER_TYPE_CODE,
MEMBER_NAME,MEMBER_EMAIL,MEMBER_PHONE,MEMBER_ADDRESS,MEMBER_SIGN_DATE,MEMBER_PROFILE_IMG)
VALUES('comp11','pass11','C','김갑환','comp11@iei.or.kr','010-2111-1111','22021,서울시,강남구,선릉동',SYSDATE,'default.jpg');
INSERT INTO MEMBER_COMPANY(MEMBER_ID,COMPANY_TYPE,COMPANY_NAME,COMPANY_STAFF,COMPANY_CAPITAL,
COMPANY_CODE,COMPANY_TEL,COMPANY_FAX,COMPANY_WELFARE,COMPANY_DATE)
VALUES('comp11','T3','가나주식회사',250,150,'402-00-00001','02-0001-0001',
'02-0001-0002','4대보험,유류비 지원',TO_DATE('2000-02-01','RRRR-MM-DD'));
--SELECT * FROM POWERLINK;
UPDATE POWERLINK SET POWERLINK_CNT = POWERLINK_CNT + 1, POWERLINK_TIME = 120;

INSERT INTO SAL_AVG VALUES(1,2000,2200);
INSERT INTO SAL_AVG VALUES(3,2200,2400);
INSERT INTO SAL_AVG VALUES(5,2400,2600);
INSERT INTO SAL_AVG VALUES(7,2600,2800);
INSERT INTO SAL_AVG VALUES(9,2800,3000);

commit;

INSERT INTO WORK_BOARD VALUES('111','222','333',NULL,DEFAULT,NULL,NULL,NULL,DEFAULT,DEFAULT);
INSERT INTO WORK_BOARD VALUES('WO'||TO_CHAR(TO_DATE('1707141030','RRMMDDHH24MI'),'RRMMDDHH24MI')||LPAD(1,2,'0'),'급구합니다','랩 잘하는 친구 BRING IT!!','comp11',TO_DATE('1707141030','RRMMDDHH24MI'),'SW개발','JAVA ORACLE','없음','서울시 강남구',DEFAULT,DEFAULT);
DELETE WORK_BOARD WHERE WORK_NO='111';
SELECT * FROM WORK_BOARD;

 MEMBER_ID,  COMPANY_NAME , COMPANY_TYPE, COMPANY_STAFF, COMPANY_CAPITAL, COMPANY_CODE, COMPANY_TEL, COMPANY_FAX, COMPANY_WELFARE, COMPANY_DATE
SELECT * FROM MEMBER_COMPANY;

CREATE OR REPLACE VIEW VW_WORKHERE (WORK_NO,WORK_TITLE,WORK_CONTENT,WORK_WRITER,WORK_DATE,WORK_JOB,WORK_SKILL,WORK_CAREER,WORK_WORKPLACE,WORK_STARTDATE,WORK_ENDDATE,MEMBER_ID,  COMPANY_NAME , COMPANY_TYPE, COMPANY_STAFF, COMPANY_CAPITAL, COMPANY_CODE, COMPANY_TEL, COMPANY_FAX, COMPANY_WELFARE, COMPANY_DATE)
AS SELECT WORK_NO,WORK_TITLE,WORK_CONTENT,WORK_WRITER,WORK_DATE,WORK_JOB,WORK_SKILL,WORK_CAREER,WORK_WORKPLACE,WORK_STARTDATE,WORK_ENDDATE,MEMBER_ID,  COMPANY_NAME , COMPANY_TYPE, COMPANY_STAFF, COMPANY_CAPITAL, COMPANY_CODE, COMPANY_TEL, COMPANY_FAX, COMPANY_WELFARE, COMPANY_DATE FROM WORK_BOARD
JOIN MEMBER_COMPANY ON(MEMBER_COMPANY.MEMBER_ID = WORK_BOARD.WORK_WRITER);

SELECT * FROM VW_WORKHERE;

-----------------------------------------------