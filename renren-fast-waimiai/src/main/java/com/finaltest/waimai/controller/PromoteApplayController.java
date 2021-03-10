package com.finaltest.waimai.controller;

import com.common.utils.PageUtils;
import com.common.utils.R;
import com.finaltest.waimai.entity.PromoteApplayEntity;
import com.finaltest.waimai.service.PromoteApplayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.Map;



/**
 * 
 *
 * @author qianchunjiang
 * @date 2020-11-08 17:30:05
 */
@RestController
@RequestMapping("waimai/promoteapplay")
public class PromoteApplayController {
    @Autowired
    private PromoteApplayService promoteApplayService;

    /**
     * 列表
     */
    @RequestMapping("/list")
   // @RequiresPermissions("waimai:promoteapplay:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = promoteApplayService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    //@RequiresPermissions("waimai:promoteapplay:info")
    public R info(@PathVariable("id") Integer id){
		PromoteApplayEntity promoteApplay = promoteApplayService.getById(id);

        return R.ok().put("promoteApplay", promoteApplay);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    //@RequiresPermissions("waimai:promoteapplay:save")
    public R save(@RequestBody PromoteApplayEntity promoteApplay){
		promoteApplayService.save(promoteApplay);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    //@RequiresPermissions("waimai:promoteapplay:update")
    public R update(@RequestBody PromoteApplayEntity promoteApplay){
		promoteApplayService.updateById(promoteApplay);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    //@RequiresPermissions("waimai:promoteapplay:delete")
    public R delete(@RequestBody Integer[] ids){
		promoteApplayService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
