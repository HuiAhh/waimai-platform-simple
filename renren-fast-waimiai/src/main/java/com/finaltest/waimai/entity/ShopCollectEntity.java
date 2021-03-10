package com.finaltest.waimai.entity;

import com.baomidou.mybatisplus.annotation.*;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 店铺收藏表
 * 
 * @author qianchunjiang
 * @date 2020-10-28 23:03:42
 */
@Data
@TableName("shop_collect")
public class ShopCollectEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 主键
	 */
	@TableId
	private Integer id;
	/**
	 * 店铺ID
	 */
	private Integer shopId;
	/**
	 * 用户ID
	 */
	private Integer userId;
	/**
	 * 收藏时间
	 */
	@TableField(fill = FieldFill.INSERT)
	private Date gmtCreate;
	/**
	 *
	 */
	@TableField(fill = FieldFill.INSERT_UPDATE)
	private Date gmtModified;
	/**
	 * 
	 */

	/**
	 * 
	 */
	@TableLogic
	private Integer isDeleted;

}
