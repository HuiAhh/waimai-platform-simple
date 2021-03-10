package com.finaltest.waimai.service;
import com.baomidou.mybatisplus.extension.service.IService;
import com.common.utils.PageUtils;
import com.finaltest.waimai.entity.PromoteApplayEntity;

import java.util.Map;

/**
 * 
 *
 * @author qianchunjiang
 * @date 2020-11-08 17:30:05
 */
public interface PromoteApplayService extends IService<PromoteApplayEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

