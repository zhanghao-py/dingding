package cn.edu.bjut.weichat.dish.dao;

import java.util.List;
import java.util.Map;






import org.apache.ibatis.annotations.Param;

import cn.edu.bjut.weichat.core.bo.Dish;
import cn.edu.bjut.weichat.core.bo.Taste;
import cn.edu.bjut.weichat.core.mybatis.pagination.PageBean;
import cn.edu.bjut.weichat.dao.bean.DishDetail;

public interface DishDao {

	public List<Dish> selectDishByName(String dishName);

	public List<Dish> selectDishByCategory(int cate, int pageNum, int listNum); // 根据菜品的类别来显示菜品

	public List<Dish> selectDishById(long dishId); // 根据菜品的id来显示菜品
	
	public List<Dish> selectDishByRestId(long restId);  //根据餐厅的id来显示菜品
	
	public List<DishDetail> selectDishByRestIdAndCategory(@Param("map")Map<String,Object> map,@Param("page")PageBean<Dish> page); //根据餐厅id和菜品种类来显示菜品
	
	public List<DishDetail> getDishDetail(@Param("dishId")long dishId,@Param("page")PageBean<DishDetail> page);
	
	
	
	
	/*
	 * 智能点餐部分
	 */
	public List<DishDetail> getDishSmart(@Param("concoction")int concoction,@Param("page")PageBean<DishDetail> page);
	
	
	/**
	 *获取同类型食材的菜品 
	 * @param material 输入的食材
	 * @param restId   餐厅id
	 * @return
	 */
	public List<DishDetail> getSameMatDish(@Param("material")String material,@Param("restId")long restId,@Param("page")PageBean<DishDetail> page);
	
	
	/**
	 * 获取价格相似的菜品
	 * @param price  菜品价格
	 * @param restId 餐厅id
	 * @return
	 */
	
	public List<DishDetail> getSamePricDish(@Param("price")float price,@Param("restId")long restId,@Param("page")PageBean<DishDetail> page);
	
	
	
	/**
	 * 获取相似口味的菜品
	 * @param tastes 菜品口味
	 * @param restId 餐厅id
	 * @return
	 */
	
	public List<DishDetail> getSameTasteDish(@Param("taste")String taste,@Param("restId")long restId,@Param("page")PageBean<DishDetail> page);
	
}
