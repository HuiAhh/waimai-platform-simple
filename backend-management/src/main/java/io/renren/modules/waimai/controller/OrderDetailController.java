package io.renren.modules.waimai.controller;


import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;
import io.renren.modules.waimai.entity.OrderDetailEntity;
import io.renren.modules.waimai.service.OrderDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.Map;

/**
 * 订单详情表
 *
 * @author qianchunjiang

 * @date 2020-10-28 23:03:42
 */
@RestController
@RequestMapping("waimai/orderdetail")
public class OrderDetailController {
    @Autowired
    private OrderDetailService orderDetailService;

    /**
     * 列表
     */
    @RequestMapping("/list")

    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = orderDetailService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")

    public R info(@PathVariable("id") Integer id){
		OrderDetailEntity orderDetail = orderDetailService.getById(id);

        return R.ok().put("orderDetail", orderDetail);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")

    public R save(@RequestBody OrderDetailEntity orderDetail){
		orderDetailService.save(orderDetail);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")

    public R update(@RequestBody OrderDetailEntity orderDetail){
		orderDetailService.updateById(orderDetail);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")

    public R delete(@RequestBody Integer[] ids){
		orderDetailService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
