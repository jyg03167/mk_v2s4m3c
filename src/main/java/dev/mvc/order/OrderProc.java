package dev.mvc.order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.order.OrderProc")
public class OrderProc implements OrderProcInter{
  @Autowired
  OrderDAOInter orderDAO;

  @Override
  public int create(OrderVO orderVO) {
    int count = orderDAO.create(orderVO);
    return count;
  }

  @Override
  public List<OrderVO> list() {
    List<OrderVO> list = orderDAO.list();
    return list;
  }
}
