package com.finaltest.waimai.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.common.utils.PageUtils;
import com.finaltest.waimai.entity.UserEntity;

import java.util.Map;

/**
 * 用户登录表
 *
 * @author qianchunjiang
 * @date 2020-10-28 23:03:41
 */
public interface UserService extends IService<UserEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

