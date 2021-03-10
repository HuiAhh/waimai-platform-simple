package com.finaltest.waimai.dao;

import com.finaltest.waimai.entity.FoodCategoryEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

/**
 * 商家的食物分类
 * 
 * @author qianchunjiang
 * @date 2020-10-28 23:03:42
 */
@Mapper
@Component
public interface FoodCategoryDao extends BaseMapper<FoodCategoryEntity> {
	
}
