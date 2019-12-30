
/**********************************/
/* Table Name: �������� �׷� */
/**********************************/
CREATE TABLE notice_cate(
  cateno NUMBER(10) NOT NULL, 
  title VARCHAR(50) NOT NULL,
  seqno NUMBER(10) DEFAULT 0 NOT NULL,
  visible CHAR(1) DEFAULT 'Y' NOT NULL,
  rdate DATE NOT NULL,
  cnt NUMBER(10) DEFAULT 0 NOT NULL,
  PRIMARY KEY(cateno)
);

COMMENT ON TABLE notice_cate is '�������� ī�װ� �׷�';
COMMENT ON COLUMN notice_cate.cateno is '�������� ��ȣ';
COMMENT ON COLUMN notice_cate.title is '�������� ����';
COMMENT ON COLUMN notice_cate.seqno is '��� ����';
COMMENT ON COLUMN notice_cate.visible is '��� ���';
COMMENT ON COLUMN notice_cate.rdate is '�����';
COMMENT ON COLUMN notice_cate.cnt is '�������� ��� ����';

/**********************************/
/* Table Name: ��� */
/**********************************/
DROP TABLE notice_contents;

DROP TABLE memcate;

CREATE TABLE memcate(
        memcateno           NUMBER(10)         NOT NULL         PRIMARY KEY,
        name                    VARCHAR2(50)     NOT NULL,
        seqno                   NUMBER(7)          DEFAULT 0        NOT NULL,
        visible                   CHAR(1)              DEFAULT 'Y'      NOT NULL,
        rdate                     DATE                  NOT NULL,
        cnt                        NUMBER(7)         NULL 
);

COMMENT ON TABLE memcate is '��� ī�װ� �׷�';
COMMENT ON COLUMN memcate.memcateno is '��� ī�װ� �׷� ��ȣ';
COMMENT ON COLUMN memcate.name is '��� ī�װ� �̸�';
COMMENT ON COLUMN memcate.seqno is '��� ����';
COMMENT ON COLUMN memcate.visible is '��� ���';
COMMENT ON COLUMN memcate.rdate is '�׷� ������';
COMMENT ON COLUMN memcate.cnt is '��ϵ� ȸ����';

CREATE TABLE mkmember(
  memberno       NUMBER(6) NOT NULL, -- ȸ�� ��ȣ, ���ڵ带 �����ϴ� �÷� 
  memcateno     NUMBER(10)     NOT NULL, -- ȸ�� ��� ī�װ� ��ȣ
  id           VARCHAR(20)   NOT NULL UNIQUE, -- ���̵�, �ߺ� �ȵ�, ���ڵ带 ���� 
  passwd    VARCHAR(60)   NOT NULL, -- �н�����, ������ ����
  mname    VARCHAR(20)   NOT NULL, -- ����, �ѱ� 10�� ���� ����
  tel          VARCHAR(14)   NOT NULL, -- ��ȭ��ȣ
  zipcode   VARCHAR(5)        NULL, -- �����ȣ, 12345
  address1  VARCHAR(80)       NULL, -- �ּ� 1
  address2  VARCHAR(50)       NULL, -- �ּ� 2
  mdate     DATE             NOT NULL, -- ������    
  PRIMARY KEY (memberno),                     -- �ѹ� ��ϵ� ���� �ߺ� �ȵ�
  FOREIGN KEY (memcateno) REFERENCES memcate (memcateno)
);

COMMENT ON TABLE MKMEMBER is 'ȸ��';
COMMENT ON COLUMN MKMEMBER.memberno is 'ȸ�� ��ȣ';
COMMENT ON COLUMN MKMEMBER.memcateno is '��� ī�װ� ��ȣ';
COMMENT ON COLUMN MKMEMBER.ID is '���̵�';
COMMENT ON COLUMN MKMEMBER.PASSWD is '�н�����';
COMMENT ON COLUMN MKMEMBER.MNAME is '����';
COMMENT ON COLUMN MKMEMBER.TEL is '��ȭ��ȣ';
COMMENT ON COLUMN MKMEMBER.ZIPCODE is '�����ȣ';
COMMENT ON COLUMN MKMEMBER.ADDRESS1 is '�ּ�1';
COMMENT ON COLUMN MKMEMBER.ADDRESS2 is '�ּ�2';
COMMENT ON COLUMN MKMEMBER.MDATE is '������';

INSERT INTO mkmember(memberno, memcateno, id, passwd, mname, tel, zipcode, address1, address2, mdate)
VALUES ((SELECT NVL(MAX(memberno), 0)+1 as memberno FROM mkmember), 1,
'user1', '1234', '�մ���', '000-0000-0000', '12345', '����� ���α�', '��ö��', sysdate);

INSERT INTO memcate(memcateno, name, seqno, visible, rdate, cnt)
VALUES((SELECT NVL(MAX(memcateno), 0) + 1 as memcateno FROM memcate), '��� ȸ��', 1, 'Y', sysdate, 0);

SELECT * FROM mkmember;

/**********************************/
/* Table Name: ������ */
/**********************************/

CREATE TABLE notice_contents(
		no_contentsno                 		NUMBER(10)		 NOT NULL  PRIMARY KEY,
		no_title                      		VARCHAR2(50)		 NOT NULL,
		no_contents                   		CLOB      		 NOT NULL,
		no_cnt                        		NUMBER(20)		 NOT NULL,
		no_rdate                     		DATE		 NOT NULL,
		no_word                       		VARCHAR2(50)		 NULL ,
		cateno                         		NUMBER(10)		 NOT NULL, 
		memberno                          NUMBER(10)     NOT NULL, 
		
		FOREIGN KEY (cateno) REFERENCES notice_cate (cateno),
		FOREIGN KEY (memberno) REFERENCES mkmember (memberno)
);

COMMENT ON TABLE notice_contents is '�������� ������';
COMMENT ON COLUMN notice_contents.no_contentsno is '����������������ȣ';
COMMENT ON COLUMN notice_contents.memberno is 'ȸ����ȣ';
COMMENT ON COLUMN notice_contents.no_title is '����';
COMMENT ON COLUMN notice_contents.no_contents is '����';
COMMENT ON COLUMN notice_contents.no_cnt is '��ȸ��';
COMMENT ON COLUMN notice_contents.no_rdate is '�����';
COMMENT ON COLUMN notice_contents.no_word is '�˻���';
COMMENT ON COLUMN notice_contents.cateno is '�������� ī�װ� ��ȣ';

1) ���
-- PK ����
SELECT NVL(MAX(no_contentsno), 0) + 1 as no_contentsno FROM notice_contents;                                
 
NO_CONTENTSNO
 -------------
             1

-- categrp ���̺� ��� Ȯ��                                
SELECT * 
FROM notice_cate 
ORDER BY seqno ASC;

CATENO TITLE       SEQNO VISIBLE RDATE                 CNT
 ------ ----------- ----- ------- --------------------- ---
      1 ��������ó����ħ �ȳ�     1 Y       2019-12-04 16:20:11.0   0
      2 ȸ����� ���� �ȳ�      2 Y       2019-12-04 16:20:12.0   0
      3 ������ ���� �ȳ�      3 Y       2019-12-04 16:20:13.0   0

-- 1) contents ���(member: 1, categrpno: 1),
--     varchar�� '' ��ϵǸ� null�� insert ��
INSERT INTO notice_contents(no_contentsno, 
                                memberno, cateno, no_title, no_contents, 
                                no_cnt,no_rdate, no_word)
VALUES((SELECT NVL(MAX(no_contentsno), 0) + 1 as no_contentsno FROM notice_contents),
             1, 1, '����1', '����1',
             0, sysdate, '');
             
-- 2) ��� 
SELECT no_contentsno,memberno, cateno, no_title, no_contents, no_cnt,no_rdate, no_word
FROM notice_contents
ORDER BY no_contentsno ASC;

 NO_CONTENTSNO MEMBERNO CATENO NO_TITLE NO_CONTENTS NO_CNT NO_RDATE  NO_WORD
 ------------- -------- ------ -------- ----------- ------ --------------------- -------
             1        1      1 ����1      ����1              0 2019-12-11 17:16:07.0 NULL


-- 4) ��ü ���ڵ� ��
SELECT COUNT(*) as count
FROM notice_contents;
             
-- 5) ��ȸ
SELECT no_contentsno,memberno, cateno, no_title, 
          no_contents, no_cnt,no_rdate, no_word
FROM notice_contents
WHERE no_contentsno=1;

-- 6) ����
UPDATE notice_contents
SET no_title='���� ����', no_contents='���� ����', no_word='�˻���'
WHERE no_contentsno = 1;

-- 7) ����
DELETE FROM notice_contents
WHERE no_contentsno=2;

--------------------------------------------------------------------------------------
-- 8) FK �θ� ���̺� ���ڵ� ���� ����
SELECT no_contentsno, memberno, cateno
FROM notice_contents
WHERE no_contentsno=1;

 CONTENTSNO MEMBERNO CATEGRPNO TITLE
 ---------- -------- --------- -----------------------
          3          1                6                  12�� ���� ����ȳ�
          5          1                6                  �̹��� ������ �ɾ� �����մϴ�.
          7          1                6                  ��Ű�� �Ա� ������ ��ӵ��ο��� �������ּ���~

SELECT COUNT(*) as cnt
FROM notice_contents
WHERE no_contentsno=1;

 CNT
 ---
   3             
             
-- 9) FK �θ� ���̺� ���ڵ� ����
DELETE FROM contents
WHERE categrpno=6;
