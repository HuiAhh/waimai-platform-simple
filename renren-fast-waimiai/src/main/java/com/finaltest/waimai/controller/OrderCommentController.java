package com.finaltest.waimai.controller;

import java.util.Arrays;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.finaltest.waimai.entity.OrderCommentEntity;
import com.finaltest.waimai.service.OrderCommentService;
import com.common.utils.PageUtils;
import com.common.utils.R;



/**
 * 订单--评论
 *
 * @author qianchunjiang

 * @date 2020-10-28 23:03:42
 */
@RestController
@RequestMapping("waimai/ordercomment")
//@PreAuthorize("hasAnyAuthority('shop','user','deliver')")
public class OrderCommentController {
    @Autowired
    private OrderCommentService orderCommentService;

    /**
     * 列表
     */
    @RequestMapping("/list")

    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = orderCommentService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")

    public R info(@PathVariable("id") Integer id){
		OrderCommentEntity orderComment = orderCommentService.getById(id);

        return R.ok().put("orderComment", orderComment);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")

    public R save(@RequestBody OrderCommentEntity orderComment){
		orderCommentService.save(orderComment);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")

    public R update(@RequestBody OrderCommentEntity orderComment){
		orderCommentService.updateById(orderComment);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")

    public R delete(@RequestBody Integer[] ids){
		orderCommentService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
