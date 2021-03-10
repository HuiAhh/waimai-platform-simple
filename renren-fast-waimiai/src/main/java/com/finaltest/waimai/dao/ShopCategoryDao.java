package com.finaltest.waimai.dao;

import com.finaltest.waimai.entity.ShopCategoryEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

/**
 * 通用的分类表
 * 
 * @author qianchunjiang
 * @date 2020-10-28 23:03:42
 */
@Component
@Mapper
public interface ShopCategoryDao extends BaseMapper<ShopCategoryEntity> {
	
}
