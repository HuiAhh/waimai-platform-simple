package com.finaltest.waimai.controller;

import java.util.Arrays;
import java.util.List;
import java.util.Map;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.common.valid.AddGroup;
import com.common.valid.UpdateGroup;
import org.apache.ibatis.annotations.Update;
import org.aspectj.weaver.ast.Var;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import com.finaltest.waimai.entity.UserAddressEntity;
import com.finaltest.waimai.service.UserAddressService;
import com.common.utils.PageUtils;
import com.common.utils.R;



/**
 * 用户配送地址
 *
 * @author qianchunjiang

 * @date 2020-10-28 23:03:42
 */
@RestController
@RequestMapping("waimai/useraddress")
public class UserAddressController {
    @Autowired
    private UserAddressService userAddressService;

    /**
     * 列表
     */
    @RequestMapping("/list")

    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = userAddressService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping(value = "/{id}",method = RequestMethod.GET)

    public R info(@PathVariable("id") Integer id){
        List<UserAddressEntity> list= userAddressService.list(new QueryWrapper<UserAddressEntity>().eq("user_id", id));
        return R.ok().put("list", list);
    }

    /**
     * 保存
     */
    @RequestMapping(value = "/save",method = RequestMethod.POST)

    public R save(@Validated(AddGroup.class) @RequestBody UserAddressEntity userAddress){
		userAddressService.save(userAddress);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping(value = "/update",method = RequestMethod.PUT)

    public R update(@RequestBody UserAddressEntity userAddress){
		userAddressService.updateById(userAddress);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping(value = "/{id}",method = RequestMethod.DELETE)

    public R delete(@PathVariable("id") Integer id){
		userAddressService.removeById(id);

        return R.ok();
    }

}
