package com.finaltest.waimai.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.common.utils.PageUtils;
import com.finaltest.waimai.entity.FoodEntity;

import java.util.List;
import java.util.Map;

/**
 * 菜品信息表
 *
 * @author qianchunjiang
 * @date 2020-10-28 23:03:42
 */
public interface FoodService extends IService<FoodEntity> {

    PageUtils queryPage(Map<String, Object> params);
    List<FoodEntity> selectAllFood(Integer shopId);
    int updateFoodStatus(Integer foodId,Integer foodstatus);
}

