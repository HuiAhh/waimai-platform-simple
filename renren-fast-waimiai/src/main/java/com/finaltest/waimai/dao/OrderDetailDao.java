package com.finaltest.waimai.dao;

import com.finaltest.waimai.entity.OrderDetailEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 订单详情表
 * 
 * @author qianchunjiang
 * @date 2020-10-28 23:03:42
 */
@Mapper
public interface OrderDetailDao extends BaseMapper<OrderDetailEntity> {
	
}
