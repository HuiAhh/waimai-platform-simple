package io.renren.modules.waimai.controller;


import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;
import io.renren.modules.waimai.entity.OrderRefundEntity;
import io.renren.modules.waimai.service.OrderRefundService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.Map;

/**
 * 订单--退款处理
 *
 * @author qianchunjiang

 * @date 2020-10-28 23:03:42
 */
@RestController
@RequestMapping("waimai/orderrefund")
public class OrderRefundController {
    @Autowired
    private OrderRefundService orderRefundService;

    /**
     * 列表
     */
    @RequestMapping("/list")

    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = orderRefundService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")

    public R info(@PathVariable("id") Integer id){
		OrderRefundEntity orderRefund = orderRefundService.getById(id);

        return R.ok().put("orderRefund", orderRefund);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")

    public R save(@RequestBody OrderRefundEntity orderRefund){
		orderRefundService.save(orderRefund);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")

    public R update(@RequestBody OrderRefundEntity orderRefund){
		orderRefundService.updateById(orderRefund);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")

    public R delete(@RequestBody Integer[] ids){
		orderRefundService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
