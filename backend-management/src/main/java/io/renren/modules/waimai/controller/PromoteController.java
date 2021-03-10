package io.renren.modules.waimai.controller;

import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;
import io.renren.modules.waimai.entity.PromoteEntity;
import io.renren.modules.waimai.service.PromoteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.Date;
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
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = promoteService.queryPage(params);

        return R.ok().put("page", page);
    }

    @RequestMapping("/start")
    // @RequiresPermissions("waimai:promote:list")
    public R list( @RequestBody Integer[] ids){
        for (Integer id : ids) {
            PromoteEntity promoteEntity = promoteService.getById(id);
            promoteEntity.setPromoteStatus("推广中");
            Date date=new Date();
            promoteEntity.setStartPromote(date);
            promoteService.updateById(promoteEntity);
        }

        return R.ok();
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
