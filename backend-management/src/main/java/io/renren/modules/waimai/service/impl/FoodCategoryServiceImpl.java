package io.renren.modules.waimai.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;
import io.renren.modules.waimai.dao.FoodCategoryDao;
import io.renren.modules.waimai.entity.FoodCategoryEntity;
import io.renren.modules.waimai.service.FoodCategoryService;
import org.springframework.stereotype.Service;

import java.util.Map;


@Service("foodCategoryService")
public class FoodCategoryServiceImpl extends ServiceImpl<FoodCategoryDao, FoodCategoryEntity> implements FoodCategoryService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<FoodCategoryEntity> page = this.page(
                new Query<FoodCategoryEntity>().getPage(params),
                new QueryWrapper<FoodCategoryEntity>()
        );

        return new PageUtils(page);
    }

}