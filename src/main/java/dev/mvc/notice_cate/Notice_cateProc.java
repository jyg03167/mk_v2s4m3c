package dev.mvc.notice_cate;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


// ���� �̸� ����
@Component("dev.mvc.notice_cate.Notice_cateProc")
public class Notice_cateProc implements Notice_cateProcInter {
  // CategrpDAOInter�� MyBATIS�� ȣ���ϴ� �ڵ尡 �ڵ�������.
  // �ڵ� ������ Ŭ������ ��ü�� �ڵ� �Ҵ��.
  @Autowired
  private Notice_cateDAOInter notice_cateDAO; 
  
  @Override
  public int create(Notice_cateVO notice_cateVO) {
    int count = notice_cateDAO.create(notice_cateVO);
    return count;
  }

  @Override
  public List<Notice_cateVO> list_cateno_asc() {
    List<Notice_cateVO> list = notice_cateDAO.list_cateno_asc();
    
    return list;
  }
 
  @Override
  public List<Notice_cateVO> list_seqno_asc() {
     List<Notice_cateVO> list = notice_cateDAO.list_seqno_asc();
    
    return list;
  }

@Override
public Notice_cateVO read(int cateno) {
	Notice_cateVO notice_cateVO = notice_cateDAO.read(cateno);
	return notice_cateVO;
}

@Override
public int update(Notice_cateVO notice_cateVO) {
	int count = notice_cateDAO.update(notice_cateVO);
	return count;
}

@Override
public int delete(int cateno) {
	int count = notice_cateDAO.delete(cateno);
	return count;
}

@Override
public int increaseCnt(int cateno) {
	 int count = notice_cateDAO.increaseCnt(cateno);
	    return count;
}

@Override
public int decreaseCnt(int cateno) {
	int count = notice_cateDAO.decreaseCnt(cateno);
	return count;
}

@Override
public int cnt_zero(int cateno) {
	int count = notice_cateDAO.cnt_zero(cateno);
	return count;
}

}
