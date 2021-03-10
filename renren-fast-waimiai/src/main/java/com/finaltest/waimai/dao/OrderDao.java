package com.finaltest.waimai.dao;

import com.finaltest.waimai.entity.OrderEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 订单主表
 * 
 * @author qianchunjiang
 * @date 2020-10-28 23:03:42
 */
@Mapper
public interface OrderDao extends BaseMapper<OrderEntity> {
	
}
