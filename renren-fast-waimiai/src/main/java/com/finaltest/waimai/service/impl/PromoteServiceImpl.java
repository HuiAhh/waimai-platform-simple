package com.finaltest.waimai.service.impl;


import java.util.Map;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.common.utils.PageUtils;
import com.common.utils.Query;
import com.finaltest.waimai.dao.PromoteDao;
import com.finaltest.waimai.entity.PromoteEntity;
import com.finaltest.waimai.service.PromoteService;

import org.springframework.stereotype.Service;


@Service("promoteService")
public class PromoteServiceImpl extends ServiceImpl<PromoteDao, PromoteEntity> implements PromoteService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<PromoteEntity> page = this.page(
                new Query<PromoteEntity>().getPage(params),
                new QueryWrapper<PromoteEntity>()
        );

        return new PageUtils(page);
    }

}