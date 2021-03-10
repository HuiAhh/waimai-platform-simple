package com.finaltest.waimai.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.common.utils.PageUtils;
import com.common.utils.Query;
import com.finaltest.waimai.dao.PromoteApplayDao;
import com.finaltest.waimai.entity.PromoteApplayEntity;
import com.finaltest.waimai.service.PromoteApplayService;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service("promoteApplayService")
public class PromoteApplayServiceImpl extends ServiceImpl<PromoteApplayDao, PromoteApplayEntity> implements PromoteApplayService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<PromoteApplayEntity> page = this.page(
                new Query<PromoteApplayEntity>().getPage(params),
                new QueryWrapper<PromoteApplayEntity>()
        );

        return new PageUtils(page);
    }

}