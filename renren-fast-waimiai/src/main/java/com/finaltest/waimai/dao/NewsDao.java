package com.finaltest.waimai.dao;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.finaltest.waimai.entity.NewsEntity;
import org.apache.ibatis.annotations.Mapper;

/**
 * 
 * 
 * @author qianchunjiang
 * @date 2020-11-03 15:51:49
 */
@Mapper
public interface NewsDao extends BaseMapper<NewsEntity> {
	
}
