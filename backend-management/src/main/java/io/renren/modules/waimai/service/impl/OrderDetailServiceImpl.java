package io.renren.modules.waimai.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;
import io.renren.modules.waimai.dao.OrderDetailDao;
import io.renren.modules.waimai.entity.OrderDetailEntity;
import io.renren.modules.waimai.service.OrderDetailService;
import org.springframework.stereotype.Service;

import java.util.Map;


@Service("orderDetailService")
public class OrderDetailServiceImpl extends ServiceImpl<OrderDetailDao, OrderDetailEntity> implements OrderDetailService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<OrderDetailEntity> page = this.page(
                new Query<OrderDetailEntity>().getPage(params),
                new QueryWrapper<OrderDetailEntity>()
        );

        return new PageUtils(page);
    }

}