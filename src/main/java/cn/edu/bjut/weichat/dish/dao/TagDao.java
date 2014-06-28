package cn.edu.bjut.weichat.dish.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.edu.bjut.weichat.core.bo.Tag;
import cn.edu.bjut.weichat.core.mybatis.pagination.PageBean;


public interface TagDao {

	public List<Tag> loadTags(@Param("dishId")long dishId,@Param("page")PageBean<Tag> page);
}
