package com.finaltest.waimai.dao;

import com.finaltest.waimai.entity.UserEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

/**
 * 用户登录表
 * 
 * @author qianchunjiang
 * @date 2020-10-28 23:03:41
 */
@Mapper
@Component
public interface UserDao extends BaseMapper<UserEntity>  {
	
}
