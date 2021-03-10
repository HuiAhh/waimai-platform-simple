package io.renren.modules.waimai.service;


import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.waimai.entity.FoodCategoryEntity;

import java.util.Map;

/**
 * 商家的食物分类
 *
 * @author qianchunjiang
 * @date 2020-10-28 23:03:42
 */
public interface FoodCategoryService extends IService<FoodCategoryEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

