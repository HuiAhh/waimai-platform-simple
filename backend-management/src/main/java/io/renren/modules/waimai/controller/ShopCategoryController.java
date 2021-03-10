package io.renren.modules.waimai.controller;


import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;
import io.renren.common.validator.group.AddGroup;
import io.renren.common.validator.group.UpdateGroup;
import io.renren.modules.waimai.entity.ShopCategoryEntity;
import io.renren.modules.waimai.service.ShopCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.Map;

/**
 * 通用的分类表
 *
 * @author qianchunjiang

 * @date 2020-10-28 23:03:42
 */
@RestController
@RequestMapping("waimai/shopcategory")
public class ShopCategoryController {
    @Autowired
    private ShopCategoryService shopCategoryService;

    /**
     * 列表
     */
    @RequestMapping("/list")

    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = shopCategoryService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")

    public R info(@PathVariable("id") Integer id){
		ShopCategoryEntity shopCategory = shopCategoryService.getById(id);

        return R.ok().put("shopCategory", shopCategory);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")

    public R save(@Validated(AddGroup.class) @RequestBody ShopCategoryEntity shopCategory){
		shopCategoryService.save(shopCategory);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")

    public R update(@Validated(UpdateGroup.class)@RequestBody ShopCategoryEntity shopCategory){
		shopCategoryService.updateById(shopCategory);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")

    public R delete(@RequestBody Integer[] ids){
		shopCategoryService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
