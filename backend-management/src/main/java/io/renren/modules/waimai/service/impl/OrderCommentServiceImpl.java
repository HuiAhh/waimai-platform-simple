package io.renren.modules.waimai.service.impl;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;
import io.renren.modules.waimai.dao.OrderCommentDao;
import io.renren.modules.waimai.entity.OrderCommentEntity;
import io.renren.modules.waimai.service.OrderCommentService;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service("orderCommentService")
public class OrderCommentServiceImpl extends ServiceImpl<OrderCommentDao, OrderCommentEntity> implements OrderCommentService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<OrderCommentEntity> page = this.page(
                new Query<OrderCommentEntity>().getPage(params),
                new QueryWrapper<OrderCommentEntity>()
        );

        return new PageUtils(page);
    }

}