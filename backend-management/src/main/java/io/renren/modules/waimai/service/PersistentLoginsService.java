package io.renren.modules.waimai.service;


import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.waimai.entity.PersistentLoginsEntity;

import java.util.Map;

/**
 * 
 *
 * @author qianchunjiang
 * @date 2020-10-28 23:03:42
 */
public interface PersistentLoginsService extends IService<PersistentLoginsEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

