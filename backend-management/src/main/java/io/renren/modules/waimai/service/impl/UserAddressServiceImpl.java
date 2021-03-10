package io.renren.modules.waimai.service.impl;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;
import io.renren.modules.waimai.dao.UserAddressDao;
import io.renren.modules.waimai.entity.UserAddressEntity;
import io.renren.modules.waimai.service.UserAddressService;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service("userAddressService")
public class UserAddressServiceImpl extends ServiceImpl<UserAddressDao, UserAddressEntity> implements UserAddressService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        String s= (String) params.get("key");
        IPage<UserAddressEntity> page = this.page(
                new Query<UserAddressEntity>().getPage(params),
                new QueryWrapper<UserAddressEntity>().like("id",s).or()
                .like("username",s).or().like("adress",s).or().like("mobile",s)
        );

        return new PageUtils(page);
    }

}