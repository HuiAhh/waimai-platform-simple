package com.finaltest.waimai.dao;

import com.finaltest.waimai.entity.OrderRefundEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 订单--退款处理
 * 
 * @author qianchunjiang
 * @date 2020-10-28 23:03:42
 */
@Mapper
public interface OrderRefundDao extends BaseMapper<OrderRefundEntity> {
	
}
