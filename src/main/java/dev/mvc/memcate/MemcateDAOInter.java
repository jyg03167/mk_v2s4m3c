package dev.mvc.memcate;

import java.util.List;

public interface MemcateDAOInter {
  
  /**
   *  ���
   * @param memcateVO
   * @return
   */
  public int create(MemcateVO memcateVO);
  
  /**
   * ���
   * @return
   */
  public List<MemcateVO> list_seqno_asc();
  
  /**
   * ��ȸ
   * @param memccateno
   * @return
   */
  public MemcateVO read(int memccateno);
  
  /**
   * ����
   * @param memcateVO
   * @return
   */
  public int update(MemcateVO memcateVO);
  
  /**
   * ����
   * @param categrpno
   * @return
   */
  public int delete(int memcateno);
  
  /**
   * ȸ�� �� ����
   * @param categrpno
   * @return
   */
  public int increaseCnt(int categrpno);
  
  /**
   * ȸ�� �� ����
   * @param categrpno
   * @return
   */
  public int decreaseCnt(int categrpno);
  
  /**
   * ���� up
   * @param memcateno
   * @return
   */
  public int update_seqno_up(int memcateno);
  
  /**
   * ���� down
   * @param memcateno
   * @return
   */
  public int update_seqno_down(int memcateno);
  
  /**
   * ȸ���� �ʱ�ȭ(0��)
   * @param memcateno
   * @return
   */
  public int cnt_zero(int memcateno);

  
}
