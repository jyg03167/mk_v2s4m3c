package dev.mvc.order;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.cart.CartProcInter;
import dev.mvc.cart.CartVO;
import dev.mvc.cart.Cart_ProductVO;
import dev.mvc.cartgrp.CartgrpProcInter;
import dev.mvc.cartgrp.CartgrpVO;

@Controller
public class OrderCont {
  @Autowired
  @Qualifier("dev.mvc.cartgrp.CartgrpProc") 
  private CartgrpProcInter cartgrpProc;
  
  @Autowired
  @Qualifier("dev.mvc.cart.CartProc")
  private CartProcInter cartProc;
  
  @Autowired
  @Qualifier("dev.mvc.order.OrderProc")
  private OrderProcInter orderProc;
  
  public OrderCont() {
    System.out.println("--> OrderCont created");
  }
  
  @RequestMapping(value = "/order/list.do", method = RequestMethod.GET)
  public ModelAndView list(int cartno_list[]) {
    ModelAndView mav = new ModelAndView();
    Cart_ProductVO cart_productVO = new Cart_ProductVO();
    List<Cart_ProductVO> list = new ArrayList<Cart_ProductVO>();
    
    for(int i = 0; i < cartno_list.length; i++) {
      cart_productVO = cartProc.read_cart_product(cartno_list[i]);
      list.add(cart_productVO);
    }
    
    mav.addObject("list", list);
    mav.addObject("list_count", cartno_list.length);
    
    mav.setViewName("/order/list"); // /webapp/categrp/create_msg.jsp

    return mav;
  }
}
