package io.renren.modules.waimai.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;
import io.renren.modules.waimai.dao.DeliverTaskDao;
import io.renren.modules.waimai.entity.DeliverTaskEntity;
import io.renren.modules.waimai.service.DeliverTaskService;
import org.springframework.stereotype.Service;

import java.util.Map;


@Service("deliverTaskService")
public class DeliverTaskServiceImpl extends ServiceImpl<DeliverTaskDao, DeliverTaskEntity> implements DeliverTaskService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<DeliverTaskEntity> page = this.page(
                new Query<DeliverTaskEntity>().getPage(params),
                new QueryWrapper<DeliverTaskEntity>()
        );

        return new PageUtils(page);
    }

}