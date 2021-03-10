package io.renren.modules.waimai.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import io.renren.modules.waimai.entity.ShopCollectEntity;
import org.apache.ibatis.annotations.Mapper;

/**
 * 店铺收藏表
 * 
 * @author qianchunjiang
 * @date 2020-10-28 23:03:42
 */
@Mapper
public interface ShopCollectDao extends BaseMapper<ShopCollectEntity> {
	
}
