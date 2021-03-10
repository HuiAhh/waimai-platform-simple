package io.renren.modules.waimai.service.impl;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;
import io.renren.modules.waimai.dao.OrderFoodDao;
import io.renren.modules.waimai.entity.OrderFoodEntity;
import io.renren.modules.waimai.service.OrderFoodService;
import org.springframework.stereotype.Service;

import java.util.Map;

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