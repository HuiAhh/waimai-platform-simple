package io.renren.modules.waimai.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import io.renren.modules.waimai.entity.UsersEntity;
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
public interface UsersDao extends BaseMapper<UsersEntity>  {
	
}
