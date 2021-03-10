package io.renren.modules.waimai.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import io.renren.modules.waimai.entity.PersistentLoginsEntity;
import org.apache.ibatis.annotations.Mapper;

/**
 * 
 * 
 * @author qianchunjiang
 * @date 2020-10-28 23:03:42
 */
@Mapper
public interface PersistentLoginsDao extends BaseMapper<PersistentLoginsEntity> {
	
}
