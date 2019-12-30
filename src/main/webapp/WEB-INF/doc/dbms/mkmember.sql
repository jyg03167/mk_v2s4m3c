-----------------------------------------------------------------------------------------
2. ȸ�� ī�װ�: mkmember
-----------------------------------------------------------------------------------------
DROP TABLE memcate;
DROP TABLE mkmember;

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

1. ���
 
1) id �ߺ� Ȯ��
SELECT COUNT(id) as cnt
FROM mkmember
WHERE id='user1';
   
2) ���
- �Ϸù�ȣ ���� ��������
- MAX(memberno): memberno �÷��� ���߿� ���� ū ���� ����
- ���ڵ尡 ������ MAX �Լ��� ����� NULL�̵˴ϴ�.
SELECT MAX(memberno) as memberno FROM mkmember;
 
 - NULL ���� ��Ģ������ ����� NULL�̵˴ϴ�. �ǹ� ����.
SELECT MAX(memberno)+1 as memberno FROM mkmember;
 
 - NVL(��, ��ȯ�� ��): ���� NULL�̸� ��ȯ�� ������ ����, 
   NULL�� 0���� ����
SELECT NVL(MAX(memberno), 0) as memberno FROM mkmember;
   
- NULL�� ó���ϸ鼭 ���ο� �ִ밪 ���� SQL
SELECT NVL(MAX(memberno), 0)+1 as memberno FROM mkmember;
 
-- ������ ȸ�� ����
INSERT INTO mkmember(memberno, memcateno, id, passwd, mname, tel, zipcode, address1, address2, mdate)
VALUES ((SELECT NVL(MAX(memberno), 0)+1 as memberno FROM mkmember), 1,
'qnaadmin', '1234', 'QNA������', '000-0000-0000', '12345', '����� ���α�', '��ö��', sysdate);
 
INSERT INTO mkmember(memberno, memcateno, id, passwd, mname, tel, zipcode, address1, address2, mdate)
VALUES ((SELECT NVL(MAX(memberno), 0)+1 as memberno FROM mkmember),1,
'crm', '1234', '��������', '000-0000-0000', '12345', '����� ���α�', '��ö��', sysdate);
 
-- ���� ȸ�� ����
INSERT INTO mkmember(memberno, memcateno, id, passwd, mname, tel, zipcode, address1, address2, mdate)
VALUES ((SELECT NVL(MAX(memberno), 0)+1 as memberno FROM mkmember), 1,
'user1', '1234', '�մ���', '000-0000-0000', '12345', '����� ���α�', '��ö��', sysdate);
 
INSERT INTO mkmember(memberno, memcateno, id, passwd, mname, tel, zipcode, address1, address2, mdate)
VALUES ((SELECT NVL(MAX(memberno), 0)+1 as memberno FROM mkmember), 1,
'user2', '1234', '�մ���', '000-0000-0000', '12345', '����� ���α�', '��ö��', sysdate);
 
INSERT INTO mkmember(memberno, memcateno, id, passwd, mname, tel, zipcode, address1, address2, mdate)
VALUES ((SELECT NVL(MAX(memberno), 0)+1 as memberno FROM mkmember), 1,
'user3', '1234', '�մ���', '000-0000-0000', '12345', '����� ���α�', '��ö��', sysdate);
 
-- �׷캰 ����ȸ�� ����
INSERT INTO mkmember(memberno, memcateno, id, passwd, mname, tel, zipcode, address1, address2, mdate)
VALUES ((SELECT NVL(MAX(memberno), 0)+1 as memberno FROM mkmember), 1,
'team1', '1234', '������', '000-0000-0000', '12345', '����� ���α�', '��ö��', sysdate);
 
INSERT INTO mkmember(memberno, memcateno, id, passwd, mname, tel, zipcode, address1, address2, mdate)
VALUES ((SELECT NVL(MAX(memberno), 0)+1 as memberno FROM mkmember),1,
'team2', '1234', '���ۺ�����', '000-0000-0000', '12345', '����� ���α�', '��ö��', sysdate);
 
INSERT INTO mkmember(memberno, memcateno, id, passwd, mname, tel, zipcode, address1, address2, mdate)
VALUES ((SELECT NVL(MAX(memberno), 0)+1 as memberno FROM member),1,
'team3', '1234', '��������', '000-0000-0000', '12345', '����� ���α�', '��ö��', sysdate);
 
 
2. ���
-- �˻��� ���� �ʴ� ���, ��ü ��� ���
 
SELECT memberno, memcateno, id, passwd, mname, tel, zipcode, address1, address2, mdate
FROM mkmember
ORDER BY memberno ASC; 

-- ȸ�� ��޺� ���
SELECT memberno, memcateno, id, passwd, mname, tel, zipcode, address1, address2, mdate
FROM mkmember
WHERE memcateno=1
ORDER BY memberno ASC;
   
3. ��ȸ
 
1) user1 ��� ���� ����
SELECT memberno, memcateno, id, passwd, mname, tel, zipcode, address1, address2, mdate
FROM mkmember
WHERE memberno = 1;
 
SELECT memberno, memcateno, id, passwd, mname, tel, zipcode, address1, address2, mdate
FROM mkmember
WHERE id = 'user1';
   
4. ����
UPDATE mkmember 
SET mname='�Ʒι�', tel='111-1111-1111', zipcode='00000',
      address1='��⵵', address2='���ֽ�'
WHERE memberno=1;
 
5. �н����� ����

1) �н����� �˻�
SELECT COUNT(memberno) as cnt
FROM mkmember
WHERE memberno=1 AND passwd='1234';
 
2) �н����� ����
UPDATE mkmember
SET passwd='0000'
WHERE memberno=1 AND passwd='1111';
 
6. ����

1) ��� ���� -- �Ǽ��ϸ� �ȵǴϱ� �������� �� ��!
DELETE FROM mkmember; 
 
2) Ư�� ȸ�� ����
DELETE FROM mkmember
WHERE memberno=4;
 
7. �α���
SELECT COUNT(memberno) as cnt
FROM mkmember
WHERE id='user1' AND passwd='1234';

8. ��޺� ȸ����
SELECT count(*) AS cnt
FROM mkmember
WHERE memcateno=2;

9. ��޺� ȸ�� ����
DELETE FROM mkmember
WHERE memcateno=2;

10. ȸ�� ��� ����
UPDATE mkmember 
SET memcateno=1
WHERE memberno=1;