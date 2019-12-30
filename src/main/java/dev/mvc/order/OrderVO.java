package dev.mvc.order;

public class OrderVO {
/**
 * CREATE TABLE order_pay(
    order_payNo NUMBER(10) NOT NULL PRIMARY KEY,
    order_payMethod VARCHAR(100) NOT NULL,
    order_payDate DATE NOT NULL,
    order_payStatus VARCHAR(100) NOT NULL,
    cartno NUMBER(10) NOT NULL,
    FOREIGN KEY (cartno) REFERENCES cart (cartno)
);
 */
  /**주문 번호*/
  private int order_payNo;
  /**결제 방법*/
  private String order_payMethod;
  /**결제일*/
  private String order_payDate;
  /**결제 상태*/
  private String order_payStatus;
  /**장바구니 넘버*/
  private int cartno;
  
  public int getOrder_payNo() {
    return order_payNo;
  }
  public void setOrder_payNo(int order_payNo) {
    this.order_payNo = order_payNo;
  }
  public String getOrder_payMethod() {
    return order_payMethod;
  }
  public void setOrder_payMethod(String order_payMethod) {
    this.order_payMethod = order_payMethod;
  }
  public String getOrder_payDate() {
    return order_payDate;
  }
  public void setOrder_payDate(String order_payDate) {
    this.order_payDate = order_payDate;
  }
  public String getOrder_payStatus() {
    return order_payStatus;
  }
  public void setOrder_payStatus(String order_payStatus) {
    this.order_payStatus = order_payStatus;
  }
  public int getCartno() {
    return cartno;
  }
  public void setCartno(int cartno) {
    this.cartno = cartno;
  }
  
  
}
