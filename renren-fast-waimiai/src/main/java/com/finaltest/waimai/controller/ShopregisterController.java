package com.finaltest.waimai.controller;

import java.util.Arrays;
import java.util.Map;


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

import com.finaltest.waimai.entity.ShopregisterEntity;
import com.finaltest.waimai.service.ShopregisterService;
import com.common.utils.PageUtils;
import com.common.utils.R;



/**
 * 
 *
 * @author qianchunjiang

 * @date 2020-10-28 23:03:42
 */
@RestController
@RequestMapping("waimai/shopregister")
public class ShopregisterController {
    @Autowired
    private ShopregisterService shopregisterService;

    /**
     * 列表
     */
    @RequestMapping("/list")

    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = shopregisterService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{shopregisterId}")

    public R info(@PathVariable("shopregisterId") Integer shopregisterId){
		ShopregisterEntity shopregister = shopregisterService.getById(shopregisterId);

        return R.ok().put("shopregister", shopregister);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")

    public R save(@Validated(AddGroup.class) @RequestBody ShopregisterEntity shopregister){
		shopregisterService.save(shopregister);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")

    public R update(@Validated(UpdateGroup.class)@RequestBody ShopregisterEntity shopregister){
		shopregisterService.updateById(shopregister);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")

    public R delete(@RequestBody Integer[] shopregisterIds){
		shopregisterService.removeByIds(Arrays.asList(shopregisterIds));

        return R.ok();
    }

}
