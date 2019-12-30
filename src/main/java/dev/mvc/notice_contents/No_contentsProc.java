package dev.mvc.notice_contents;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.notice_contents.No_contentsProc")
public class No_contentsProc implements No_contentsProcInter{
	@Autowired
	private No_contentsDAOInter no_contentsDAO;
	
	@Override
	  public int create(No_contentsVO no_contentsVO) {
	    int count = no_contentsDAO.create(no_contentsVO);
	    return count;
	  }

	@Override
	public List<No_contentsVO> list_all() {
		List<No_contentsVO> list = no_contentsDAO.list_all();
		return list;
	}

	@Override
	public List<No_contentsVO> list_by_cateno(int cateno) {
		List<No_contentsVO> list = no_contentsDAO.list_by_cateno(cateno);
		return list;
	}

	@Override
	public int total_count() {
		int count = no_contentsDAO.total_count();
		return count;
	}

	@Override
	public No_contentsVO read(int no_contentsno) {
		No_contentsVO no_contentsVO = no_contentsDAO.read(no_contentsno);
		return no_contentsVO;
	}

	@Override
	public int update(No_contentsVO no_contentsVO) {
		int count = no_contentsDAO.update(no_contentsVO);
	    return count;
	}

	@Override
	public int delete(int no_contentsno) {
		 int count = no_contentsDAO.delete(no_contentsno);
		 return count;
	}

	@Override
	public int count_by_cateno(int cateno) {
		 int count = no_contentsDAO.count_by_cateno(cateno);
		 return count;
	}

	@Override
	public int delete_by_cateno(int cateno) {
		 int count = no_contentsDAO.delete_by_cateno(cateno);
		 return count;
	}

	@Override
	public List<No_contentsVO> list_by_cateno_search(HashMap<String, Object> hashMap) {
		List<No_contentsVO> list = no_contentsDAO.list_by_cateno_search(hashMap);
		return list;
	}

	@Override
	public int search_count(HashMap<String, Object> hashMap) {
		int count = no_contentsDAO.search_count(hashMap);
		return count;
	}
	
	
	
}
 