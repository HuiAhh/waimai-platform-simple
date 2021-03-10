package com.finaltest.waimai.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.common.utils.PageUtils;
import com.common.utils.Query;

import com.finaltest.waimai.dao.FoodCategoryDao;
import com.finaltest.waimai.entity.FoodCategoryEntity;
import com.finaltest.waimai.service.FoodCategoryService;


@Service("foodCategoryService")
public class FoodCategoryServiceImpl extends ServiceImpl<FoodCategoryDao, FoodCategoryEntity> implements FoodCategoryService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<FoodCategoryEntity> page = this.page(
                new Query<FoodCategoryEntity>().getPage(params),
                new QueryWrapper<FoodCategoryEntity>()
        );

        return new PageUtils(page);
    }

}