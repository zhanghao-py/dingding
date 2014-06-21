package cn.edu.bjut.weichat.dish.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.edu.bjut.weichat.core.bo.Order;
import cn.edu.bjut.weichat.core.mybatis.pagination.PageBean;
import cn.edu.bjut.weichat.dao.bean.AllOrders;
import cn.edu.bjut.weichat.dao.bean.HistoryDish;


public interface OrderDao {

	public List<AllOrders> getAllOrders(@Param("userId")long userId,@Param("page")PageBean<AllOrders> page);
	
	public int addOrder(Order order); 
	
	public void deleteOrder(long orderId);
	
	public List<HistoryDish> loadOrdersByRestIdAndUserId(@Param("userId")long userId,@Param("restId")long restId,@Param("page")PageBean<HistoryDish> page);
}
