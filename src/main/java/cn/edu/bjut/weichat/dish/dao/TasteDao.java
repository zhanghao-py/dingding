package cn.edu.bjut.weichat.dish.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.edu.bjut.weichat.core.bo.Taste;
import cn.edu.bjut.weichat.core.mybatis.pagination.PageBean;

public interface TasteDao {

	public List<Taste> loadTastes(@Param("dishId")long dishId,@Param("page")PageBean<Taste> page);
}
