package io.renren.modules.waimai.service;


import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.waimai.entity.FoodEntity;

import java.util.Map;

/**
 * 菜品信息表
 *
 * @author qianchunjiang
 * @date 2020-10-28 23:03:42
 */
public interface FoodService extends IService<FoodEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

