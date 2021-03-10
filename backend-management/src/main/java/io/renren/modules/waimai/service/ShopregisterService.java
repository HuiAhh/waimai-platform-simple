package io.renren.modules.waimai.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.waimai.entity.ShopregisterEntity;


import java.util.Map;

/**
 * 
 *
 * @author qianchunjiang
 * @date 2020-10-28 23:03:42
 */
public interface ShopregisterService extends IService<ShopregisterEntity> {

    PageUtils queryPage(Map<String, Object> params);

    PageUtils applaylist(Map<String, Object> params);
}

