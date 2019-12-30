/**********************************/
/* Table Name: ��ٱ��� */
/**********************************/
DROP TABLE cart;

CREATE TABLE cart(
    cartno NUMBER(10) NOT NULL  PRIMARY KEY,
		cartgrpno NUMBER(10) NOT NULL,
		productno NUMBER(10) NOT NULL,
		orderID VARCHAR(100) NOT NULL,
		productCount NUMBER(10) DEFAULT 0 NOT NULL,
		rdate DATE NOT NULL,
		FOREIGN KEY (cartgrpno) REFERENCES cartgrp (cartgrpno),
		FOREIGN KEY (productno) REFERENCES pdcontents (pdcontentsno),
		FOREIGN KEY (orderID) REFERENCES mkmember (id)
);

COMMENT ON TABLE cart is '��ٱ���';
COMMENT ON COLUMN cart.cartno is '��ٱ��� ��ȣ';
COMMENT ON COLUMN cart.cartgrpno is '��ٱ��� �׷� ��ȣ';
COMMENT ON COLUMN cart.productno is '��ǰ ��ȣ';
COMMENT ON COLUMN cart.orderID is '�ֹ��� id';
COMMENT ON COLUMN cart.productCount is '��ǰ ����';
COMMENT ON COLUMN cart.rdate is '��ٱ��� �߰���';

SELECT * FROM cart
ORDER BY cartno ASC;
SELECT * FROM cartgrp;

 SELECT NVL(MAX(cartno),0) + 1 as cartno FROM cart;

 -- ���
 INSERT INTO cart(cartno, cartgrpno, productno, orderID,
                              productCount, rdate)
 VALUES((SELECT NVL(MAX(cartno),0) + 1 as cartno FROM cart),
             1, 1, 'user1', 1, sysdate);      
 INSERT INTO cart(cartno, cartgrpno, productno, orderID,
                              productCount, rdate)
 VALUES((SELECT NVL(MAX(cartno),0) + 1 as cartno FROM cart),
             1, 2, 'user1', 1, sysdate); 
 INSERT INTO cart(cartno, cartgrpno, productno, orderID,
                              productCount, rdate)
 VALUES((SELECT NVL(MAX(cartno),0) + 1 as cartno FROM cart),
             1, 3, 'user1', 1, sysdate); 
             
 CARTNO CARTGRPNO PRODUCTNO ORDERID PRODUCTCOUNT RDATE
 ------ --------- --------- ------- ------------ ---------------------
      1         1         1 user1              1 2019-12-13 18:13:40.0
      2         1         2 user1              1 2019-12-13 18:13:41.0
      3         1         3 user1              1 2019-12-13 18:13:42.0

 -- ��ȸ
 SELECT cartno, cartgrpno, productno, orderID, productCount, rdate
 FROM cart
 WHERE cartno=1;

 CARTNO CARTGRPNO PRODUCTNO ORDERID PRODUCTCOUNT RDATE
 ------ --------- --------- ------- ------------ ---------------------
      1         1         1 user1              1 2019-12-13 18:13:40.0

      
 -- ����
UPDATE cart
SET productno=1, productCount=10
WHERE cartno=1;


 -- ����
 DELETE FROM cart 
 WHERE cartgrpno=1 and cartno=2;

 -- ��ü ���ڵ� ��
 SELECT COUNT(*) as cnt
 FROM cart;
 
  CNT
 ---
   5
 
 -- cartgrpno�� ���ڵ� ��
 SELECT COUNT(*) as cnt
 FROM cart
 WHERE cartgrpno=2;

  CNT
 ---
   2

   
 -- ��ǰ + īƮ ���
 SELECT c.cartno, c.cartgrpno, c.productno, c.orderID, c.productCount, c.rdate, p.pdcontentsno, p.title, p.thumb, p.price
 FROM cart c INNER JOIN pdcontents p
 ON c.productno = p.pdcontentsno 
 WHERE cartgrpno = 1
 ORDER BY cartno ASC;
 
 CARTNO CARTGRPNO PRODUCTNO ORDERID PRODUCTCOUNT PDCONTENTSNO TITLE THUMB         RDATE                 PRICE
 ------ --------- --------- ------- ------------ ------------ ----- ------------- --------------------- -----
      1         1         1 user1              1            1 �����   bibmbap_t.jpg 2019-12-20 17:06:04.0  6500
      
 SELECT c.cartno, c.cartgrpno, c.productno, c.orderID, c.productCount, c.rdate, p.pdcontentsno, p.title, p.thumb, p.price
 FROM cart c INNER JOIN pdcontents p
 ON c.productno = p.pdcontentsno 
 WHERE cartno = 5;

 SELECT c.cartno, c.cartgrpno, c.productno, c.orderID, c.productCount, c.rdate, p.pdcontentsno, p.title, p.thumb, p.price
 FROM cart c INNER JOIN pdcontents p
 ON c.productno = p.pdcontentsno 
 ORDER BY cartno ASC;