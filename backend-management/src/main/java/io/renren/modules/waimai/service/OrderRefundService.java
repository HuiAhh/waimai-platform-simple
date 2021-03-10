package io.renren.modules.waimai.service;


import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.waimai.entity.OrderRefundEntity;

import java.util.Map;

/**
 * 订单--退款处理
 *
 * @author qianchunjiang
 * @date 2020-10-28 23:03:42
 */
public interface OrderRefundService extends IService<OrderRefundEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

