package com.finaltest.waimai.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.common.utils.PageUtils;
import com.finaltest.waimai.entity.DeliverTaskEntity;

import java.util.Map;

/**
 * 订单配送表
 *
 * @author qianchunjiang
 * @date 2020-10-28 23:03:42
 */
public interface DeliverTaskService extends IService<DeliverTaskEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

