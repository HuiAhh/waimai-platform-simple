package com.finaltest.waimai.dao;

import com.finaltest.waimai.entity.FoodEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * 菜品信息表
 * 
 * @author qianchunjiang
 * @date 2020-10-28 23:03:42
 */
@Mapper
public interface FoodDao extends BaseMapper<FoodEntity> {
	List<FoodEntity> selectAllFood(Integer shopId);
	int updateFoodStatus(Integer foodId,Integer foodstatus);

}
