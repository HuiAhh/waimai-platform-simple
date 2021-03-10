package com.finaltest.waimai.service;
import com.baomidou.mybatisplus.extension.service.IService;
import com.common.utils.PageUtils;
import com.finaltest.waimai.entity.PromoteEntity;

import java.util.Map;

/**
 * 
 *
 * @author qianchunjiang
 * @date 2020-11-08 17:30:05
 */
public interface PromoteService extends IService<PromoteEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

