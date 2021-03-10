package com.finaltest.waimai.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.common.utils.PageUtils;
import com.common.utils.Query;

import com.finaltest.waimai.dao.ShopregisterDao;
import com.finaltest.waimai.entity.ShopregisterEntity;
import com.finaltest.waimai.service.ShopregisterService;


@Service("shopregisterService")
public class ShopregisterServiceImpl extends ServiceImpl<ShopregisterDao, ShopregisterEntity> implements ShopregisterService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<ShopregisterEntity> page = this.page(
                new Query<ShopregisterEntity>().getPage(params),
                new QueryWrapper<ShopregisterEntity>()
        );

        return new PageUtils(page);
    }

}