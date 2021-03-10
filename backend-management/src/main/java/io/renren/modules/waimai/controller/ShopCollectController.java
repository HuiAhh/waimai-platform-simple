package io.renren.modules.waimai.controller;


import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;
import io.renren.modules.waimai.entity.ShopCollectEntity;
import io.renren.modules.waimai.service.ShopCollectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.Map;


/**
 * 店铺收藏表
 *
 * @author qianchunjiang

 * @date 2020-10-28 23:03:42
 */
@RestController
@RequestMapping("waimai/shopcollect")
public class ShopCollectController {
    @Autowired
    private ShopCollectService shopCollectService;

    /**
     * 列表
     */
    @RequestMapping("/list")

    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = shopCollectService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")

    public R info(@PathVariable("id") Integer id){
		ShopCollectEntity shopCollect = shopCollectService.getById(id);

        return R.ok().put("shopCollect", shopCollect);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")

    public R save(@RequestBody ShopCollectEntity shopCollect){
		shopCollectService.save(shopCollect);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")

    public R update(@RequestBody ShopCollectEntity shopCollect){
		shopCollectService.updateById(shopCollect);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")

    public R delete(@RequestBody Integer[] ids){
		shopCollectService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
