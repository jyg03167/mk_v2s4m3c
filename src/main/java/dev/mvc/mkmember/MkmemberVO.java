package dev.mvc.mkmember;

public class MkmemberVO {
/*
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
 */
  
  /** ȸ�� ��ȣ */
  private int memberno;
  /** ȸ�� ��� ��ȣ */
  private int memcateno;
  /** ���̵� */
  private String id = "";
  /** �н����� */
  private String passwd = "";
  /** ȸ�� ���� */
  private String mname = "";
  /** ��ȭ ��ȣ */
  private String tel = "";
  /** ���� ��ȣ */
  private String zipcode = "";
  /** �ּ� 1 */
  private String address1 = "";
  /** �ּ� 2 */
  private String address2 = "";
  /** ������ */
  private String mdate = "";
  
  /** ��ϵ� �н����� */
  private String old_passwd = "";
  /** id ���� ���� */
  private String id_save = "";
  /** passwd ���� ���� */
  private String passwd_save = "";
  /** �̵��� �ּ� ���� */
  private String url_address = "";
  
  public int getMemberno() {
    return memberno;
  }
  public void setMemberno(int memberno) {
    this.memberno = memberno;
  }
  public int getMemcateno() {
    return memcateno;
  }
  public void setMemcateno(int memcateno) {
    this.memcateno = memcateno;
  }
  public String getId() {
    return id;
  }
  public void setId(String id) {
    this.id = id;
  }
  public String getPasswd() {
    return passwd;
  }
  public void setPasswd(String passwd) {
    this.passwd = passwd;
  }
  public String getMname() {
    return mname;
  }
  public void setMname(String mname) {
    this.mname = mname;
  }
  public String getTel() {
    return tel;
  }
  public void setTel(String tel) {
    this.tel = tel;
  }
  public String getZipcode() {
    return zipcode;
  }
  public void setZipcode(String zipcode) {
    this.zipcode = zipcode;
  }
  public String getAddress1() {
    return address1;
  }
  public void setAddress1(String address1) {
    this.address1 = address1;
  }
  public String getAddress2() {
    return address2;
  }
  public void setAddress2(String address2) {
    this.address2 = address2;
  }
  public String getMdate() {
    return mdate;
  }
  public void setMdate(String mdate) {
    this.mdate = mdate;
  }
  public String getOld_passwd() {
    return old_passwd;
  }
  public void setOld_passwd(String old_passwd) {
    this.old_passwd = old_passwd;
  }
  public String getId_save() {
    return id_save;
  }
  public void setId_save(String id_save) {
    this.id_save = id_save;
  }
  public String getPasswd_save() {
    return passwd_save;
  }
  public void setPasswd_save(String passwd_save) {
    this.passwd_save = passwd_save;
  }
  public String getUrl_address() {
    return url_address;
  }
  public void setUrl_address(String url_address) {
    this.url_address = url_address;
  }
  
}
