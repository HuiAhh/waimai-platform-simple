package io.renren.modules.waimai.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import io.renren.modules.waimai.entity.ShopCategoryEntity;
import org.apache.ibatis.annotations.Mapper;

/**
 * 通用的分类表
 * 
 * @author qianchunjiang
 * @date 2020-10-28 23:03:42
 */
@Mapper
public interface ShopCategoryDao extends BaseMapper<ShopCategoryEntity> {
	
}
