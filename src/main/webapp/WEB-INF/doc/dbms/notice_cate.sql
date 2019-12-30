/**********************************/
/* Table Name: �������� �з� ī�װ�*/
/**********************************/
-- 1)����
DROP TABLE notice_cate;

-- 2)����
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

-- 3)���
INSERT INTO notice_cate(cateno, title, seqno, visible, rdate, cnt)
VALUES((SELECT NVL(MAX(cateno), 0) + 1 as cateno FROM notice_cate),
                '��������ó����ħ �ȳ�', 1, 'Y', sysdate, 0);
INSERT INTO notice_cate(cateno, title, seqno, visible, rdate, cnt)
VALUES((SELECT NVL(MAX(cateno), 0) + 1 as cateno FROM notice_cate),
                'ȸ����� ���� �ȳ�', 2, 'Y', sysdate, 0);
INSERT INTO notice_cate(cateno, title, seqno, visible, rdate, cnt)
VALUES((SELECT NVL(MAX(cateno), 0) + 1 as cateno FROM notice_cate),
                '������ ���� �ȳ�', 3, 'Y', sysdate, 0);
            
-- 4)���            
SELECT * FROM notice_cate ORDER BY seqno ASC;

DELETE FROM notice_cate;

-- 5)��ȸ
SELECT cateno, title, seqno, visible, rdate, cnt
FROM notice_cate
WHERE cateno=1;

-- 6)����
UPDATE notice_cate
SET title='��Ÿ����', seqno=5, visible='Y'
WHERE cateno=4;

-- 7)����
DELETE FROM notice_cate
WHERE cateno=4;
