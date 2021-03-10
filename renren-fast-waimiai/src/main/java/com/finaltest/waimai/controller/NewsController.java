package com.finaltest.waimai.controller;

import com.common.utils.PageUtils;
import com.common.utils.R;
import com.finaltest.waimai.entity.NewsEntity;
import com.finaltest.waimai.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.Map;



/**
 * 
 *
 * @author qianchunjiang
 * @date 2020-11-03 15:51:49
 */
@RestController
@RequestMapping("waimai/news")
public class NewsController {
    @Autowired
    private NewsService newsService;

    /**
     * 列表
     */
    @RequestMapping("/list")
   // @RequiresPermissions("waimai:news:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = newsService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{message}")
    //@RequiresPermissions("waimai:news:info")
    public R info(@PathVariable("message") String message){
		NewsEntity news = newsService.getById(message);

        return R.ok().put("news", news);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    //@RequiresPermissions("waimai:news:save")
    public R save(@RequestBody NewsEntity news){
		newsService.save(news);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    //@RequiresPermissions("waimai:news:update")
    public R update(@RequestBody NewsEntity news){
		newsService.updateById(news);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    //@RequiresPermissions("waimai:news:delete")
    public R delete(@RequestBody String[] messages){
		newsService.removeByIds(Arrays.asList(messages));

        return R.ok();
    }

}
