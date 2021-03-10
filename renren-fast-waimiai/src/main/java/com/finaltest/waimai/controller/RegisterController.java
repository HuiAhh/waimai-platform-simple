package com.finaltest.waimai.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.common.utils.PageUtils;
import com.common.utils.R;
import com.finaltest.waimai.entity.NewsEntity;
import com.finaltest.waimai.entity.RegisterEntity;
import com.finaltest.waimai.entity.UserEntity;
import com.finaltest.waimai.service.NewsService;
import com.finaltest.waimai.service.RegisterService;
import com.finaltest.waimai.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.Map;


/**
 * @author qianchunjiang
 * @date 2020-11-03 18:41:08
 */
@RestController
@RequestMapping("waimai/register")
public class RegisterController {
    @Autowired
    private RegisterService registerService;
    @Autowired
    private UserService userService;
    @Autowired
    private NewsService newsService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    // @RequiresPermissions("waimai:register:list")
    public R list(@RequestParam Map<String, Object> params) {
        PageUtils page = registerService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    //@RequiresPermissions("waimai:register:info")
    public R info(@PathVariable("id") Integer id) {
        RegisterEntity register = registerService.getById(id);

        return R.ok().put("register", register);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    //@RequiresPermissions("waimai:register:save")
    public R save(@RequestBody RegisterEntity register) {
        registerService.save(register);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    //@RequiresPermissions("waimai:register:update")
    public R update(@RequestBody RegisterEntity register) {
        registerService.updateById(register);

        return R.ok();
    }

    @RequestMapping("/approve")
    //@RequiresPermissions("waimai:register:delete")
    public R approve(@RequestBody Integer[] ids) {
        for (Integer id : ids) {
            RegisterEntity registerEntity = registerService.getById(id);
            registerEntity.setRegisterstatus("已通过");
            registerService.updateById(registerEntity);
            UserEntity userEntity = userService.getOne(new QueryWrapper<UserEntity>().eq("mobile", registerEntity.getMobile()));
            if (userEntity != null) {
                NewsEntity newsEntity = new NewsEntity();
                newsEntity.setReceiveId(userEntity.getId());
                if (registerEntity.getIdentity() == 1)
                    newsEntity.setMessage("您的骑手注册申请已通过");
                if (registerEntity.getIdentity() == 2)
                    newsEntity.setMessage("您的商家注册申请已通过");
                newsService.save(newsEntity);
                userEntity.setIdentity(registerEntity.getIdentity());
                userService.updateById(userEntity);
            }
        }

        return R.ok();
    }

    @RequestMapping("/delete")
    //@RequiresPermissions("waimai:register:delete")
    public R delete(@RequestBody Integer[] ids) {
        for (Integer id : ids) {
            RegisterEntity registerEntity = registerService.getById(id);
            registerEntity.setRegisterstatus("未通过");
            registerService.updateById(registerEntity);
            UserEntity userEntity = userService.getOne(new QueryWrapper<UserEntity>().eq("mobile", registerEntity.getMobile()));
            NewsEntity newsEntity = new NewsEntity();
            newsEntity.setReceiveId(userEntity.getId());
            if (registerEntity.getIdentity() == 1)
                newsEntity.setMessage("您的骑手注册申请未通过");
            if (registerEntity.getIdentity() == 2)
                newsEntity.setMessage("您的商家注册申请未通过");
            newsService.save(newsEntity);
        }

        return R.ok();
    }

}
