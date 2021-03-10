package io.renren.modules.waimai.entity;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * 订单--评论
 * 
 * @author qianchunjiang
 * @date 2020-10-28 23:03:42
 */
@Data
@TableName("order_comment")
public class OrderCommentEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 主键
	 */
	@TableId
	private Integer id;
	/**
	 * 订单ID
	 */
	private String orderId;
	/**
	 * 用户ID
	 */
	private Integer userId;
	/**
	 * 评论内容
	 */
	private String content;
	/**
	 * 评论图片
	 */
	private String images;
	/**
	 * 回复的ID路径:1/2/3/5
	 */
	private String path;
	/**
	 * 点赞次数
	 */
	private Integer numPraise;
	/**
	 * 状态
	 */
	@TableLogic
	private Integer status;
	/**
	 * 引用的评论ID
	 */
	private Integer reCommentId;
	/**
	 * 点赞用户的IDs
	 */
	private String likeIds;
	/**
	 * 
	 */
	@TableField(fill = FieldFill.INSERT)
	private Date gmtCreate;
	/**
	 *
	 */
	@TableField(fill = FieldFill.INSERT_UPDATE)
	private Date gmtModified;
}
