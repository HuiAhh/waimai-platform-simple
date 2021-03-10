package com.finaltest.waimai.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.common.utils.PageUtils;
import com.common.utils.Query;

import com.finaltest.waimai.dao.ShopCategoryDao;
import com.finaltest.waimai.entity.ShopCategoryEntity;
import com.finaltest.waimai.service.ShopCategoryService;


@Service("shopCategoryService")
public class ShopCategoryServiceImpl extends ServiceImpl<ShopCategoryDao, ShopCategoryEntity> implements ShopCategoryService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<ShopCategoryEntity> page = this.page(
                new Query<ShopCategoryEntity>().getPage(params),
                new QueryWrapper<ShopCategoryEntity>()
        );

        return new PageUtils(page);
    }

}