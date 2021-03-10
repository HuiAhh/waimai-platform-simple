package io.renren.modules.waimai.entity;


import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * 
 * 
 * @author qianchunjiang
 * @date 2020-11-08 17:30:05
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
	private String images;
	/**
	 * 
	 */
	private String permitImg;
	/**
	 * 申请状态 0表示未处理，1表示审核通过，-1表示审核不通过
	 */
	private String registerstatus;
	/**
	 * 
	 */
	private Date gmtCreate;
	/**
	 * 
	 */
	private Date gmtModified;
	/**
	 * 
	 */
	private Integer isDeleted;

}
