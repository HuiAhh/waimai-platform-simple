package io.renren.modules.waimai.dao;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import io.renren.modules.waimai.entity.RegisterEntity;
import org.apache.ibatis.annotations.Mapper;

/**
 * 
 * 
 * @author qianchunjiang
 * @date 2020-10-31 08:56:08
 */
@Mapper
public interface RegisterDao extends BaseMapper<RegisterEntity> {
	
}
