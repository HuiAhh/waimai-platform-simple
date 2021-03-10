package com.finaltest.waimai.controller;

import java.util.Arrays;
import java.util.List;
import java.util.Map;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
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

import com.finaltest.waimai.entity.FoodEntity;
import com.finaltest.waimai.service.FoodService;
import com.common.utils.PageUtils;
import com.common.utils.R;



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
    @RequestMapping("/shop/{shopid}")

    public R info(@PathVariable("shopid") Integer id){
        List<FoodEntity> list = foodService.list(new QueryWrapper<FoodEntity>().eq("shop_id", id));

        return R.ok().put("list", list);
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
