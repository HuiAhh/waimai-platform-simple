package com.finaltest.waimai.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 订单详情表
 *
 * @author qianchunjiang
 * @date 2020-10-28 23:03:42
 */
@Data
@TableName("order_detail")
public class OrderDetailEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 主键
	 */
	@TableId
	private Integer id;

	/**
	 * 用户名
	 */
	private Integer userId;
	private String userUsername;
	/**
	 * 用户联系电话
	 */
	private String userMobile;
	/**
	 * 用户地址ID
	 */
	private Integer userAddressId;
	/**
	 * 用户详细地址
	 */
	private String userAddress;
	/**
	 * 订单备注
	 */
	private String note;
	/**
	 * 商铺名字
	 */

	private String shopShopname;
	/**
	 * 商铺联系电话
	 */
	private String shopMobile;
	/**
	 * 商铺详细地址
	 */
	private String shopAddress;
	/**
	 * 送餐员ID
	 */
	private Integer deliverId;
	/**
	 * 送餐员姓名
	 */
	private String deliverName;
	/**
	 * 送餐员联系电话
	 */
	private String deliverMobile;
	/**
	 *
	 */
	private Integer shopId;
	/**
	 * 餐盒费
	 */
	private double boxCost;
	/**
	 * 配送费
	 */
	private double sendCost;
	private double totalMoney;
	private String completestatus;
	@TableField(fill = FieldFill.INSERT)
	private Date gmtCreate;
	/**
	 *
	 */
	@TableField(fill = FieldFill.INSERT_UPDATE)
	private Date gmtModified;
}
