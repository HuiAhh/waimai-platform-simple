package com.finaltest.waimai.dao;

import com.finaltest.waimai.entity.UserAddressEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 用户配送地址
 * 
 * @author qianchunjiang
 * @date 2020-10-28 23:03:42
 */
@Mapper
public interface UserAddressDao extends BaseMapper<UserAddressEntity> {
	
}
