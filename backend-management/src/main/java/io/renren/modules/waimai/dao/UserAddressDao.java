package io.renren.modules.waimai.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import io.renren.modules.waimai.entity.UserAddressEntity;
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
