package com.finaltest.waimai.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.common.utils.PageUtils;
import com.common.utils.Query;

import com.finaltest.waimai.dao.ShopCollectDao;
import com.finaltest.waimai.entity.ShopCollectEntity;
import com.finaltest.waimai.service.ShopCollectService;


@Service("shopCollectService")
public class ShopCollectServiceImpl extends ServiceImpl<ShopCollectDao, ShopCollectEntity> implements ShopCollectService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<ShopCollectEntity> page = this.page(
                new Query<ShopCollectEntity>().getPage(params),
                new QueryWrapper<ShopCollectEntity>()
        );

        return new PageUtils(page);
    }

}