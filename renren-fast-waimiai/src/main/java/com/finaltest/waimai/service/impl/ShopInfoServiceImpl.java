package com.finaltest.waimai.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.common.utils.PageUtils;
import com.common.utils.Query;

import com.finaltest.waimai.dao.ShopInfoDao;
import com.finaltest.waimai.entity.ShopInfoEntity;
import com.finaltest.waimai.service.ShopInfoService;


@Service("shopInfoService")
public class ShopInfoServiceImpl extends ServiceImpl<ShopInfoDao, ShopInfoEntity> implements ShopInfoService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<ShopInfoEntity> page = this.page(
                new Query<ShopInfoEntity>().getPage(params),
                new QueryWrapper<ShopInfoEntity>()
        );

        return new PageUtils(page);
    }

}