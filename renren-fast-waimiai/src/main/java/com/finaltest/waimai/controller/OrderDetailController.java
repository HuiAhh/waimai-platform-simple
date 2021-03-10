package com.finaltest.waimai.controller;

import java.util.Arrays;
import java.util.Map;


import com.finaltest.waimai.entity.*;
import com.finaltest.waimai.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import com.common.utils.PageUtils;
import com.common.utils.R;

import javax.servlet.http.HttpSession;


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

    @Autowired
    private OrderService orderService;
    @Autowired
    private UserService userService;
    @Autowired
    private NewsService newsService;
    @Autowired
    private ShopInfoService shopInfoService;

    @Autowired
    OrderFoodService orderFoodService;

    /**
     * 列表
     */
    @RequestMapping("/list")

    public R list(@RequestParam Map<String, Object> params) {
        PageUtils page = orderDetailService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
//    @PreAuthorize("hasAnyAuthority('shop','user','deliver')")
    @RequestMapping("/info/{id}")

    public R info(@PathVariable("id") Integer id) {
        OrderDetailEntity orderDetail = orderDetailService.getById(id);

        return R.ok().put("orderDetail", orderDetail);
    }

    //    @PreAuthorize("hasAnyAuthority('shop','user','deliver')")
    @RequestMapping(value = "refund/{id}", method = RequestMethod.PUT)
    public R receive(@PathVariable("id") Integer id, HttpSession httpSession) {
        OrderDetailEntity orderEntity = orderDetailService.getById(id);
        UserEntity user = userService.getById(orderEntity.getUserId());
        UserEntity user1 = (UserEntity) httpSession.getAttribute("user");
//        if (!user1.getId().equals(user.getId()))
//            return R.error(402,"身份认证不通过");
        ShopInfoEntity shopInfoEntity = shopInfoService.getById(orderEntity.getShopId());
        UserEntity shopowner = userService.getById(shopInfoEntity.getShopownerId());
        NewsEntity news = new NewsEntity();
        if (orderEntity.getCompletestatus().equals("商家已接单")) {
            orderEntity.setCompletestatus("已取消");
            double totalMoney = orderEntity.getTotalMoney();

            shopowner.setWallet(shopowner.getWallet() - totalMoney);
            user.setWallet(user.getWallet() + totalMoney);

            userService.updateById(user);
            userService.updateById(shopowner);
            NewsEntity newsEntity = new NewsEntity();
            newsEntity.setMessage("你的订单已成功取消");
            newsEntity.setReceiveId(user.getId());
            newsService.save(newsEntity);

            news.setMessage("用户" + user.getUsername() + "已取消订单");
            news.setReceiveId(shopowner.getId());
            newsService.save(news);
            orderDetailService.updateById(orderEntity);
            return R.ok();
        }
        orderEntity.setCompletestatus("申请退款中");
        news.setMessage("用户" + user.getUsername() + "申请退款，请及时处理");
        news.setReceiveId(shopowner.getId());
        newsService.save(news);
        orderDetailService.updateById(orderEntity);
        return R.ok();
    }

    /**
     * 保存
     */
    @RequestMapping("/save")

    public R save(@RequestBody OrderDetailEntity orderDetail) {
        orderDetailService.save(orderDetail);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")

    public R update(@RequestBody OrderDetailEntity orderDetail) {
        orderDetailService.updateById(orderDetail);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")

    public R delete(@RequestBody Integer[] ids) {
        orderDetailService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
