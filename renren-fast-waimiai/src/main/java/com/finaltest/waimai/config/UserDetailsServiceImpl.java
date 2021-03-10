package com.finaltest.waimai.config;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;

import com.finaltest.waimai.dao.UserDao;
import com.finaltest.waimai.entity.UserEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 钱春江
 * @create 2020-10-2020/10/24
 */
@Service("userDetailsService")
public class UserDetailsServiceImpl implements UserDetailsService {

    @Autowired
    private UserDao userDao;
    @Override
    public UserDetails loadUserByUsername(String account) throws UsernameNotFoundException {

        QueryWrapper<UserEntity> wrapper=new QueryWrapper<>();
        wrapper.eq("mobile",account);
       UserEntity userEntity=userDao.selectOne(wrapper);
        System.out.println(userEntity);


        if (userEntity==null){
            throw new UsernameNotFoundException("用户名不存在");
        }
        Integer identity = userEntity.getIdentity();
        if (identity==1) {
            List<GrantedAuthority> authorities=AuthorityUtils.commaSeparatedStringToAuthorityList("deliver");
            return new User(userEntity.getMobile(),userEntity.getPassword(),authorities);

        } else if(identity==2) {
            List<GrantedAuthority> authorities=AuthorityUtils.commaSeparatedStringToAuthorityList("shop");
            return new User(userEntity.getMobile(),userEntity.getPassword(),authorities);

        } else {
            List<GrantedAuthority> authorities=AuthorityUtils.commaSeparatedStringToAuthorityList("user");
            return new User(userEntity.getMobile(),userEntity.getPassword(),authorities);

        }


    }
}
