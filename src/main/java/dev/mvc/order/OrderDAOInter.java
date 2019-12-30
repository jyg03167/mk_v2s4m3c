package dev.mvc.order;

import java.util.List;

public interface OrderDAOInter {

  /**
   * <xmp>
   * 등록
   * <insert id="create" parameterType="OrderVO">
   * </xmp>
   * @param orderVO
   * @return
   */
  public int create(OrderVO orderVO);
  
  /**
   * <xmp>
   * 목록
   * <select id="list_all" resultType="OrderVO" >
   * </xmp>
   * @return
   */
  public List<OrderVO> list();
}
