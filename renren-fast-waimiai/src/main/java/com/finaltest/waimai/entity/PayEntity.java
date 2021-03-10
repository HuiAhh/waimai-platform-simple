package com.finaltest.waimai.entity;

import com.baomidou.mybatisplus.annotation.*;

import java.math.BigDecimal;
import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 订单支付表
 * 
 * @author qianchunjiang
 * @date 2020-10-28 23:03:42
 */
@Data
@TableName("pay")
public class PayEntity implements Serializable {
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
	 * 商店ID
	 */
	private Integer shopId;
	/**
	 * 支付总数
	 */
	private double totalMoney;

	/**
	 * 状态
	 */
	private String completestatus;
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
	/**
	 * 
	 */
	@TableLogic
	private Integer isDeleted;

}
