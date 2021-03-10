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

import com.finaltest.waimai.entity.FoodCategoryEntity;
import com.finaltest.waimai.service.FoodCategoryService;
import com.common.utils.PageUtils;
import com.common.utils.R;



/**
 * 商家的食物分类
 *
 * @author qianchunjiang

 * @date 2020-10-28 23:03:42
 */
@RestController
@RequestMapping("waimai/foodcategory")
public class FoodCategoryController {
    @Autowired
    private FoodCategoryService foodCategoryService;

    /**
     * 列表
     */
    @RequestMapping("/list")

    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = foodCategoryService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")

    public R info(@PathVariable("id") Integer id){
		FoodCategoryEntity foodCategory = foodCategoryService.getById(id);

        return R.ok().put("foodCategory", foodCategory);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")

    public R save(@Validated(AddGroup.class) @RequestBody FoodCategoryEntity foodCategory){
		foodCategoryService.save(foodCategory);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")

    public R update(@Validated(UpdateGroup.class)@RequestBody FoodCategoryEntity foodCategory){
		foodCategoryService.updateById(foodCategory);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")

    public R delete(@RequestBody Integer[] ids){
		foodCategoryService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
