package com.finaltest.waimai.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.common.utils.PageUtils;
import com.finaltest.waimai.entity.OrderDetailEntity;

import java.util.Map;

/**
 * 订单详情表
 *
 * @author qianchunjiang
 * @date 2020-10-28 23:03:42
 */
public interface OrderDetailService extends IService<OrderDetailEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

