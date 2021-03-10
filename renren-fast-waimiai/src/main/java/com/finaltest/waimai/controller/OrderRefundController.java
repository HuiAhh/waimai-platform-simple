package com.finaltest.waimai.controller;

import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;


import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.finaltest.waimai.entity.OrderDetailEntity;
import com.finaltest.waimai.entity.ShopInfoEntity;
import com.finaltest.waimai.entity.UserEntity;
import com.finaltest.waimai.service.OrderDetailService;
import com.finaltest.waimai.service.ShopInfoService;
import com.finaltest.waimai.service.UserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import com.finaltest.waimai.entity.OrderRefundEntity;
import com.finaltest.waimai.service.OrderRefundService;
import com.common.utils.PageUtils;
import com.common.utils.R;

import javax.swing.text.TabableView;


/**
 * 订单--退款处理
 *
 * @author qianchunjiang
 * @date 2020-10-28 23:03:42
 */
@RestController
@RequestMapping("waimai/orderrefund")
//@Api("退款")
public class OrderRefundController {
    @Autowired
    private OrderRefundService orderRefundService;
    @Autowired
    UserService userService;
    @Autowired
    ShopInfoService shopInfoService;
    @Autowired
    OrderDetailService orderDetailService;


    /**
     * 列表
     */
    @RequestMapping("/list")

    public R list(@RequestParam Map<String, Object> params) {
        PageUtils page = orderRefundService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
//    @PreAuthorize("hasAuthority('shop')")
    public R info(@PathVariable("id") Integer id) {
        OrderRefundEntity orderRefund = orderRefundService.getById(id);

        return R.ok().put("orderRefund", orderRefund);
    }

    @RequestMapping("/refundlist/{id}")
//    @PreAuthorize("hasAuthority('shop')")
    @ApiOperation("获取申请退款列表")
    public R refundlist(@PathVariable("id") Integer id) {
        List<Integer> list1 = new LinkedList<>();
        List<Integer> list2 = new LinkedList<>();
        try {
            List<ShopInfoEntity> shoplist = shopInfoService.list(new QueryWrapper<ShopInfoEntity>().eq("shopowner_id", id));
            for (int i = 0; i < shoplist.size(); i++) {
                list1.add(shoplist.get(i).getId());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        try {
            List<OrderDetailEntity> orderlist = orderDetailService.list(new QueryWrapper<OrderDetailEntity>().in("shop_id", list1));
            for (OrderDetailEntity orderDetailEntity : orderlist) {
                list2.add(orderDetailEntity.getId());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        List<OrderRefundEntity> list3 = orderRefundService.list(new QueryWrapper<OrderRefundEntity>()
                .in("order_id", list2).
                        eq("completestatus", 0));


        return R.ok().put("list", list3);
    }

    @RequestMapping(value = "/refuse/{id}", method = RequestMethod.POST)
    @ApiOperation("商家拒绝退款")
    public R refuse(@PathVariable("id") Integer id) {
        OrderRefundEntity orderRefund = null;
        try {
            orderRefund = orderRefundService.getById(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        orderRefund.setCompletestatus(-1);
        orderRefundService.updateById(orderRefund);
        return R.ok();
    }

    /**
     * 同意tuikuan
     */
    @RequestMapping(value = "/save", method = RequestMethod.POST)
//    @PreAuthorize("hasAuthority('shop')")
    @ApiOperation("商家同意退款")
    public R save(@RequestBody OrderRefundEntity orderRefund) {

        orderRefund.setCompletestatus(1);
        orderRefundService.updateById(orderRefund);
        UserEntity comsumtor = userService.getById(orderRefund.getUserId());
        if (comsumtor == null)
            return R.error(1023, "非法请求");
        OrderDetailEntity orderDetailEntity = orderDetailService.getById(orderRefund.getOrderId());

        if (orderDetailEntity == null)
            return R.error(1023, "订单不存在");
        Integer shopId = orderDetailEntity.getShopId();

        ShopInfoEntity shopInfoEntity = null;
        try {
            shopInfoEntity = shopInfoService.getById(shopId);
        } catch (Exception e) {
            e.printStackTrace();
        }

        Integer shopownerId = shopInfoEntity.getShopownerId();
        UserEntity shop = null;
        try {
            shop = userService.getById(shopownerId);
        } catch (Exception e) {
            e.printStackTrace();
        }
        comsumtor.setWallet(comsumtor.getWallet() + orderRefund.getPayMoney());
        shop.setWallet(shop.getWallet() - orderRefund.getPayMoney());
        userService.updateById(comsumtor);
        userService.updateById(shop);

        if(orderRefund.getPayMoney()==orderDetailEntity.getTotalMoney()){
            orderDetailEntity.setCompletestatus("已退款");
            orderDetailService.updateById(orderDetailEntity);
        }

        return R.ok();
    }

    @RequestMapping(value = "/objective-save", method = RequestMethod.POST)
//    @PreAuthorize("hasAuthority('shop')")
    @ApiOperation("商家主动退款")
    public R objectiveRefundFromShopowner(@RequestBody OrderRefundEntity orderRefund) {

        orderRefund.setCompletestatus(1);
        orderRefundService.save(orderRefund);
        UserEntity comsumtor = userService.getById(orderRefund.getUserId());
        if (comsumtor == null)
            return R.error(1023, "非法请求");
        OrderDetailEntity orderDetailEntity = orderDetailService.getById(orderRefund.getOrderId());

        if (orderDetailEntity == null)
            return R.error(1023, "订单不存在");
        Integer shopId = orderDetailEntity.getShopId();

        ShopInfoEntity shopInfoEntity = null;
        try {
            shopInfoEntity = shopInfoService.getById(shopId);
        } catch (Exception e) {
            e.printStackTrace();
        }

        Integer shopownerId = shopInfoEntity.getShopownerId();
        UserEntity shop = null;
        try {
            shop = userService.getById(shopownerId);
        } catch (Exception e) {
            e.printStackTrace();
        }
        comsumtor.setWallet(comsumtor.getWallet() + orderRefund.getPayMoney());
        shop.setWallet(shop.getWallet() - orderRefund.getPayMoney());
        userService.updateById(comsumtor);
        userService.updateById(shop);


        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")

    public R update(@RequestBody OrderRefundEntity orderRefund) {
        orderRefundService.updateById(orderRefund);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")

    public R delete(@RequestBody Integer[] ids) {
        orderRefundService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
