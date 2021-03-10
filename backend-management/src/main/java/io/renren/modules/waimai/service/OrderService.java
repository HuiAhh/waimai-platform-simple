package io.renren.modules.waimai.service;


import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.waimai.entity.OrderEntity;

import java.util.Map;

/**
 * 订单主表
 *
 * @author qianchunjiang
 * @date 2020-10-28 23:03:42
 */
public interface OrderService extends IService<OrderEntity> {

    PageUtils queryPage(Map<String, Object> params);
    PageUtils ulist(Map<String, Object> params);
}

