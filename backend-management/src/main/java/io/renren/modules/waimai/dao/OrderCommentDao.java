package io.renren.modules.waimai.dao;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import io.renren.modules.waimai.entity.OrderCommentEntity;
import org.apache.ibatis.annotations.Mapper;

/**
 * 订单--评论
 * 
 * @author qianchunjiang
 * @date 2020-10-28 23:03:42
 */
@Mapper
public interface OrderCommentDao extends BaseMapper<OrderCommentEntity> {
	
}
