package com.finaltest.waimai.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.common.utils.R;
import com.finaltest.waimai.entity.NewsEntity;
import com.finaltest.waimai.entity.OrderDetailEntity;
import com.finaltest.waimai.entity.UserEntity;
import com.finaltest.waimai.service.NewsService;
import com.finaltest.waimai.service.OrderDetailService;
import com.finaltest.waimai.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author 钱春江
 * @create 2020-11-2020/11/2
 */
@RestController
@Transactional
@RequestMapping("waimai/deliver")
//@PreAuthorize("hasAuthority('deliver')")
public class DeliverController {
    @Autowired
    OrderDetailService orderDetailService;
    @Autowired
    UserService userService;
    @Autowired
    NewsService newsService;

    @RequestMapping(value = "orderlist/{deliverId}", method = RequestMethod.GET)

    public R orderlist(@PathVariable("deliverId") Integer deliverid, HttpSession httpSession) {
//        UserEntity user = (UserEntity) httpSession.getAttribute("user");
//        if (!user.getId().equals(deliverid))
//            return R.error(402, "身份认证不通过");
        List<OrderDetailEntity> list = orderDetailService.list(new QueryWrapper<OrderDetailEntity>().eq("deliver_id", deliverid).ne("completestatus", "已完成"));
        return R.ok().put("list", list);
    }

    @RequestMapping("orderlist")
    public R orderlist() {
        List<OrderDetailEntity> list = orderDetailService.list(new QueryWrapper<OrderDetailEntity>().eq("completestatus", "商家已接单"));
        return R.ok().put("list", list);
    }

    @RequestMapping(value = "receive/{id}", method = RequestMethod.POST)
    public R receive(@PathVariable Integer id, @RequestBody OrderDetailEntity orderDetailEntity, HttpSession httpSession) {
//        UserEntity user = (UserEntity) httpSession.getAttribute("user");
//        if (user == null) return R.error(402, "未登录，请登录");
//
//        if (!user.getId().equals(id))
//            return R.error(402, "身份认证不通过");
        UserEntity userEntity = userService.getById(id);
        orderDetailEntity.setCompletestatus("配送中");
        orderDetailEntity.setDeliverId(id);
        orderDetailEntity.setDeliverMobile(userEntity.getMobile());
        orderDetailService.updateById(orderDetailEntity);
        NewsEntity newsEntity = new NewsEntity();
        newsEntity.setMessage("你的订单已被骑手接单");
        newsEntity.setReceiveId(orderDetailEntity.getUserId());
        newsService.save(newsEntity);
        return R.ok();
    }

    @RequestMapping("/complete/{id}")
    public R complete(@PathVariable Integer id, HttpSession httpSession) {

        OrderDetailEntity orderDetailEntity = orderDetailService.getById(id);
//        UserEntity user = (UserEntity) httpSession.getAttribute("user");
//        if (!user.getId().equals(orderDetailEntity.getDeliverId()))
//            return R.error(402, "身份认证不通过");
        orderDetailEntity.setCompletestatus("已完成");
        orderDetailService.updateById(orderDetailEntity);
        return R.ok();
    }
}
