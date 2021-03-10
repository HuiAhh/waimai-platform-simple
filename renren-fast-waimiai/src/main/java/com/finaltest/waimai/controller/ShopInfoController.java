package com.finaltest.waimai.controller;

import java.util.Arrays;
import java.util.List;
import java.util.Map;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.common.valid.AddGroup;
import com.common.valid.UpdateGroup;
import com.finaltest.waimai.entity.UserEntity;
import org.apache.ibatis.annotations.Update;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import com.finaltest.waimai.entity.ShopInfoEntity;
import com.finaltest.waimai.service.ShopInfoService;
import com.common.utils.PageUtils;
import com.common.utils.R;

import javax.servlet.http.HttpSession;


/**
 * 商铺信息表
 *
 * @author qianchunjiang
 * @date 2020-10-28 23:03:42
 */
@RestController
@RequestMapping("waimai/shopinfo")
public class ShopInfoController {
    @Autowired
    private ShopInfoService shopInfoService;

    /**
     * 列表
     */
//    @PreAuthorize("hasAuthority('shop')")
    @RequestMapping(value = "/list/{shopownerid}", method = RequestMethod.GET)

    public R list(@PathVariable("shopownerid") Integer id,HttpSession httpSession) {
//        UserEntity user = (UserEntity) httpSession.getAttribute("user");
//        if (user == null) return R.error(402, "未登录，请登录");
//
//        if (!user.getId().equals(id))
//            return R.error(402,"身份认证不通过");
        List<ShopInfoEntity> shoplist = shopInfoService.list(new QueryWrapper<ShopInfoEntity>().eq("shopowner_id", id));

        return R.ok().put("list", shoplist);
    }
//    @PreAuthorize("hasAuthority('shop')")
    @RequestMapping(value = "/updatestatus/{shopid}", method = RequestMethod.GET)
    public R updatestatus(@PathVariable("shopid") Integer shopid, HttpSession httpSession) {
        ShopInfoEntity shop = shopInfoService.getById(shopid);
        if (shop==null)
            return R.error(400,"非法店铺id，该id不存在");
//        UserEntity user = (UserEntity) httpSession.getAttribute("user");
//        if (!user.getId().equals(shop.getShopownerId()))
//            return R.error(402,"身份认证不通过");
        int showStatus = shop.getShowStatus();
        if (showStatus==0)
            shop.setShowStatus(1);
        else
            shop.setShowStatus(0);
        shopInfoService.updateById(shop);
        return R.ok();
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")

    public R info(@PathVariable("id") Integer id) {
        ShopInfoEntity shopInfo = shopInfoService.getById(id);

        return R.ok().put("shopInfo", shopInfo);
    }

    /**
     * 保存
     */
//    @PreAuthorize("hasAuthority('shop')")
    @RequestMapping("/save")

    public R save(@Validated(AddGroup.class) @RequestBody ShopInfoEntity shopInfo) {
        shopInfoService.save(shopInfo);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")

    public R update( @RequestBody ShopInfoEntity shopInfo,HttpSession httpSession) {
//        UserEntity user = (UserEntity) httpSession.getAttribute("user");
//        if (!user.getId().equals(shopInfo.getShopownerId()))
//            return R.error(402,"身份认证不通过");
        shopInfoService.updateById(shopInfo);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")

    public R delete(@RequestBody Integer[] ids) {
        shopInfoService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
