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
@TableName("tb_promote_applay")
public class PromoteApplayEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 
	 */
	@TableId
	private Integer id;
	/**
	 * 
	 */
	private Integer shopId;
	/**
	 * 申请时长
	 */
	private Integer applayTime;
	/**
	 * 出资多少
	 */
	private Double willingpay;
	/**
	 * 申请状态
	 */
	private String applayStatus;
	/**
	 * 
	 */
	private Date gmtCreate;
	/**
	 * 
	 */
	private Date gmtModified;

}
