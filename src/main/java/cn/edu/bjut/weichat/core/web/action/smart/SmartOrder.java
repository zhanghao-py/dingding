package cn.edu.bjut.weichat.core.web.action.smart;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.bjut.weichat.core.mybatis.pagination.PageBean;
import cn.edu.bjut.weichat.core.util.Category;
import cn.edu.bjut.weichat.dao.bean.DishDetail;
import cn.edu.bjut.weichat.dao.bean.OrderOfDetail;
import cn.edu.bjut.weichat.dish.service.DishService;



@Service
public class SmartOrder {
	
	private Logger logger = Logger.getLogger(SmartOrder.class);
	
	
	@Autowired
	private DishService dishService;

	private List<DishDetail> list;

	private Map<String, List<DishDetail>> dishMap;

	/**
	 * 
	 * @param restId
	 * @param personNum
	 * @param avPrice
	 * @param obj   //忌口
	 * @return
	 */
	public OrderOfDetail smartOfOrderDish(long restId,int personNum, float avPrice, Object obj) {

		OrderOfDetail ood = new OrderOfDetail();
		
		dishMap = new HashMap<String, List<DishDetail>>();
		//PageBean<Map<String, List<DishDetail>>> pageBean = new PageBean<Map<String, List<DishDetail>>>();

		if (personNum <= 0 || avPrice <= 0) {
			return null;
		}

		try {
			   list = new ArrayList<DishDetail>();

				//取凉菜
				//设置pegeNum和pageSize
				List<DishDetail> coldDish = dishService.selectDishByRestIdAndCategory(restId,Category.COLD.getNum(), 1, 5);

				int dishNum = randNum(coldDish.size());

				list.add(coldDish.get(dishNum));

				dishMap.put(Category.getNameByNum(Category.COLD.getNum()),list);


			        list = new ArrayList<DishDetail>();
				//取汤
				//设置pegeNum和pageSize
				List<DishDetail> soupDish = dishService.selectDishByRestIdAndCategory(restId, Category.SOUP.getNum(), 1, 5);

				dishNum = randNum(soupDish.size());

				list.add(coldDish.get(dishNum));

				dishMap.put(Category.getNameByNum(Category.SOUP.getNum()),list);

				//取热菜
				list = new ArrayList<DishDetail>();

				//设置pegeNum和pageSize
				List<DishDetail> hotDish = dishService.selectDishByRestIdAndCategory(restId, Category.HOT.getNum(), 1, 20);

				int[] nums = randNums(personNum,hotDish.size());

				for(int i = 0;i < nums.length;i++){
					
				    list.add(hotDish.get(nums[i]));
				}

				dishMap.put(Category.getNameByNum(Category.HOT.getNum()),list);

				ood.setAverPrice(avPrice);
				ood.setRestId(restId);
				ood.setPersonNum(personNum);
				//还要加订单创建的时间以及菜品的总价
				
				ood.dishs = dishMap;
			
		} catch (Exception e) {
			logger.warn("智能点餐失败", e);
			
			return null;
		}
		
		
		
		return ood;

	}

	public static int randNum(int listSize) {

		if (listSize <= 0)
			return -1;

		Random rand = new Random();

		int randNum = rand.nextInt(listSize);

		return randNum;
	}

	public static int[] randNums(int personNum, int listSize) {

		// 采用第二种方法，每次都随机点人数减一个热菜
		Random rand = new Random();

		boolean[] bool = new boolean[listSize];

		int[] nums = new int[personNum - 1];

		int randNum = 0;

		for (int i = 0; i < personNum - 1; i++) {
			do {
				randNum = rand.nextInt(listSize);
			} while (bool[randNum]);

			nums[i] = randNum;

		}

		return nums;
	}

}
