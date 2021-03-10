package io.renren.modules.waimai.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.waimai.entity.UserAddressEntity;


import java.util.Map;

/**
 * 用户配送地址
 *
 * @author qianchunjiang
 * @date 2020-10-28 23:03:42
 */
public interface UserAddressService extends IService<UserAddressEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

