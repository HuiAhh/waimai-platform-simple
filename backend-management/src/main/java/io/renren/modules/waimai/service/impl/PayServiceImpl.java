package io.renren.modules.waimai.service.impl;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;
import io.renren.modules.waimai.dao.PayDao;
import io.renren.modules.waimai.entity.PayEntity;
import io.renren.modules.waimai.service.PayService;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service("payService")
public class PayServiceImpl extends ServiceImpl<PayDao, PayEntity> implements PayService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<PayEntity> page = this.page(
                new Query<PayEntity>().getPage(params),
                new QueryWrapper<PayEntity>()
        );

        return new PageUtils(page);
    }

}