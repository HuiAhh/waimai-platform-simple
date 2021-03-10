package com.finaltest.waimai.service;
import com.baomidou.mybatisplus.extension.service.IService;
import com.common.utils.PageUtils;
import com.finaltest.waimai.entity.RegisterEntity;

import java.util.Map;

/**
 * 
 *
 * @author qianchunjiang
 * @date 2020-11-03 15:51:49
 */
public interface RegisterService extends IService<RegisterEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

