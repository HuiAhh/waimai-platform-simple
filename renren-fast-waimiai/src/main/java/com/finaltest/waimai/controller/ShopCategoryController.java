package com.finaltest.waimai.controller;

import java.util.Arrays;
import java.util.Map;


import com.common.valid.AddGroup;
import com.common.valid.UpdateGroup;
import org.apache.ibatis.annotations.Update;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.finaltest.waimai.entity.ShopCategoryEntity;
import com.finaltest.waimai.service.ShopCategoryService;
import com.common.utils.PageUtils;
import com.common.utils.R;



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
