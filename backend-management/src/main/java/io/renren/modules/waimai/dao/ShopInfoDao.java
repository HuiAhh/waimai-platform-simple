package io.renren.modules.waimai.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import io.renren.modules.waimai.entity.ShopInfoEntity;
import org.apache.ibatis.annotations.Mapper;

/**
 * 商铺信息表
 * 
 * @author qianchunjiang
 * @date 2020-10-28 23:03:42
 */
@Mapper
public interface ShopInfoDao extends BaseMapper<ShopInfoEntity> {
	
}
