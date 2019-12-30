package dev.mvc.notice_contents;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dev.mvc.notice_cate.Notice_cateProcInter;
import dev.mvc.notice_cate.Notice_cateVO;

@Controller
public class No_contentsCont {
	@Autowired
	@Qualifier("dev.mvc.notice_contents.No_contentsProc") // �̸� ����
	private No_contentsProcInter no_contentsProc;

	@Autowired
	@Qualifier("dev.mvc.notice_cate.Notice_cateProc") // �̸� ����
	private Notice_cateProcInter notice_cateProc;

	public No_contentsCont() {
		System.out.println("-->No_contents created");
	}
	
	// http://localhost:9090/team3/notice_contents/create.do?memberno=1&cateno=1
	@RequestMapping(value="/notice_contents/create.do", method=RequestMethod.GET)
	public ModelAndView create(int cateno) {
		ModelAndView mav = new ModelAndView();

		Notice_cateVO notice_cateVO = notice_cateProc.read(cateno);
		mav.addObject("notice_cateVO", notice_cateVO);
		
		mav.setViewName("/notice_contents/create"); // /webapp/notice_cate/create.jsp

		return mav;
	}
		  
	// ��� ó��
	@RequestMapping(value = "/notice_contents/create.do", method=RequestMethod.POST)
	public ModelAndView create(RedirectAttributes ra,
												No_contentsVO no_contentsVO) {
		ModelAndView mav = new ModelAndView();

		int count = no_contentsProc.create(no_contentsVO);
		
		if (count == 1) {
			notice_cateProc.increaseCnt(no_contentsVO.getCateno()); // ī�װ� �ۼ� ����
		}
		ra.addAttribute("count", count); // redirect parameter ����
		ra.addAttribute("cateno", no_contentsVO.getCateno());

		mav.setViewName("redirect:/notice_contents/create_msg.jsp");

		return mav;
	}
	
	// http://localhost:9090/team3/notice_contents/list_all.do
	@RequestMapping(value ="/notice_contents/list_all.do", method = RequestMethod.GET)
	  public ModelAndView list_all() {
	    ModelAndView mav = new ModelAndView();

	    List<No_contentsVO> list = no_contentsProc.list_all();
	    mav.addObject("list", list);
	    mav.setViewName("/notice_contents/list_all"); // /webapp/contents/list_all.jsp

	    return mav;
	  }
	/**
	   * ī�װ� �׷캰 ���
	   * http://localhost:9090/ojt/contents/list_by_categrpno.do?categrpno=1
	   * http://localhost:9090/ojt/contents/list_by_categrpno.do?categrpno=2
	   * http://localhost:9090/ojt/contents/list_by_categrpno.do?categrpno=3
	   * 
	   * @param categrpno
	   * @return
	   */
	  @RequestMapping(value = "/notice_contents/list.do", method = RequestMethod.GET)
	  public ModelAndView list_by_cateno(int cateno) {
	    ModelAndView mav = new ModelAndView();

	    List<No_contentsVO> list = no_contentsProc.list_by_cateno(cateno);
	    mav.addObject("list", list);
	    // /webapp/contents/list.jsp

	    Notice_cateVO notice_cateVO = notice_cateProc.read(cateno);
	    mav.addObject("notice_cateVO", notice_cateVO);

	    mav.setViewName("/notice_contents/list"); // ī�װ� �׷캰 ���

	    return mav;
	  }

	  /**
	   * ��ȸ http://localhost:9090/team3/notice_contents/read.do?no_contentsno=1
	   * 
	   * @param contentsno
	   * @return
	   */
	  @RequestMapping(value = "/notice_contents/read.do", method = RequestMethod.GET)
	  public ModelAndView read(int no_contentsno) {
	    ModelAndView mav = new ModelAndView();

	    No_contentsVO no_contentsVO = no_contentsProc.read(no_contentsno);
	    mav.addObject("no_contentsVO", no_contentsVO);

	    Notice_cateVO notice_cateVO = notice_cateProc.read(no_contentsVO.getCateno());
	    mav.addObject("notice_cateVO", notice_cateVO);
	    
	    mav.setViewName("/notice_contents/read");

	    return mav;
	  }
	  // http://localhost:9090/team3/no_contents/update.do?memberno=1&categrpno=1
	  @RequestMapping(value = "/notice_contents/update.do", method = RequestMethod.GET)
	  public ModelAndView update(int cateno, int no_contentsno) {
	    ModelAndView mav = new ModelAndView();

	    Notice_cateVO notice_cateVO = notice_cateProc.read(cateno);
	    mav.addObject("notice_cateVO", notice_cateVO);

	    No_contentsVO no_contentsVO = no_contentsProc.read(no_contentsno);
	    mav.addObject("no_contentsVO", no_contentsVO);

	    mav.setViewName("/notice_contents/update"); // /webapp/contents/update.jsp

	    return mav;
	  }

	  /**
	   * ���� ó��
	   * @param contentsVO
	   * @return
	   */
	  @RequestMapping(value = "/notice_contents/update.do", 
	                             method = RequestMethod.POST)
	  public ModelAndView update(RedirectAttributes ra, 
	                                            No_contentsVO no_contentsVO) {
	    ModelAndView mav = new ModelAndView();

	    int count = no_contentsProc.update(no_contentsVO);

	    ra.addAttribute("count", count);
	    ra.addAttribute("cateno", no_contentsVO.getCateno());
	    ra.addAttribute("no_contentsno", no_contentsVO.getNo_contentsno());
	    
	    mav.setViewName("redirect:/notice_contents/update_msg.jsp");

	    return mav; 
	  }
	  
	  /**
	   * �Ѱ� ������
	   * @param categrpno
	   * @param contentsno
	   * @return
	   */
	  // http://localhost:9090/team3/notice_contents/delete.do?cateno=1&no_contentsno=1
	  @RequestMapping(value = "/notice_contents/delete.do", 
	                             method = RequestMethod.GET)
	  public ModelAndView delete(int cateno, int no_contentsno) {
	    ModelAndView mav = new ModelAndView();

	    Notice_cateVO notice_cateVO = notice_cateProc.read(cateno);
	    mav.addObject("Notice_cateVO", notice_cateVO);

	    No_contentsVO no_contentsVO = no_contentsProc.read(no_contentsno);
	    mav.addObject("no_contentsVO", no_contentsVO);
	    
	    // FK contentsno �÷� ���� ���� ���ڵ� ���� ����: id="count_by_contentsno" 
	   // int count_by_contentsno = attachfileProc.count_by_contentsno(contentsno);
	    //mav.addObject("count_by_contentsno", count_by_contentsno);
	    
	    mav.setViewName("/notice_contents/delete"); // /webapp/contents/delete.jsp

	    return mav;
	  }
	  
	  /**
	   * �Ѱ� ���� ó��
	   * @param ra
	   * @param categrpno
	   * @param contentsno
	   * @return
	   */
	  @RequestMapping(value = "/notice_contents/delete.do", 
	                             method = RequestMethod.POST)
	  public ModelAndView delete(HttpSession session,
	                                           RedirectAttributes ra,
	                                            int cateno,
	                                            int no_contentsno) {
	    ModelAndView mav = new ModelAndView();

	   /* int memberno = (Integer)session.getAttribute("memberno");
	    // ���� �α����� ����ڿ� �� ����ڰ� ������ �˻�
	    if (memberno == no_contentsProc.read(no_contentsno).getMemberno()) {
	      int count = no_contentsProc.delete(no_contentsno);
	      if (count == 1) {
	        notice_cateProc.decreaseCnt(cateno);
	      }

	      ra.addAttribute("count", count);
	      ra.addAttribute("cateno", cateno);
	      ra.addAttribute("no_contentsno", no_contentsno);
	      
	      mav.setViewName("redirect:/notice_contents/delete_msg.jsp");
	    } else {
	      ra.addAttribute("cateno", cateno);
	      mav.setViewName("redirect:/notice_contents/auth_fail_msg.jsp");
	    }*/
	    
	    int count = no_contentsProc.delete(no_contentsno);
	      if (count == 1) {
	        notice_cateProc.decreaseCnt(cateno);
	      }

	      ra.addAttribute("count", count);
	      ra.addAttribute("cateno", cateno);
	      ra.addAttribute("no_contentsno", no_contentsno);
	      
	      mav.setViewName("redirect:/notice_contents/delete_msg.jsp");
	      
	    return mav;
	  }
	  
	  /**
	   * FK �÷����� �̿��� ���ڵ� ���� ó��
	   * @param ra
	   * @param categrpno
	   * @return
	   */
	  @RequestMapping(value = "/notice_contents/delete_by_cateno.do", 
	                             method = RequestMethod.POST)
	  public ModelAndView delete_by_cateno(RedirectAttributes ra,
	                                            int cateno) {
	    ModelAndView mav = new ModelAndView();

	    int count = no_contentsProc.delete_by_cateno(cateno);
	    if (count > 0) { // FK �÷� ���� ���� ���������� �����Ǿ��ٸ� cnt �÷� 0���κ���
	      notice_cateProc.cnt_zero(cateno);
	    }

	    ra.addAttribute("count", count); // ������ ���ڵ� ����
	    ra.addAttribute("cateno", cateno);
	    
	    mav.setViewName("redirect:/notice_contents/delete_by_cateno_msg.jsp");

	    return mav;
	  }

}
