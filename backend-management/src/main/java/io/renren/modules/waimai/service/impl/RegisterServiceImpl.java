package io.renren.modules.waimai.service.impl;


import java.util.Map;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;
import io.renren.modules.waimai.dao.RegisterDao;
import io.renren.modules.waimai.entity.RegisterEntity;
import io.renren.modules.waimai.service.RegisterService;
import org.springframework.stereotype.Service;


@Service("registerService")
public class RegisterServiceImpl extends ServiceImpl<RegisterDao, RegisterEntity> implements RegisterService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<RegisterEntity> page = this.page(
                new Query<RegisterEntity>().getPage(params),
                new QueryWrapper<RegisterEntity>().eq("registerstatus","申请中")
        );

        return new PageUtils(page);
    }

}