package io.renren.modules.waimai.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.waimai.entity.UsersEntity;


import java.util.Map;

/**
 * 用户登录表
 *
 * @author qianchunjiang
 * @date 2020-10-28 23:03:41
 */
public interface UsersService extends IService<UsersEntity> {

    PageUtils queryPage(Map<String, Object> params);
    PageUtils IdentityPage(Map<String, Object> params,Integer integer);
}

