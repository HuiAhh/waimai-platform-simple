package com.finaltest.waimai.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.common.utils.PageUtils;
import com.common.utils.R;
import com.finaltest.waimai.entity.PromoteEntity;
import com.finaltest.waimai.service.PromoteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.List;
import java.util.Map;



/**
 * 
 *
 * @author qianchunjiang
 * @date 2020-11-08 17:30:05
 */
@RestController
@RequestMapping("waimai/promote")
public class PromoteController {
    @Autowired
    private PromoteService promoteService;

    /**
     * 列表
     */
    @RequestMapping("/list")
   // @RequiresPermissions("waimai:promote:list")
    public R list(){

        try {
            List<PromoteEntity> list = promoteService.list(new QueryWrapper<PromoteEntity>().
                    eq("promote_status", "推广中"));
            return R.ok().put("list", list);
        } catch (Exception e) {
            e.printStackTrace();
        }
       return R.error();
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    //@RequiresPermissions("waimai:promote:info")
    public R info(@PathVariable("id") Integer id){
		PromoteEntity promote = promoteService.getById(id);

        return R.ok().put("promote", promote);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    //@RequiresPermissions("waimai:promote:save")
    public R save(@RequestBody PromoteEntity promote){
		promoteService.save(promote);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    //@RequiresPermissions("waimai:promote:update")
    public R update(@RequestBody PromoteEntity promote){
		promoteService.updateById(promote);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    //@RequiresPermissions("waimai:promote:delete")
    public R delete(@RequestBody Integer[] ids){
		promoteService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
