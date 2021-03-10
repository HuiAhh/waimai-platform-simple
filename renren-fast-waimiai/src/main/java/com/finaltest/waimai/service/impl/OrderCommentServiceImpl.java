package com.finaltest.waimai.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.common.utils.PageUtils;
import com.common.utils.Query;

import com.finaltest.waimai.dao.OrderCommentDao;
import com.finaltest.waimai.entity.OrderCommentEntity;
import com.finaltest.waimai.service.OrderCommentService;


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