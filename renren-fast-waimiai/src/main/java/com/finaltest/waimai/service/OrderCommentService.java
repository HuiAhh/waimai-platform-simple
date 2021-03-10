package com.finaltest.waimai.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.common.utils.PageUtils;
import com.finaltest.waimai.entity.OrderCommentEntity;

import java.util.Map;

/**
 * 订单--评论
 *
 * @author qianchunjiang
 * @date 2020-10-28 23:03:42
 */
public interface OrderCommentService extends IService<OrderCommentEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

