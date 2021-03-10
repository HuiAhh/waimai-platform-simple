package io.renren.modules.waimai.service;


import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.waimai.entity.ShopInfoEntity;

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

