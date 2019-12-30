package dev.mvc.notice_contents;

import java.util.HashMap;
import java.util.List;

public interface No_contentsProcInter {

	/**
	 * 등록
	 * @param contentsVO
     * @return 등록된 레코드 갯수
	 */
	 public int create(No_contentsVO no_contentsVO);
	 
	 public List<No_contentsVO> list_all();
	 
	 public List<No_contentsVO> list_by_cateno(int cateno);
	 
	 public int total_count();
	 
	 public No_contentsVO read(int no_contentsno);
	 
	 /**
	   * 수정
	   * @param no_contentsVO);
	   * @return 수정된 레코드 갯수
	   */
	  public int update(No_contentsVO no_contentsVO);
	  
	  /**
	   * 한건 삭제
	   * @param no_contentsno
	   * @return
	   */
	  public int delete(int no_contentsno);

	  /**
	   * <xmp>
	   * 부모 카테고리 번호별 레코드 갯수
	   * <select id="count_by_categrpno" resultType="int">
	   * </xmp>
	   * @param categrpno
	   * @return
	   */
	  public int count_by_cateno(int cateno);
	  
	  /**
	   * <xmp>
	   * 부모 카테고리 번호별 레코드 삭제
	   * <delete id="delete_by_categrpno" parameterType="int">
	   * </xmp>
	   * @param categrpno
	   * @return
	   */
	  public int delete_by_cateno(int cateno);
	  
	 
	  
	  /**카테고리별 검색 목록*/
	  public List<No_contentsVO> list_by_cateno_search(HashMap<String, Object> hashMap);
	  
	  /**카테고리별 검색 레코드 갯수
	   * @param hschMap
	   * @return
	   * */
	  public int search_count(HashMap<String, Object> hashMap);
}
