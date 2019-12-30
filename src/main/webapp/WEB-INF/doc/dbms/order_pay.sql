DROP TABLE order_pay;

/**********************************/
/* Table Name: 주문 및 결제 */
/**********************************/
CREATE TABLE order_pay(
    order_payNo NUMBER(10) NOT NULL PRIMARY KEY,
    order_payMethod VARCHAR(100) NOT NULL,
    order_payDate DATE NOT NULL,
    order_payStatus VARCHAR(100) NOT NULL,
    cartno NUMBER(10) NOT NULL,
    FOREIGN KEY (cartno) REFERENCES cart (cartno)
);

COMMENT ON TABLE order_pay is '주문 및 결제';
COMMENT ON COLUMN order_pay.order_payNo is '주문 번호';
COMMENT ON COLUMN order_pay.order_payMethod is '결제 방법';
COMMENT ON COLUMN order_pay.order_payDate is '결제일';
COMMENT ON COLUMN order_pay.order_payStatus is '결제 상태';
COMMENT ON COLUMN order_pay.cartno is '장바구니 번호';


SELECT NVL(MAX(orderNo),0) + 1 as orderNo FROM order_pay;

-- 등록
 INSERT INTO order_pay(order_payNo, order_payMethod, order_payDate, order_payStatus, cartno)
 VALUES((SELECT NVL(MAX(order_payNo),0) + 1 as order_payNo FROM order_pay), '신용카드', sysdate, '결제 완료', 1); 
 INSERT INTO order_pay(order_payNo, order_payMethod, order_payDate, order_payStatus, cartno)
 VALUES((SELECT NVL(MAX(order_payNo),0) + 1 as order_payNo FROM order_pay), '무통장', sysdate, '결제 완료', 1); 
 INSERT INTO order_pay(order_payNo, order_payMethod, order_payDate, order_payStatus, cartno)
 VALUES((SELECT NVL(MAX(order_payNo),0) + 1 as order_payNo FROM order_pay), '실시간 계좌이체', sysdate, '결제 완료', 1); 
 
 -- 목록
 SELECT order_payNo, order_payMethod, order_payDate, order_payStatus, cartno
 FROM order_pay;

 -- 수정 // 결제 상태 변경 -> 결제완료, 결제 취소, 환불 완료, 재결제
UPDATE order_pay
SET order_payStatus='결제 취소'
WHERE order_payNo=1;

-- cartno로 장바구니 정보 가져오기 //cart : cartno, cartgrpno, productno, orderID, productCount, rdate
 SELECT c.cartno, c.cartgrpno, c.productno, c.orderID, c.productCount, c.rdate
 FROM cart c INNER JOIN order_pay o
 ON c.cartno = o.cartno 
 WHERE o.cartno = 1;