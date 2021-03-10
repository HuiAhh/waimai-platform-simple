package com.finaltest.waimai.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.common.utils.PageUtils;
import com.common.utils.Query;

import com.finaltest.waimai.dao.DeliverTaskDao;
import com.finaltest.waimai.entity.DeliverTaskEntity;
import com.finaltest.waimai.service.DeliverTaskService;


@Service("deliverTaskService")
public class DeliverTaskServiceImpl extends ServiceImpl<DeliverTaskDao, DeliverTaskEntity> implements DeliverTaskService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<DeliverTaskEntity> page = this.page(
                new Query<DeliverTaskEntity>().getPage(params),
                new QueryWrapper<DeliverTaskEntity>()
        );

        return new PageUtils(page);
    }

}