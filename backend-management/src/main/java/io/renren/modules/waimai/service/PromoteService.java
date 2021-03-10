package io.renren.modules.waimai.service;
import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.waimai.entity.PromoteEntity;

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

