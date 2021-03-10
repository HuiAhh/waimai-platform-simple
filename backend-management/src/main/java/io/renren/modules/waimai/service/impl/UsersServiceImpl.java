package io.renren.modules.waimai.service.impl;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;
import io.renren.modules.waimai.dao.UsersDao;
import io.renren.modules.waimai.entity.UsersEntity;
import io.renren.modules.waimai.service.UsersService;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service("userService1")
public class UsersServiceImpl extends ServiceImpl<UsersDao, UsersEntity> implements UsersService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        String s= (String) params.get("key");
        IPage<UsersEntity> page = this.page(
                new Query<UsersEntity>().getPage(params),
                new QueryWrapper<UsersEntity>().like("username",s)
                .or().like("mobile",s).or().like("gender",s).or()
                .like("truename",s)
        );

        return new PageUtils(page);
    }

    @Override
    public PageUtils IdentityPage(Map<String, Object> params, Integer integer) {
        QueryWrapper<UsersEntity> usersEntityQueryWrapper = new QueryWrapper<>();
        usersEntityQueryWrapper.eq("identity",integer);
        IPage<UsersEntity> page = this.page(
                new Query<UsersEntity>().getPage(params),
                usersEntityQueryWrapper
        );
        return new PageUtils(page);
    }

}