package com.finaltest.waimai.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.common.utils.PageUtils;
import com.finaltest.waimai.entity.ShopCollectEntity;

import java.util.Map;

/**
 * 店铺收藏表
 *
 * @author qianchunjiang
 * @date 2020-10-28 23:03:42
 */
public interface ShopCollectService extends IService<ShopCollectEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

