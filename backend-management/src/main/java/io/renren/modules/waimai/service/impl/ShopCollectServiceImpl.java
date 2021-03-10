package io.renren.modules.waimai.service.impl;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;
import io.renren.modules.waimai.dao.ShopCollectDao;
import io.renren.modules.waimai.entity.ShopCollectEntity;
import io.renren.modules.waimai.service.ShopCollectService;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service("shopCollectService")
public class ShopCollectServiceImpl extends ServiceImpl<ShopCollectDao, ShopCollectEntity> implements ShopCollectService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<ShopCollectEntity> page = this.page(
                new Query<ShopCollectEntity>().getPage(params),
                new QueryWrapper<ShopCollectEntity>()
        );

        return new PageUtils(page);
    }

}