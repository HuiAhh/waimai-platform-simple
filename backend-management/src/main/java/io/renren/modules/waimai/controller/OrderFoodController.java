package io.renren.modules.waimai.controller;


import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;
import io.renren.modules.waimai.entity.OrderFoodEntity;
import io.renren.modules.waimai.service.OrderFoodService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.Map;

/**
 * 订单商品详情表
 *
 * @author qianchunjiang

 * @date 2020-10-28 23:03:42
 */
@RestController
@RequestMapping("waimai/orderfood")
public class OrderFoodController {
    @Autowired
    private OrderFoodService orderFoodService;

    /**
     * 列表
     */
    @RequestMapping("/list")

    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = orderFoodService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")

    public R info(@PathVariable("id") Integer id){
		OrderFoodEntity orderFood = orderFoodService.getById(id);

        return R.ok().put("orderFood", orderFood);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")

    public R save(@RequestBody OrderFoodEntity orderFood){
		orderFoodService.save(orderFood);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")

    public R update(@RequestBody OrderFoodEntity orderFood){
		orderFoodService.updateById(orderFood);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")

    public R delete(@RequestBody Integer[] ids){
		orderFoodService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
