package dev.mvc.notice_cate;

import java.util.List;

public interface Notice_cateProcInter {
	 /**
	   * <Xmp>
	   * ī�װ� �׷� ���
	   * <insert id="create" parameterType="Notice_cateVO"> 
	   * </Xmp>
	   * @param Notice_cateVO
	   * @return ó���� ���ڵ� ����
	   */
	  public int create(Notice_cateVO notice_cateVO);
	  
	  /**
	   * ���
	   * <xmp>
	   * <select id="list" resultType="Notice_cateVO">
	   * </xmp> 
	   * @return
	   */
	  public List<Notice_cateVO> list_cateno_asc();

	  /** seqno �������� ��� */
	  public List<Notice_cateVO> list_seqno_asc();
	  
	  /**�׷쿡 ���� ������ �� �� ����*/
	  public int increaseCnt(int cateno);
	  
	  /** �׷쿡 ���� ������ �ۼ� ����*/
	  public int decreaseCnt(int cateno);
	  
	  /** cnt �÷� 0���� �ʱ�ȭ*/
	  public int cnt_zero(int cateno);

	  /**��ȸ*/ 
	  public Notice_cateVO read(int cateno);

	  /**����*/
	  public int update(Notice_cateVO notice_cateVO);

	  /**����*/
	  public int delete(int cateno);

}
