package io.renren.modules.waimai.controller;


import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;
import io.renren.modules.waimai.entity.DeliverTaskEntity;
import io.renren.modules.waimai.service.DeliverTaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.Map;

/**
 * 订单配送表
 *
 * @author qianchunjiang

 * @date 2020-10-28 23:03:42
 */
@RestController
@RequestMapping("waimai/delivertask")
public class DeliverTaskController {
    @Autowired
    private DeliverTaskService deliverTaskService;

    /**
     * 列表
     */
    @RequestMapping("/list")

    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = deliverTaskService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")

    public R info(@PathVariable("id") Integer id){
		DeliverTaskEntity deliverTask = deliverTaskService.getById(id);

        return R.ok().put("deliverTask", deliverTask);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")

    public R save(@RequestBody DeliverTaskEntity deliverTask){
		deliverTaskService.save(deliverTask);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")

    public R update(@RequestBody DeliverTaskEntity deliverTask){
		deliverTaskService.updateById(deliverTask);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")

    public R delete(@RequestBody Integer[] ids){
		deliverTaskService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
