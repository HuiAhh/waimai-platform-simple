package com.finaltest.waimai.entity;

import com.baomidou.mybatisplus.annotation.*;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 
 * 
 * @author qianchunjiang
 * @date 2020-10-28 23:03:42
 */
@Data
@TableName("shopregister")
public class ShopregisterEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 主键
	 */
	@TableId
	private Integer shopregisterId;
	/**
	 * 商家id
	 */
	private Integer shopownerId;
	/**
	 * 商店类型
	 */
	private Integer cateid;
	/**
	 * 店铺名称
	 */
	private String shopname;
	/**
	 * 店铺地址
	 */
	private String adress;
	/**
	 *
	 */
	private String registerstatus;
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

	private String permitImg;
	private String images;

}
