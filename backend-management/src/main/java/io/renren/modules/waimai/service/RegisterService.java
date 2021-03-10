package io.renren.modules.waimai.service;
import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.waimai.entity.RegisterEntity;

import java.util.Map;

/**
 * 
 *
 * @author qianchunjiang
 * @date 2020-10-31 08:56:08
 */
public interface RegisterService extends IService<RegisterEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

