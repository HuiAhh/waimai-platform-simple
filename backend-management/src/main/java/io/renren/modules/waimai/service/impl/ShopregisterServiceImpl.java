package io.renren.modules.waimai.service.impl;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;
import io.renren.modules.waimai.dao.ShopregisterDao;
import io.renren.modules.waimai.entity.ShopregisterEntity;
import io.renren.modules.waimai.service.ShopregisterService;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service("shopregisterService")
public class ShopregisterServiceImpl extends ServiceImpl<ShopregisterDao, ShopregisterEntity> implements ShopregisterService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<ShopregisterEntity> page = this.page(
                new Query<ShopregisterEntity>().getPage(params),
                new QueryWrapper<ShopregisterEntity>()
        );

        return new PageUtils(page);
    }

    @Override
    public PageUtils applaylist(Map<String, Object> params) {
        IPage<ShopregisterEntity> page = this.page(
                new Query<ShopregisterEntity>().getPage(params),
                new QueryWrapper<ShopregisterEntity>().eq("registerstatus","审核中")
        );

        return new PageUtils(page);
    }

}