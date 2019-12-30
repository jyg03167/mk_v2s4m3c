package dev.mvc.notice_cate;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.notice_contents.No_contentsProcInter;

import org.springframework.beans.factory.annotation.Qualifier;

@Controller
public class Notice_cateCont {
	@Autowired
	@Qualifier("dev.mvc.notice_cate.Notice_cateProc") // �̸� ����
	private Notice_cateProcInter notice_cateProc;

	@Autowired
	@Qualifier("dev.mvc.notice_contents.No_contentsProc") // �̸� ����
	private No_contentsProcInter no_contentsProc;

	public Notice_cateCont() {
		System.out.println("--> Notice_cateCont created.");
	}

	// http://localhost:9090/team3/notice_cate/create.do
	  @RequestMapping(value="/notice_cate/create.do", method=RequestMethod.GET)
	  public ModelAndView create() {
	    ModelAndView mav = new ModelAndView();
	    mav.setViewName("/notice_cate/create"); // /webapp/notice_cate/create.jsp
	    
	    return mav;
	  }
	  
	  // ��� ó��
	  @RequestMapping(value="/notice_cate/create.do", method=RequestMethod.POST)
	  public ModelAndView create(Notice_cateVO notice_cateVO) {
	    ModelAndView mav = new ModelAndView();
	    
	    int count = notice_cateProc.create(notice_cateVO);
	    
	    // type 3: ����ó��: list.do, ������ �߻�: create_msg.jsp�� ��� 
	    if (count == 0) {
	      mav.setViewName("redirect:/notice_cate/create_msg.jsp?count=" + count);
	    } else {
	      mav.setViewName("redirect:/notice_cate/list.do"); // list.jsp X
	    }
	        
	    return mav;
	  }

	  // seqno �������� ��� ���
	// http://localhost:9090/team3/notice_cate/list.do
	  @RequestMapping(value="/notice_cate/list.do", method=RequestMethod.GET)
	  public ModelAndView list() {
	    ModelAndView mav = new ModelAndView();
	    
	    List<Notice_cateVO> list = notice_cateProc.list_seqno_asc();
	   
	    
	    mav.addObject("list", list);
	    mav.setViewName("/notice_cate/list"); // /webapp/notice_cate/list.jsp

	    // mav.setViewName("redirect:/categrp/create_msg.jsp?count=" + count);
	        
	    return mav;
	  }
	  
	  // ������ + ��ȸ
	// http://localhost:9090/team3/notice_cate/update.do
	  @RequestMapping(value="/notice_cate/update.do", method=RequestMethod.GET)
	  public ModelAndView update(int cateno) {
	    ModelAndView mav = new ModelAndView();
	    
	    Notice_cateVO notice_cateVO = notice_cateProc.read(cateno);
	    
	    mav.addObject("notice_cateVO", notice_cateVO);
	    mav.setViewName("/notice_cate/update"); 
	        
	    return mav;
	  }
	 
	  // ���� ó��
	  @RequestMapping(value="/notice_cate/update.do", method=RequestMethod.POST)
	  public ModelAndView update(Notice_cateVO notice_cateVO) {
	    ModelAndView mav = new ModelAndView();
	    
	    int count = notice_cateProc.update(notice_cateVO);
	    String url = "redirect:/notice_cate/update_msg.jsp?count=" + count +
	                      "&cateno=" + notice_cateVO.getCateno();
	    mav.setViewName(url);
	                               
	    return mav;
	  }
	  
	  // ������
	  @RequestMapping(value="/notice_cate/delete.do", method=RequestMethod.GET)
	  public ModelAndView delete(int cateno) {
	    ModelAndView mav = new ModelAndView();
	    
	    
	    Notice_cateVO notice_cateVO = notice_cateProc.read(cateno);
	    
	    mav.addObject("notice_cateVO", notice_cateVO);
	    mav.setViewName("/notice_cate/delete"); // /webapp/categrp/delete.jsp

	    // mav.setViewName("redirect:/categrp/create_msg.jsp?count=" + count);
	        
	    return mav;
	  }
	  
	  // ���� ó��
	  @RequestMapping(value="/notice_cate/delete.do", method=RequestMethod.POST)
	  public ModelAndView delete_proc(int cateno) {
	    ModelAndView mav = new ModelAndView();
	    
	    int count = notice_cateProc.delete(cateno);
	    String url = "redirect:/notice_cate/delete_msg.jsp?count=" + count +
	                      "&cateno=" + cateno;
	    mav.setViewName(url);
	                               
	    return mav;
	  }
	  
	 
}
