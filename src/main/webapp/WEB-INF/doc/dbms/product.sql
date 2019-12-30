1) DDL
/**********************************/
/* Table Name: 상품 카테고리 */
/**********************************/
DROP TABLE productcate;
  
CREATE TABLE productcate(
    productcateno                NUMBER(10)     NOT NULL    PRIMARY KEY,
    name                            VARCHAR2(50)     NOT NULL,
    seqno                           NUMBER(7)    DEFAULT 0     NOT NULL,
    cnt                               NUMBER(7)    DEFAULT 0     NOT NULL            
);

COMMENT ON TABLE productcate is '상품 카테고리';
COMMENT ON COLUMN productcate.productcateno is '상품 카테고리 번호';
COMMENT ON COLUMN productcate.name is '상품 분류명';
COMMENT ON COLUMN productcate.seqno is '출력 순서';
COMMENT ON COLUMN productcate.cnt is '등록된 음식 수';

-- 등록
INSERT INTO productcate(productcateno, name, seqno, cnt)
VALUES((SELECT NVL(MAX(productcateno), 0) + 1 as productcateno FROM productcate),
            '한식', 1,0);
            
INSERT INTO productcate(productcateno, name, seqno, cnt)
VALUES((SELECT NVL(MAX(productcateno), 0) + 1 as productcateno FROM productcate),
            '중식', 2, 0);

INSERT INTO productcate(productcateno, name, seqno, cnt)
VALUES((SELECT NVL(MAX(productcateno), 0) + 1 as productcateno FROM productcate),
            '일식', 3, 0);

            
SELECT *
FROM productcate
ORDER BY seqno ASC;

 PRODUCTCATENO NAME SEQNO CNT
 ------------- ---- ----- ---
             1 한식       1   0
             2 중식       2   0
             3 일식       3   0

2) pdcontents
/**********************************/
/* Table Name: 상품내용 테이블 */
/**********************************/

CREATE TABLE pdcontents(
pdcontentsno                  NUMBER(10)  NOT NULL  PRIMARY KEY,
productcateno                 NUMBER(10)  NOT NULL,
title                              VARCHAR2(300)  NOT NULL,
price                             NUMBER(10)    NOT NULL,
content                        CLOB  NOT NULL,
recom                          NUMBER(7)  DEFAULT 0  NOT NULL,
cnt                            NUMBER(7)  DEFAULT 0  NOT NULL,
replycnt                       NUMBER(10)  DEFAULT 0  NOT NULL,
rdate                          DATE  NOT NULL,
word                           VARCHAR2(100)  NULL ,
fname                            VARCHAR2(100)         NOT NULL,
                fupname                        VARCHAR2(100)         NOT NULL,
                thumb                           VARCHAR2(100)         NULL ,
                fsize                              NUMBER(10)         DEFAULT 0         NOT NULL,
FOREIGN KEY (productcateno) REFERENCES productcate (productcateno)
);

COMMENT ON TABLE pdcontents is '상품컨텐츠';
COMMENT ON COLUMN pdcontents.productcateno is '상품 카테고리 번호';
COMMENT ON COLUMN pdcontents.title is '상품명';
COMMENT ON COLUMN pdcontents.price is '가격';
COMMENT ON COLUMN pdcontents.content is '내용';
COMMENT ON COLUMN pdcontents.recom is '추천수';
COMMENT ON COLUMN pdcontents.cnt is '조회수';
COMMENT ON COLUMN pdcontents.replycnt is '댓글수';
COMMENT ON COLUMN pdcontents.rdate is '등록일';
COMMENT ON COLUMN pdcontents.word is '검색어';
COMMENT ON COLUMN pdcontents.fname is '원본 파일명';
COMMENT ON COLUMN pdcontents.fupname is '업로드 파일명';
COMMENT ON COLUMN pdcontents.thumb is 'Thumb 파일';
COMMENT ON COLUMN pdcontents.fsize is '파일 사이즈';
                     
 -- PK 생성
 SELECT NVL(MAX(pdcontentsno),0) + 1 as pdcontentsno FROM pdcontents;

 PDCONTENTSNO
 ------------
            1

 -- productcate 테이블 목록 확인 
SELECT productcateno, name, seqno, cnt
FROM productcate
ORDER BY seqno ASC; 

-- 1) contents 등록 (member:1, categrpno: 1),
--     varchar에 ''등록되면 null이 insert 됨. 
INSERT INTO pdcontents(pdcontentsno, 
                              productcateno, title, price, content,
                              recom,cnt,replycnt,rdate,word, fname, fupname, thumb, fsize )
 VALUES((SELECT NVL(MAX(pdcontentsno),0)+1 as pdcontentsno FROM pdcontents),
              1, '비빔밥',6500, '내용1',
             0, 0, 0, sysdate, '', 'bibmbap.jpg', 'bibmbap_1.jpg', 'bibmbap_t.jpg', 1000);
             
INSERT INTO pdcontents(pdcontentsno, 
                              productcateno, title, price, content,
                              recom,cnt,replycnt,rdate,word, fname, fupname, thumb, fsize )
 VALUES((SELECT NVL(MAX(pdcontentsno),0)+1 as pdcontentsno FROM pdcontents),
              2, '짜장면',5000, '내용1',
             0, 0, 0, sysdate, '', 'bibmbap.jpg', 'bibmbap_1.jpg', 'bibmbap_t.jpg', 1000);
             
INSERT INTO pdcontents(pdcontentsno, 
                              productcateno, title, price, content,
                              recom,cnt,replycnt,rdate,word, fname, fupname, thumb, fsize )
 VALUES((SELECT NVL(MAX(pdcontentsno),0)+1 as pdcontentsno FROM pdcontents),
              3, '연어 덮밥',7500, '내용1',
             0, 0, 0, sysdate, '', 'bibmbap.jpg', 'bibmbap_1.jpg', 'bibmbap_t.jpg', 1000);
                        
-- 2) 목록
SELECT pdcontentsno, productcateno, title, price, content,
                              recom,cnt,replycnt,rdate,word, fname, fupname, thumb, fsize 
FROM pdcontents
ORDER BY pdcontentsno DESC;

PDCONTENTSNO PRODUCTCATENO TITLE CONTENT RECOM CNT REPLYCNT RDATE                 WORD FNAME       FUPNAME       THUMB         FSIZE
 ------------ ------------- ----- ------- ----- --- -------- --------------------- ---- ----------- ------------- ------------- -----
            1             1 비빔밥   내용1         0   0        0 2019-12-11 17:47:23.0 NULL bibmbap.jpg bibmbap_1.jpg bibmbap_t.jpg  1000
            
-- 3) productcate별 전체 목록
SELECT pdcontentsno, productcateno, title, price, content,
                              recom,cnt,replycnt,rdate,word, fname, fupname, thumb, fsize 
FROM pdcontents
WHERE productcateno=1 --1: 한식, --2: 중식 
ORDER BY pdcontentsno DESC;

 PDCONTENTSNO PDTHUMBNO PRODUCTCATENO TITLE CONTENT RECOM CNT REPLYCNT RDATE                 WORD
 ------------ --------- ------------- ----- ------- ----- --- -------- --------------------- ----
            1         1             1 비빔밥   내용1         0   0        0 2019-12-11 16:55:02.0 NULL
         
-- 4) 전체 레코드 수 
SELECT COUNT(*) as count
FROM pdcontents;

 COUNT
 -----
     1
     
-- 5) 조회
SELECT pdcontentsno, productcateno, title, price, content,
                              recom,cnt,replycnt,rdate,word, fname, fupname, thumb, fsize 
FROM pdcontents
WHERE pdcontentsno=1;
     
-- 6) 수정
UPDATE pdcontents
SET title='김치볶음밥', content='내용 수정', word='검색어'
WHERE pdcontentsno = 1;

-- 7) 삭제
DELETE FROM pdcontents
WHERE pdcontentsno = 2;