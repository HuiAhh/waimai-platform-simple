package com.finaltest.waimai.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.common.utils.PageUtils;
import com.common.utils.Query;

import com.finaltest.waimai.dao.PayDao;
import com.finaltest.waimai.entity.PayEntity;
import com.finaltest.waimai.service.PayService;


@Service("payService")
public class PayServiceImpl extends ServiceImpl<PayDao, PayEntity> implements PayService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<PayEntity> page = this.page(
                new Query<PayEntity>().getPage(params),
                new QueryWrapper<PayEntity>()
        );

        return new PageUtils(page);
    }

}