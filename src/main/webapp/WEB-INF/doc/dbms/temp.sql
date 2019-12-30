DROP TABLE MKproduct;

CREATE TABLE MKproduct(
    productno INTEGER NOT NULL  PRIMARY KEY,
    productCategory VARCHAR(50) NOT NULL UNIQUE,
    name VARCHAR(50) NOT NULL,
    cnt INTEGER DEFAULT 0
);

 INSERT INTO MKproduct(productno, productCategory, name, cnt)
 VALUES((SELECT NVL(MAX(productno),0) + 1 as productno FROM MKproduct), 
                    '양식', '크림파스타', 10);     
INSERT INTO MKproduct(productno, productCategory, name, cnt)
 VALUES((SELECT NVL(MAX(productno),0) + 1 as productno FROM MKproduct), 
                    '중식', '짜장면', 10);     
INSERT INTO MKproduct(productno, productCategory, name, cnt)
 VALUES((SELECT NVL(MAX(productno),0) + 1 as productno FROM MKproduct), 
                    '한식', '잡채', 10);     



/**********************************/
/* Table Name: 주문 및 결제 */
/**********************************/
CREATE TABLE order(
    orderNo INTEGER NOT NULL,
    orderID VARCHAR(100) NOT NULL,
    paymenyNo INTEGER NOT NULL,
    registNo INTEGER NOT NULL,
    payment INTEGER DEFAULT 0 NOT NULL,
    paymentMethod VARCHAR(100) NOT NULL,
    paymentDate DATE NOT NULL,
    paymentStatus VARCHAR(10),
    productno INTEGER
);

/**********************************/
/* Table Name: 결제 */
/**********************************/
CREATE TABLE payment(
    paymenyNo INTEGER NOT NULL,
    registNo INTEGER NOT NULL,
    paymentDate DATE NOT NULL,
    paymentStatus VARCHAR(100) NOT NULL
);

/**********************************/
/* Table Name: 환불 */
/**********************************/
CREATE TABLE refund(
    paymentNo INTEGER NOT NULL,
    registNo INTEGER NOT NULL,
    payment INTEGER NOT NULL,
    paymentMethod VARCHAR(10100) NOT NULL,
    paymentDate DATE,
    refundReason VARCHAR(300),
    orderNo INTEGER,
    orderID VARCHAR(100),
    paymenyNo INTEGER
);

