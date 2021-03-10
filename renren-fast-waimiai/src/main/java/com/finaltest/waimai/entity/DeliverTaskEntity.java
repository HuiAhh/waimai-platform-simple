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
 * 订单配送表
 * 
 * @author qianchunjiang
 * @date 2020-10-28 23:03:42
 */
@Data
@TableName("deliver_task")
public class DeliverTaskEntity implements Serializable {
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
	 * 送餐员ID
	 */
	private Integer deliverId;
	/**
	 * 状态
	 */

	private Integer completestatus;
	/**
	 * 配送费
	 */
	private double sendCost;
	/**
	 * 加入时间
	 */
	@TableField(fill = FieldFill.INSERT)
	private Date gmtCreate;
	/**
	 *
	 */
	@TableField(fill = FieldFill.INSERT_UPDATE)
	private Date gmtModified;
}
