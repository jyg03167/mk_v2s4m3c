package dev.mvc.productcate;

import java.util.List;

import dev.mvc.productcate.ProductcateVO;

public interface ProductcateDAOInter {

  /**
   * ���
   * <xmp>
   * <select id="list_prodcutcateno_asc" resultType="ProductcateVO">
   * </xmp> 
   * @return
   */
  public List<ProductcateVO> list_seqno_asc();
  
  /**
   * <xmp>
   * ���
   * <insert id="create" parameterType="ProductcateVO">
   * </xmp>
   * @param productcateVO
   * @return
   */
  public int create(ProductcateVO productcateVO);
  
  /**
   * ��ȸ
   * @param productcateno
   * @return
   */
  public ProductcateVO read(int productcateno);

  
  /**
   * <xmp>
   * ����
   * <delete id="delete" parameterType="int">
   * </xmp>
   * @param productcateno
   * @return
   */
  public int delete(int productcateno);
  
  /**
   * ���� 
   * @param productcateVO
   * @return
   */
  public int update(ProductcateVO productcateVO);
  
  /**
   * �׷쿡 ���� ������ �� �� ����
   * @param productcateno
   * @return
   */
  public int increaseCnt(int productcateno);
  
  /**
   * �׷쿡 ���� ������ �� �� ����
   * @param productcateno
   * @return
   */
  public int decreaseCnt(int productcateno);
  
}
