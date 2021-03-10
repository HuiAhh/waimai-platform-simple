package io.renren.modules.waimai.service.impl;


import java.util.Map;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;
import io.renren.modules.waimai.dao.PromoteApplayDao;
import io.renren.modules.waimai.entity.PromoteApplayEntity;
import io.renren.modules.waimai.service.PromoteApplayService;
import org.springframework.stereotype.Service;


@Service("promoteApplayService")
public class PromoteApplayServiceImpl extends ServiceImpl<PromoteApplayDao, PromoteApplayEntity> implements PromoteApplayService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<PromoteApplayEntity> page = this.page(
                new Query<PromoteApplayEntity>().getPage(params),
                new QueryWrapper<PromoteApplayEntity>().ne("applay_status","通过申请")
        );

        return new PageUtils(page);
    }

}