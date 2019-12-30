-----------------------------------------------------------------------------------------
1. ȸ�� ī�װ�: memcate
-----------------------------------------------------------------------------------------

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

-- ���
INSERT INTO memcate(memcateno, name, seqno, visible, rdate, cnt)
VALUES((SELECT NVL(MAX(memcateno), 0) + 1 as memcateno FROM memcate), '��� ȸ��', 1, 'Y', sysdate, 0);

INSERT INTO memcate(memcateno, name, seqno, visible, rdate, cnt)
VALUES((SELECT NVL(MAX(memcateno), 0) + 1 as memcateno FROM memcate), '�Ϲ� ȸ��', 1, 'Y', sysdate, 0);

INSERT INTO memcate(memcateno, name, seqno, visible, rdate, cnt)
VALUES((SELECT NVL(MAX(memcateno), 0) + 1 as memcateno FROM memcate), '���� ȸ��', 1, 'Y', sysdate, 0);

-- ���
SELECT memcateno, name, seqno, visible, rdate, cnt
FROM memcate
ORDER BY seqno ASC;

-- ����
UPDATE memcate
SET name='�Ϲ� ȸ��', seqno = 1, visible='Y'
WHERE memcateno = 3;

-- ����
DELETE FROM memcate
COMMIT;
 
DELETE FROM memcate
WHERE memcateno = 2;

-- ī�װ��� ȸ�� �� ���� / ����
UPDATE memcate 
SET cnt = cnt + 1 
WHERE memcateno=1;

UPDATE memcate 
SET cnt = cnt - 1 
WHERE memcateno=1;

-- ���� ���� ���� / ����
UPDATE memcate
SET seqno = seqno - 1
WHERE memcateno = 1;

UPDATE memcate
SET seqno = seqno + 1
WHERE memcateno = 1;

-- ȸ���� �ʱ�ȭ(0��)
UPDATE memcate 
SET cnt = 0 
WHERE memcateno = 2;