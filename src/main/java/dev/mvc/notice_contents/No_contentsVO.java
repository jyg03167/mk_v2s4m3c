package dev.mvc.notice_contents;

public class No_contentsVO {
/*
 * 		no_contentsno                 		NUMBER(10)		 NOT NULL  PRIMARY KEY,
		cateno                         		NUMBER(10)		 NOT NULL, 
		memberno                          NUMBER(10)     NOT NULL, 
		no_title                      		VARCHAR2(50)		 NOT NULL,
		no_contents                   		CLOB      		 NOT NULL,
		no_cnt                        		NUMBER(20)		 NOT NULL,
		no_rdate                     		DATE		 NOT NULL,
		no_word                       		VARCHAR2(50)		 NULL ,
		
 * */
	
	/**�������� ������ ��ȣ*/
	private int no_contentsno;
	
	/**�������� ī�װ� ��ȣ*/
	private int cateno;
	
	/**ȸ�� ��ȣ*/
	private int memberno;
	
	/** ����*/
	private String no_title;
	
	/**����*/
	private String no_contents;
	
	/**��ȸ��*/
	private int no_cnt;
	
	/** ����� */
	private String no_rdate;

	/** �˻��� */
	private String no_word;
	
	public int getNo_contentsno() {
		return no_contentsno;
	}

	public void setNo_contentsno(int no_contentsno) {
		this.no_contentsno = no_contentsno;
	}

	public int getCateno() {
		return cateno;
	}

	public void setCateno(int cateno) {
		this.cateno = cateno;
	}

	public int getMemberno() {
		return memberno;
	}

	public void setMemberno(int memberno) {
		this.memberno = memberno;
	}

	public String getNo_title() {
		return no_title;
	}

	public void setNo_title(String no_title) {
		this.no_title = no_title;
	}

	public String getNo_contents() {
		return no_contents;
	}

	public void setNo_contents(String no_contents) {
		this.no_contents = no_contents;
	}

	public int getNo_cnt() {
		return no_cnt;
	}

	public void setNo_cnt(int no_cnt) {
		this.no_cnt = no_cnt;
	}

	public String getNo_rdate() {
		return no_rdate;
	}

	public void setNo_rdate(String no_rdate) {
		this.no_rdate = no_rdate;
	}

	public String getNo_word() {
		return no_word;
	}

	public void setNo_word(String no_word) {
		this.no_word = no_word;
	}

	
}
