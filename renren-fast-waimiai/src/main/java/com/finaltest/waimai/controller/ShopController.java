package com.finaltest.waimai.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.common.utils.PageUtils;
import com.common.utils.R;
import com.finaltest.waimai.entity.FoodEntity;
import com.finaltest.waimai.entity.OrderDetailEntity;
import com.finaltest.waimai.entity.ShopInfoEntity;
import com.finaltest.waimai.entity.UserEntity;
import com.finaltest.waimai.service.FoodService;
import com.finaltest.waimai.service.OrderDetailService;
import com.finaltest.waimai.service.ShopInfoService;
//import com.sun.org.apache.bcel.internal.generic.IF_ACMPEQ;
import org.aspectj.weaver.ast.Var;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

/**
 * @author 钱春江
 * @create 2020-11-2020/11/2
 */
@RestController
@RequestMapping("waimai/shop")
public class ShopController {
    @Autowired
    private ShopInfoService shopInfoService;
    @Autowired
    FoodService foodService;
    @Autowired
    OrderDetailService orderDetailService;

    @RequestMapping("/query")

    public R list( @RequestParam("cateId") Integer cateId, @RequestParam("shopname") String shopname){
        QueryWrapper<ShopInfoEntity> wrapper = new QueryWrapper<>();
        HashSet<Integer> list1=new HashSet<>();
        if (cateId !=0)
            wrapper.eq("cateId",cateId);

        else if (shopname!=null&&shopname!=""){
            List<FoodEntity> foodEntities = foodService.list(new QueryWrapper<FoodEntity>().like("title", shopname));
            while (!foodEntities.isEmpty()){
                list1.add(foodEntities.get(0).getShopId());
                foodEntities.remove(0);
            }
            wrapper.like("shopname",shopname)
            .or().in("id",list1);
        }
        List<ShopInfoEntity> list = shopInfoService.list(wrapper);
        return R.ok().put("list",list);
    }

    @RequestMapping("/list")

    public R list(){
        List<ShopInfoEntity> list = shopInfoService.list(null);


        return R.ok().put("list", list);
    }
    /**
     * 商家订单列表
     */
//    @PreAuthorize("hasAuthority('shop')")
    @RequestMapping(value = "orderlist/{id}",method = RequestMethod.PUT)
    public R orderlist(@PathVariable("id") Integer id, HttpSession session){
//        UserEntity user = (UserEntity) session.getAttribute("user");
//        if (!user.getId().equals(id))
//            return R.error(402,"身份认证不通过");
        List<OrderDetailEntity> orderDetailEntities = orderDetailService.list(new QueryWrapper<OrderDetailEntity>().eq("shop_id", id));
        return R.ok().put("list",orderDetailEntities);
    }
//    @PreAuthorize("hasAuthority('shop')")
    @RequestMapping(value = "foodlist/{shopid}",method = RequestMethod.GET)
    public R foodlist(@PathVariable("shopid") Integer shopid,HttpSession httpSession){
        ShopInfoEntity shop = shopInfoService.getOne(new QueryWrapper<ShopInfoEntity>().eq("id", shopid));
        if (shop==null)
            return R.error(101,"店铺不存在");
        UserEntity user = (UserEntity) httpSession.getAttribute("user");
//        if (!user.getId().equals(shop.getShopownerId()))
//            return R.error(402,"身份认证不通过");
        List<FoodEntity> foodEntities = foodService.selectAllFood(shopid);
        return R.ok().put("list",foodEntities);
    }
//    @PreAuthorize("hasAuthority('shop')")
    @RequestMapping(value = "up/{foodid}",method = RequestMethod.PUT)
    public R up(@PathVariable("foodid") Integer foodid,HttpSession httpSession){
        FoodEntity foodEntity = foodService.getById(foodid);
        if (foodEntity==null)
            return R.error(101,"商品不存在");
        ShopInfoEntity shop = shopInfoService.getOne(new QueryWrapper<ShopInfoEntity>().eq("id", foodEntity.getShopId()));
        UserEntity user = (UserEntity) httpSession.getAttribute("user");
//        if (!user.getId().equals(shop.getShopownerId()))
//            return R.error(402,"身份认证不通过");
        foodService.updateFoodStatus(foodid,0);
        return R.ok();
    }
//    @PreAuthorize("hasAuthority('shop')")
    @RequestMapping(value = "down/{foodid}",method = RequestMethod.DELETE)
    public R delete(@PathVariable("foodid") Integer foodid,HttpSession httpSession){
        FoodEntity foodEntity = foodService.getById(foodid);
        if (foodEntity==null)
            return R.error(101,"商品不存在");
        ShopInfoEntity shop = shopInfoService.getOne(new QueryWrapper<ShopInfoEntity>().eq("id", foodEntity.getShopId()));
        UserEntity user = (UserEntity) httpSession.getAttribute("user");
//        if (!user.getId().equals(shop.getShopownerId()))
//            return R.error(402,"身份认证不通过");
        foodService.removeById(foodid);
        return R.ok();
    }


}
