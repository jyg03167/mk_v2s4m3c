CREATE TABLE memcate(
        memcateno           NUMBER(10)         NOT NULL         PRIMARY KEY,
        name                    VARCHAR2(50)     NOT NULL,
        seqno                   NUMBER(7)          DEFAULT 0        NOT NULL,
        visible                   CHAR(1)              DEFAULT 'Y'      NOT NULL,
        rdate                     DATE                  NOT NULL,
        cnt                        NUMBER(7)         NULL 
);

COMMENT ON TABLE memcate is '멤버 카테고리 그룹';
COMMENT ON COLUMN memcate.memcateno is '멤버 카테고리 그룹 번호';
COMMENT ON COLUMN memcate.name is '멤버 카테고리 이름';
COMMENT ON COLUMN memcate.seqno is '출력 순서';
COMMENT ON COLUMN memcate.visible is '출력 모드';
COMMENT ON COLUMN memcate.rdate is '그룹 생성일';
COMMENT ON COLUMN memcate.cnt is '등록된 회원수';

INSERT INTO memcate(memcateno, name, seqno, visible, rdate, cnt)
VALUES((SELECT NVL(MAX(memcateno), 0) + 1 as memcateno FROM memcate), '우수 회원', 1, 'Y', sysdate, 0);

CREATE TABLE mkmember(
  memberno       NUMBER(6) NOT NULL, -- 회원 번호, 레코드를 구분하는 컬럼 
  memcateno     NUMBER(10)     NOT NULL, -- 회원 등급 카테고리 번호
  id           VARCHAR(20)   NOT NULL UNIQUE, -- 아이디, 중복 안됨, 레코드를 구분 
  passwd    VARCHAR(60)   NOT NULL, -- 패스워드, 영숫자 조합
  mname    VARCHAR(20)   NOT NULL, -- 성명, 한글 10자 저장 가능
  tel          VARCHAR(14)   NOT NULL, -- 전화번호
  zipcode   VARCHAR(5)        NULL, -- 우편번호, 12345
  address1  VARCHAR(80)       NULL, -- 주소 1
  address2  VARCHAR(50)       NULL, -- 주소 2
  mdate     DATE             NOT NULL, -- 가입일    
  PRIMARY KEY (memberno),                     -- 한번 등록된 값은 중복 안됨
  FOREIGN KEY (memcateno) REFERENCES memcate (memcateno)
);

COMMENT ON TABLE MKMEMBER is '회원';
COMMENT ON COLUMN MKMEMBER.memberno is '회원 번호';
COMMENT ON COLUMN MKMEMBER.memcateno is '등급 카테고리 번호';
COMMENT ON COLUMN MKMEMBER.ID is '아이디';
COMMENT ON COLUMN MKMEMBER.PASSWD is '패스워드';
COMMENT ON COLUMN MKMEMBER.MNAME is '성명';
COMMENT ON COLUMN MKMEMBER.TEL is '전화번호';
COMMENT ON COLUMN MKMEMBER.ZIPCODE is '우편번호';
COMMENT ON COLUMN MKMEMBER.ADDRESS1 is '주소1';
COMMENT ON COLUMN MKMEMBER.ADDRESS2 is '주소2';
COMMENT ON COLUMN MKMEMBER.MDATE is '가입일';

INSERT INTO mkmember(memberno, memcateno, id, passwd, mname, tel, zipcode, address1, address2, mdate)
VALUES ((SELECT NVL(MAX(memberno), 0)+1 as memberno FROM mkmember), 1,
'user1', '1234', '왕눈이', '000-0000-0000', '12345', '서울시 종로구', '관철동', sysdate);