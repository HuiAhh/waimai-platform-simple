package com.finaltest.waimai.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.math.BigDecimal;
import java.io.Serializable;
import java.sql.Time;
import java.util.Date;
import lombok.Data;

/**
 * 商铺信息表
 * 
 * @author qianchunjiang
 * @date 2020-10-28 23:03:42
 */
@Data
@TableName("shop_info")
public class ShopInfoEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 主键
	 */
	@TableId
	private Integer id;
	/**
	 * 商店拥有者ID
	 */
	private Integer shopownerId;
	/**
	 * 商店名称
	 */
	private String shopname;
	/**
	 * 联系人
	 */
	private String contactMan;
	/**
	 * 联系电话
	 */
	private String contactMobile;
	/**
	 * 门店类型
	 */
	private Integer cateid;
	/**
	 * 营业开始时间
	 */
	private Time beginTime;
	/**
	 * 营业结束时间
	 */
	private Time endTime;
	/**
	 * 许可证图片
	 */
	private String permitImg;
	/**
	 * logo图片
	 */
	private String logoImg;
	/**
	 * 详细地址
	 */
	private String address;
	/**
	 * 外卖电话
	 */
	private String mobile;
	/**
	 * 商家公告
	 */
	private String notice;
	/**
	 * 平均评分
	 */
	private Float score;
	/**
	 * 配送时间
	 */
	private String sendTime;
	/**
	 * 餐盒费用
	 */
	private double boxCost;
	/**
	 * 配送费用
	 */
	private double sendCost;
	/**
	 * 起送消费
	 */
	private double floorSendCost;
	/**
	 * 店铺状态 ，0关门，1营业
	 */
	private int showStatus;

}
