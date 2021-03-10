package io.renren.modules.waimai.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.waimai.entity.ShopCategoryEntity;

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

