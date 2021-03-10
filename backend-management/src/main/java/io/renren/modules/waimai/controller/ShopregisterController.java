package io.renren.modules.waimai.controller;


import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;
import io.renren.modules.waimai.entity.ShopInfoEntity;
import io.renren.modules.waimai.entity.ShopregisterEntity;
import io.renren.modules.waimai.entity.UsersEntity;
import io.renren.modules.waimai.service.ShopInfoService;
import io.renren.modules.waimai.service.ShopregisterService;
import io.renren.modules.waimai.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

/**
 * 
 *
 * @author qianchunjiang

 * @date 2020-10-28 23:03:42
 */
@RestController
@RequestMapping("waimai/shopregister")
public class ShopregisterController {
    @Autowired
    private ShopregisterService shopregisterService;
    @Autowired
    private ShopInfoService shopInfoService;
    @Autowired
    private UsersService userService;

    /**
     * 列表
     */
    @RequestMapping("approve")
    public R approve(@RequestBody Integer[] shopregisterIds){
        for (Integer id : shopregisterIds) {
            ShopregisterEntity shopregisterEntity = shopregisterService.getById(id);
            Integer shopownerId = shopregisterEntity.getShopownerId();
            UsersEntity Shop = userService.getById(shopownerId);
            if (Shop.getIdentity()!=2)
                return R.error("不是商家无权限开店");
            shopregisterEntity.setRegisterstatus("已通过");

            ShopInfoEntity shopInfoEntity=new ShopInfoEntity();
            shopInfoEntity.setAddress(shopregisterEntity.getAdress());
            shopInfoEntity.setCateid(shopregisterEntity.getCateid());
            shopInfoEntity.setMobile(Shop.getMobile());

            shopInfoEntity.setShopname(shopregisterEntity.getShopname());
            shopInfoEntity.setShopownerId(shopregisterEntity.getShopownerId());
            shopInfoEntity.setShowStatus(0);
            shopregisterService.updateById(shopregisterEntity);
            shopInfoService.save(shopInfoEntity);
        }
        return R.ok();
    }
    @RequestMapping("/list")

    public R list(@RequestParam Map<String, Object> params){

        PageUtils page = shopregisterService.queryPage(params);

        return R.ok().put("page", page);
    }
    @RequestMapping("applaylist")
    public  R applatlist(Map<String, Object> params){
        PageUtils page = shopregisterService.applaylist(params);
        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{shopregisterId}")

    public R info(@PathVariable("shopregisterId") Integer shopregisterId){
		ShopregisterEntity shopregister = shopregisterService.getById(shopregisterId);

        return R.ok().put("shopregister", shopregister);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")

    public R save( @RequestBody ShopregisterEntity shopregister){
		shopregisterService.save(shopregister);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")

    public R update(@RequestBody ShopregisterEntity shopregister){
		shopregisterService.updateById(shopregister);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/disapprove")

    public R delete(@RequestBody Integer[] shopregisterIds){
        for (Integer shopregisterId : shopregisterIds) {
            ShopregisterEntity s = shopregisterService.getById(shopregisterId);
            s.setRegisterstatus("审核未通过");
            shopregisterService.updateById(s);

        }

        return R.ok();
    }

}
