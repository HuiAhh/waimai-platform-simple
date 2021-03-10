package io.renren.modules.waimai.controller;


import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;
import io.renren.common.validator.group.AddGroup;
import io.renren.common.validator.group.UpdateGroup;
import io.renren.modules.waimai.entity.FoodEntity;
import io.renren.modules.waimai.entity.ShopInfoEntity;
import io.renren.modules.waimai.service.FoodCategoryService;
import io.renren.modules.waimai.service.FoodService;
import io.renren.modules.waimai.service.ShopInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.security.PublicKey;
import java.util.Arrays;
import java.util.List;
import java.util.Map;



/**
 * 菜品信息表
 *
 * @author qianchunjiang

 * @date 2020-10-28 23:03:42
 */
@RestController
@RequestMapping("waimai/food")
public class FoodController {
    @Autowired
    private FoodService foodService;
    @Autowired
    private ShopInfoService shopInfoService;
    @Autowired
    private FoodCategoryService foodCategoryService;

    /**
     * 列表
     */



    @RequestMapping("/list")

    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = foodService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")

    public R info(@PathVariable("id") Integer id){
		FoodEntity food = foodService.getById(id);

        return R.ok().put("food", food);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")

    public R save(@Validated(AddGroup.class) @RequestBody FoodEntity food){
		foodService.save(food);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")

    public R update(@Validated(UpdateGroup.class)@RequestBody FoodEntity food){
		foodService.updateById(food);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")

    public R delete(@RequestBody Integer[] ids){
		foodService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
