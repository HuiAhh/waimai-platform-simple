package com.finaltest.waimai.controller;

import java.util.Arrays;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.finaltest.waimai.entity.PersistentLoginsEntity;
import com.finaltest.waimai.service.PersistentLoginsService;
import com.common.utils.PageUtils;
import com.common.utils.R;



/**
 * 
 *
 * @author qianchunjiang

 * @date 2020-10-28 23:03:42
 */
@RestController
@RequestMapping("waimai/persistentlogins")
public class PersistentLoginsController {
    @Autowired
    private PersistentLoginsService persistentLoginsService;

    /**
     * 列表
     */
    @RequestMapping("/list")

    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = persistentLoginsService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{series}")

    public R info(@PathVariable("series") String series){
		PersistentLoginsEntity persistentLogins = persistentLoginsService.getById(series);

        return R.ok().put("persistentLogins", persistentLogins);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")

    public R save(@RequestBody PersistentLoginsEntity persistentLogins){
		persistentLoginsService.save(persistentLogins);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")

    public R update(@RequestBody PersistentLoginsEntity persistentLogins){
		persistentLoginsService.updateById(persistentLogins);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")

    public R delete(@RequestBody String[] seriess){
		persistentLoginsService.removeByIds(Arrays.asList(seriess));

        return R.ok();
    }

}
