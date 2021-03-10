package com.finaltest.waimai.controller;

import java.util.Arrays;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.finaltest.waimai.entity.PayEntity;
import com.finaltest.waimai.service.PayService;
import com.common.utils.PageUtils;
import com.common.utils.R;



/**
 * 订单支付表
 *
 * @author qianchunjiang

 * @date 2020-10-28 23:03:42
 */
@Transactional
@RestController
@RequestMapping("waimai/pay")
public class PayController {
    @Autowired
    private PayService payService;

    /**
     * 列表
     */
    @RequestMapping("/list")

    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = payService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")

    public R info(@PathVariable("id") Integer id){
		PayEntity pay = payService.getById(id);

        return R.ok().put("pay", pay);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")

    public R save(@RequestBody PayEntity pay){
		payService.save(pay);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")

    public R update(@RequestBody PayEntity pay){
		payService.updateById(pay);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")

    public R delete(@RequestBody Integer[] ids){
		payService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
