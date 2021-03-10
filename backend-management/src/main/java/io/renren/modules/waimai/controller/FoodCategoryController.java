package io.renren.modules.waimai.controller;


import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;
import io.renren.common.validator.group.AddGroup;
import io.renren.common.validator.group.UpdateGroup;
import io.renren.modules.waimai.entity.FoodCategoryEntity;
import io.renren.modules.waimai.service.FoodCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.Map;

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
