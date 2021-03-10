package io.renren.modules.waimai.service.impl;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;
import io.renren.modules.waimai.dao.ShopCategoryDao;
import io.renren.modules.waimai.entity.ShopCategoryEntity;
import io.renren.modules.waimai.service.ShopCategoryService;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service("shopCategoryService")
public class ShopCategoryServiceImpl extends ServiceImpl<ShopCategoryDao, ShopCategoryEntity> implements ShopCategoryService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<ShopCategoryEntity> page = this.page(
                new Query<ShopCategoryEntity>().getPage(params),
                new QueryWrapper<ShopCategoryEntity>()
        );

        return new PageUtils(page);
    }

}