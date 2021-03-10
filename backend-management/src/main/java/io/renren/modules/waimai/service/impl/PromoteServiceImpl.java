package io.renren.modules.waimai.service.impl;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;
import io.renren.modules.waimai.dao.PromoteDao;
import io.renren.modules.waimai.entity.PromoteEntity;
import io.renren.modules.waimai.service.PromoteService;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service("promoteService")
public class PromoteServiceImpl extends ServiceImpl<PromoteDao, PromoteEntity> implements PromoteService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<PromoteEntity> page = this.page(
                new Query<PromoteEntity>().getPage(params),
                new QueryWrapper<PromoteEntity>()
        );

        return new PageUtils(page);
    }

}