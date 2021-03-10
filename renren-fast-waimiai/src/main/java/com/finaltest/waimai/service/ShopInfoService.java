package com.finaltest.waimai.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.common.utils.PageUtils;
import com.finaltest.waimai.entity.ShopInfoEntity;

import java.util.Map;

/**
 * 商铺信息表
 *
 * @author qianchunjiang
 * @date 2020-10-28 23:03:42
 */
public interface ShopInfoService extends IService<ShopInfoEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

