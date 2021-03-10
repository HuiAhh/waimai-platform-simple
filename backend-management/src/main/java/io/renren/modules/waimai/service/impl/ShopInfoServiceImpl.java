package io.renren.modules.waimai.service.impl;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;
import io.renren.modules.waimai.dao.ShopInfoDao;
import io.renren.modules.waimai.entity.ShopInfoEntity;
import io.renren.modules.waimai.service.ShopInfoService;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service("shopInfoService")
public class ShopInfoServiceImpl extends ServiceImpl<ShopInfoDao, ShopInfoEntity> implements ShopInfoService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<ShopInfoEntity> page = this.page(
                new Query<ShopInfoEntity>().getPage(params),
                new QueryWrapper<ShopInfoEntity>()
        );

        return new PageUtils(page);
    }

}