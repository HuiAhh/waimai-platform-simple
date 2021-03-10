package com.finaltest.waimai.controller;

import java.math.BigDecimal;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.finaltest.waimai.entity.*;
import com.finaltest.waimai.service.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import com.common.utils.PageUtils;
import com.common.utils.R;

import javax.servlet.http.HttpSession;


/**
 * 订单主表
 *
 * @author qianchunjiang
 * @date 2020-10-28 23:03:42
 */
@Transactional
@RestController
@RequestMapping("waimai/order")
public class OrderController {
    @Autowired
    private OrderService orderService;
    @Autowired
    private UserService userService;
    @Autowired
    private NewsService newsService;
    @Autowired
    private ShopInfoService shopInfoService;
    @Autowired
    OrderDetailService orderDetailService;
    @Autowired
    OrderFoodService orderFoodService;

    /**
     * 列表
     */
    @RequestMapping("/list")

    public R list(@RequestParam Map<String, Object> params) {
        PageUtils page = orderService.queryPage(params);

        return R.ok().put("page", page);
    }
//    @PreAuthorize("hasAnyAuthority('shop','user','deliver')")
    @RequestMapping(value = "refund/{id}", method = RequestMethod.PUT)
    public R receive(@PathVariable("id") Integer id, HttpSession httpSession) {
        OrderEntity orderEntity = orderService.getById(id);
        UserEntity user = userService.getById(orderEntity.getUserId());
        UserEntity user1 = (UserEntity) httpSession.getAttribute("user");
//        if (!user1.getId().equals(user.getId()))
//            return R.error(402,"身份认证不通过");
        ShopInfoEntity shopInfoEntity = shopInfoService.getById(orderEntity.getShopId());
        UserEntity shopowner = userService.getById(shopInfoEntity.getShopownerId());
        NewsEntity news = new NewsEntity();
        if (orderEntity.getCompletstatus().equals("商家已接单")) {
            orderEntity.setCompletstatus("已取消");
            double totalMoney = orderEntity.getTotalMoney();

            shopowner.setWallet(shopowner.getWallet() - totalMoney);
            userService.updateById(shopowner);
            NewsEntity newsEntity = new NewsEntity();
            newsEntity.setMessage("你的订单已成功取消");
            newsEntity.setReceiveId(user.getId());
            newsService.save(newsEntity);

            news.setMessage("用户" + user.getUsername() + "已取消订单");
            news.setReceiveId(shopowner.getId());
            newsService.save(news);

            return R.ok();
        }
        orderEntity.setCompletstatus("申请退款中");
        news.setMessage("用户" + user.getUsername() + "申请退款，请及时处理");
        news.setReceiveId(shopowner.getId());
        newsService.save(news);
        orderService.updateById(orderEntity);
        return R.ok();
    }

    /**
     * @param id
     * @return
     */
//    @PreAuthorize("hasAnyAuthority('shop','user','deliver')")
    @RequestMapping("/consumer-list/{id}")
    public R descinfo(@PathVariable("id") Integer id,HttpSession httpSession) {
        QueryWrapper<OrderDetailEntity> wrapper = new QueryWrapper<>();
//        if (id <= 0)
//            return R.error(404, "没有该用户");
        UserEntity user = (UserEntity) httpSession.getAttribute("user");
//        if (user == null) return R.error(402, "未登录，请登录");
//
//        if (!user.getId().equals(id))
//            return R.error(402,"身份认证不通过");

        List<OrderDetailEntity> list = orderDetailService.list(wrapper.eq("user_id", id).orderByDesc("gmt_create"));

        return R.ok().put("list", list);
    }

    /**
     * 下单
     */
    @RequestMapping(value = "/{id}", method = RequestMethod.POST)
//    @PreAuthorize("hasAnyAuthority('shop','user','deliver')")
    public R info(@PathVariable("id") Integer id,
                  @RequestBody Order order
            ,HttpSession httpSession) {
//        UserEntity user = (UserEntity) httpSession.getAttribute("user");
//        if (user == null) return R.error(402, "未登录，请登录");
//
//        if (!user.getId().equals(id))
//            return R.error(402,"身份认证不通过");
        OrderDetailEntity orderDetailEntity = order.getOrderDetailEntity();
        List<OrderFoodEntity> orderFoodEntities = order.getOrderFoodEntities();
        UserEntity userEntity = userService.getOne(new QueryWrapper<UserEntity>().eq("id", id));
        if (userEntity.getWallet() >= orderDetailEntity.getTotalMoney()) {
            Integer shopId = orderDetailEntity.getShopId();
            ShopInfoEntity shop = shopInfoService.getById(shopId);
            orderDetailEntity.setShopShopname(shop.getShopname());
            orderDetailEntity.setShopMobile(shop.getContactMobile());
            orderDetailEntity.setShopAddress(shop.getAddress());
            orderDetailEntity.setBoxCost(shop.getBoxCost());
            orderDetailEntity.setSendCost(shop.getSendCost());
            userEntity.setWallet(userEntity.getWallet() - orderDetailEntity.getTotalMoney());
            userService.updateById(userEntity);
            orderDetailService.save(orderDetailEntity);
            Integer orderid = orderDetailEntity.getId();

            for (int i = orderFoodEntities.size() - 1; i >= 0; i--) {
                OrderFoodEntity orderFoodEntity = orderFoodEntities.get(i);
                orderFoodEntity.setOrderId(orderid);
                orderFoodService.save(orderFoodEntity);

            }
            NewsEntity newsEntity = new NewsEntity();
            newsEntity.setReceiveId(shop.getId());
            newsEntity.setMessage("你有新的订单请及时处理");
            newsService.save(newsEntity);
            return R.ok();
        } else
            return R.error(1000, "账户余额不足");
    }

    /**
     * 保存
     */
    @RequestMapping("/save")

    public R save(@RequestBody OrderEntity order) {
        orderService.save(order);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")

    public R update(@RequestBody OrderEntity order) {
        orderService.updateById(order);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")

    public R delete(@RequestBody Integer[] ids) {
        orderService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
