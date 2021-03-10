package com.finaltest.waimai.controller;

import java.util.Arrays;
import java.util.Map;


import com.alibaba.druid.sql.ast.statement.SQLColumnDefinition;
import com.common.valid.AddGroup;
import com.common.valid.UpdateGroup;
import com.finaltest.waimai.entity.OrderDetailEntity;
import com.finaltest.waimai.entity.OrderRefundEntity;
import com.finaltest.waimai.entity.RegisterEntity;
import com.finaltest.waimai.service.OrderDetailService;
import com.finaltest.waimai.service.OrderRefundService;
import com.finaltest.waimai.service.RegisterService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.ibatis.annotations.Update;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import com.finaltest.waimai.entity.UserEntity;
import com.finaltest.waimai.service.UserService;
import com.common.utils.PageUtils;
import com.common.utils.R;


/**
 * 用户登录表
 *
 * @author qianchunjiang
 * @date 2020-10-28 23:03:41
 */
@RestController
//@Api("用户")
@RequestMapping("waimai/user")
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    OrderRefundService orderRefundService;
    @Autowired
    OrderDetailService orderDetailService;
    @Autowired
    RegisterService registerService;

    @ApiOperation("用户申请退款")
    @RequestMapping(value = "refund", method = RequestMethod.POST)
    public R refund(@RequestBody OrderRefundEntity orderRefundEntity) {
        OrderDetailEntity order = orderDetailService.getById(orderRefundEntity.getOrderId());
        if (order == null)
            return R.error();
        orderRefundEntity.setCompletestatus(0);
        orderRefundEntity.setPayMoney(order.getTotalMoney());
        orderRefundService.save(orderRefundEntity);
        return R.ok();
    }

    @ApiOperation("用户注册")
    @RequestMapping(value = "register", method = RequestMethod.POST)
    public R refund(@RequestBody UserEntity userEntity) {
        try {
            Integer identity = userEntity.getIdentity();
            BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
            userEntity.setPassword(passwordEncoder.encode(userEntity.getPassword()));
            if (identity == 0)
                userService.save(userEntity);
            else {
                userEntity.setIdentity(0);


                userService.save(userEntity);
                RegisterEntity registerEntity = new RegisterEntity();
                registerEntity.setRegisterstatus("申请中");
                registerEntity.setGender(userEntity.getGender());
                registerEntity.setIdentity(identity);
                registerEntity.setTruename(userEntity.getTruename());
                registerEntity.setUsername(userEntity.getUsername());
                registerEntity.setMobile(userEntity.getMobile());
                registerEntity.setPassword(userEntity.getPassword());
                registerService.save(registerEntity);

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return R.ok();

    }


    /**
     * 列表
     */
    @RequestMapping("/list")

    public R list(@RequestParam Map<String, Object> params) {
        PageUtils page = userService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")

    public R info(@PathVariable("id") Integer id) {
        UserEntity user = userService.getById(id);

        return R.ok().put("user", user);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")

    public R save(@Validated(AddGroup.class) @RequestBody UserEntity user) {
        userService.save(user);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")

    public R update(@Validated(UpdateGroup.class) @RequestBody UserEntity user) {
        userService.updateById(user);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")

    public R delete(@RequestBody Integer[] ids) {
        userService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
