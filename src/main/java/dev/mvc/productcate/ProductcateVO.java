package dev.mvc.productcate;

public class ProductcateVO {
  /**  ī�װ� ��ȣ */
  private int productcateno;
  /**  ī�װ� �̸� */
  private String name;
  /**  ��� ���� */
  private int seqno;
  /**  ��ϵ� �� �� */
  private int cnt;
  public int getProductcateno() {
    return productcateno;
  }
  public void setProductcateno(int productcateno) {
    this.productcateno = productcateno;
  }
  public String getName() {
    return name;
  }
  public void setName(String name) {
    System.out.println("--> ProductcateVO setName(\""+name+"\") ȣ���.");
    this.name = name;
  }
  public int getSeqno() {
    return seqno;
  }
  public void setSeqno(int seqno) {
    this.seqno = seqno;
  }
  public int getCnt() {
    return cnt;
  }
  public void setCnt(int cnt) {
    this.cnt = cnt;
  }
  
}
