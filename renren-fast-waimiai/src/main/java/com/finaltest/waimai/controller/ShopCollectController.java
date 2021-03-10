package com.finaltest.waimai.controller;

import java.util.Arrays;
import java.util.List;
import java.util.Map;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import com.finaltest.waimai.entity.ShopCollectEntity;
import com.finaltest.waimai.service.ShopCollectService;
import com.common.utils.PageUtils;
import com.common.utils.R;



/**
 * 店铺收藏表
 *
 * @author qianchunjiang

 * @date 2020-10-28 23:03:42
 */
@RestController
@RequestMapping("waimai/collect")
public class ShopCollectController {
    @Autowired
    private ShopCollectService shopCollectService;

    /**
     * 列表
     */
    @RequestMapping("/list")
//    @PreAuthorize("hasAnyAuthority('shop','user','deliver')")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = shopCollectService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping(value = "/{id}",method = RequestMethod.GET)
//    @PreAuthorize("hasAnyAuthority('shop','user','deliver')")
    public R info(@PathVariable("id") Integer id){
        List<ShopCollectEntity> shopCollect = shopCollectService.list(new QueryWrapper<ShopCollectEntity>().eq("user_id", id));

        return R.ok().put("list", shopCollect);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
//    @PreAuthorize("hasAnyAuthority('shop','user','deliver')")
    public R save(@RequestBody ShopCollectEntity shopCollect){
		shopCollectService.save(shopCollect);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
//    @PreAuthorize("hasAnyAuthority('shop','user','deliver')")
    public R update(@RequestBody ShopCollectEntity shopCollect){
		shopCollectService.updateById(shopCollect);

        return R.ok();
    }

    /**
     * 删除
     */
//    @PreAuthorize("hasAnyAuthority('shop','user','deliver')")
    @RequestMapping("/delete/{id}")

    public R delete(@PathVariable("id") Integer id){
		shopCollectService.removeById(id);

        return R.ok();
    }

}
