package io.renren.modules.waimai.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * 订单主表
 * 
 * @author qianchunjiang
 * @date 2020-10-28 23:03:42
 */
@Data
@TableName("orderlist")
public class OrderEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 主键
	 */
	@TableId
	private Integer id;

	/**
	 * 用户ID
	 */
	private Integer userId;
	/**
	 * 商铺ID
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
	/**
	 * 总价
	 */
	private double totalMoney;
	private String completstatus;
	/**
	 * 限定的时间
	 */
	private Integer demandTime;
	/**
	 * 状态
	 */


	@TableField(fill = FieldFill.INSERT)
	private Date gmtCreate;
	/**
	 *
	 */
	@TableField(fill = FieldFill.INSERT_UPDATE)
	private Date gmtModified;

}
