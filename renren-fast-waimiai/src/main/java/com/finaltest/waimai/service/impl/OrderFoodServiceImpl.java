package com.finaltest.waimai.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.common.utils.PageUtils;
import com.common.utils.Query;

import com.finaltest.waimai.dao.OrderFoodDao;
import com.finaltest.waimai.entity.OrderFoodEntity;
import com.finaltest.waimai.service.OrderFoodService;


@Service("orderFoodService")
public class OrderFoodServiceImpl extends ServiceImpl<OrderFoodDao, OrderFoodEntity> implements OrderFoodService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<OrderFoodEntity> page = this.page(
                new Query<OrderFoodEntity>().getPage(params),
                new QueryWrapper<OrderFoodEntity>()
        );

        return new PageUtils(page);
    }

}