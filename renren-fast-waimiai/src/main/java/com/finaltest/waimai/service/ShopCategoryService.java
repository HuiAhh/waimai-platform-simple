package com.finaltest.waimai.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.common.utils.PageUtils;
import com.finaltest.waimai.entity.ShopCategoryEntity;

import java.util.Map;

/**
 * 通用的分类表
 *
 * @author qianchunjiang
 * @date 2020-10-28 23:03:42
 */
public interface ShopCategoryService extends IService<ShopCategoryEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

