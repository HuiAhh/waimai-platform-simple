package com.finaltest.waimai.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.math.BigDecimal;
import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 订单--退款处理
 * 
 * @author qianchunjiang
 * @date 2020-10-28 23:03:42
 */
@Data
@TableName("order_refund")
public class OrderRefundEntity implements Serializable {
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
	 * 用户姓名
	 */
	private String username;
	/**
	 * 需要退回的款项
	 */
	private double payMoney;
	/**
	 * 退款原因
	 */
	private String refundReason;
	/**
	 * 协商的需要扣除的手续费
	 */
	private double serviceCost;
	/**
	 * 
	 */

	/**
	 * 状态，0：等待处理 1：商家已退款 2：商家不同意退款
	 */
	private Integer completestatus;
	/**
	 * 卖家处理时间
	 */
	@TableField(fill = FieldFill.INSERT)
	private Date gmtCreate;
	/**
	 *
	 */
	@TableField(fill = FieldFill.INSERT_UPDATE)
	private Date gmtModified;

}
