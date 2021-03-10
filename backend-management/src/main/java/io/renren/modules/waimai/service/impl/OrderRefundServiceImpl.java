package io.renren.modules.waimai.service.impl;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;
import io.renren.modules.waimai.dao.OrderRefundDao;
import io.renren.modules.waimai.entity.OrderRefundEntity;
import io.renren.modules.waimai.service.OrderRefundService;
import org.springframework.stereotype.Service;

import java.util.Map;

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