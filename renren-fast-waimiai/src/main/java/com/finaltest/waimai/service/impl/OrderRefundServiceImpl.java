package com.finaltest.waimai.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.common.utils.PageUtils;
import com.common.utils.Query;

import com.finaltest.waimai.dao.OrderRefundDao;
import com.finaltest.waimai.entity.OrderRefundEntity;
import com.finaltest.waimai.service.OrderRefundService;


@Service("orderRefundService")
public class OrderRefundServiceImpl extends ServiceImpl<OrderRefundDao, OrderRefundEntity> implements OrderRefundService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<OrderRefundEntity> page = this.page(
                new Query<OrderRefundEntity>().getPage(params),
                new QueryWrapper<OrderRefundEntity>()
        );

        return new PageUtils(page);
    }

}