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
 * 订单商品详情表
 * 
 * @author qianchunjiang
 * @date 2020-10-28 23:03:42
 */
@Data
@TableName("order_food")
public class OrderFoodEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 主键
	 */
	@TableId
	private Integer id;
	/**
	 * 订单ID
	 */
	private Integer orderId;
	/**
	 * 商铺ID
	 */
	private Integer shopId;
	/**
	 * 商铺名称
	 */
	private String shopname;
	/**
	 * 商品ID
	 */
	private Integer foodId;
	/**
	 * 商品标题
	 */
	private String title;
	/**
	 * 商品封面
	 */
	private String cover;
	/**
	 * 原价
	 */
	private double originPrice;
	/**
	 * 售价
	 */
	private double sellPrice;
	/**
	 * 下单数量
	 */
	private Integer numbers;
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
