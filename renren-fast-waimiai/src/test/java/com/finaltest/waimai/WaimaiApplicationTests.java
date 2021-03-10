package com.finaltest.waimai;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.finaltest.waimai.dao.FoodCategoryDao;
import com.finaltest.waimai.dao.FoodDao;
import com.finaltest.waimai.dao.ShopCategoryDao;
import com.finaltest.waimai.entity.FoodCategoryEntity;
import com.finaltest.waimai.entity.FoodEntity;
import com.finaltest.waimai.entity.ShopCategoryEntity;
import com.finaltest.waimai.entity.UserEntity;
import com.finaltest.waimai.service.FoodCategoryService;
import com.finaltest.waimai.service.FoodService;
import com.finaltest.waimai.service.ShopCategoryService;
import com.finaltest.waimai.service.UserService;
//import com.sun.org.apache.bcel.internal.generic.NEW;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import java.util.List;

@SpringBootTest
class WaimaiApplicationTests {
    @Autowired
    private UserService userService;
    @Autowired
    FoodCategoryService foodCategoryService;
    @Autowired
    FoodCategoryDao foodCategoryDao;
    @Autowired
    ShopCategoryService shopCategoryDao;
    @Autowired
    FoodService foodService;
    @Test
    void contextLoads() {
        QueryWrapper<UserEntity> queryWrapper=new QueryWrapper();
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        UserEntity userEntity = userService.getBaseMapper().selectById(1);
        userEntity.setPassword(passwordEncoder.encode(userEntity.getPassword()));
        userService.getBaseMapper().update(userEntity,null);
    }
    @Test
    void delete(){
        ShopCategoryEntity shopCategoryEntity=new ShopCategoryEntity();

    }
    @Test
     void insert(){
//        ShopCategoryEntity shopCategoryEntity=new ShopCategoryEntity();
        foodService.removeById(1);

    }
}
