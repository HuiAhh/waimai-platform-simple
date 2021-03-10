package com.finaltest.waimai.service.impl;


import java.util.Map;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.common.utils.PageUtils;
import com.common.utils.Query;
import com.finaltest.waimai.dao.RegisterDao;
import com.finaltest.waimai.entity.RegisterEntity;
import com.finaltest.waimai.service.RegisterService;

import org.springframework.stereotype.Service;


@Service("registerService")
public class RegisterServiceImpl extends ServiceImpl<RegisterDao, RegisterEntity> implements RegisterService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<RegisterEntity> page = this.page(
                new Query<RegisterEntity>().getPage(params),
                new QueryWrapper<RegisterEntity>()
        );

        return new PageUtils(page);
    }

}