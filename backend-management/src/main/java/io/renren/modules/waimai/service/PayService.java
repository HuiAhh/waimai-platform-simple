package io.renren.modules.waimai.service;


import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.waimai.entity.PayEntity;

import java.util.Map;

/**
 * 订单支付表
 *
 * @author qianchunjiang
 * @date 2020-10-28 23:03:42
 */
public interface PayService extends IService<PayEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

