package com.finaltest.waimai.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.common.utils.PageUtils;
import com.common.utils.Query;

import com.finaltest.waimai.dao.FoodDao;
import com.finaltest.waimai.entity.FoodEntity;
import com.finaltest.waimai.service.FoodService;


@Service("foodService")
public class FoodServiceImpl extends ServiceImpl<FoodDao, FoodEntity> implements FoodService {
    @Autowired
    FoodService foodService;

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<FoodEntity> page = this.page(
                new Query<FoodEntity>().getPage(params),
                new QueryWrapper<FoodEntity>()
        );

        return new PageUtils(page);
    }

    @Override
    public List<FoodEntity> selectAllFood(Integer shopId) {
        return baseMapper.selectAllFood(shopId);
    }

    @Override
    public int updateFoodStatus(Integer foodId, Integer foodstatus) {
        return baseMapper.updateFoodStatus(foodId,foodstatus);
    }


}