package com.finaltest.waimai.entity;


import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
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
@TableName("tb_promote")
public class PromoteEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 
	 */
	@TableId
	private Integer id;
	/**
	 * 推广商店id
	 */
	private Integer shopId;
	/**
	 * 推广时长
	 */
	private Integer applayTime;
	/**
	 * 开始推广时间
	 */
	private Date startPromote;
	/**
	 * 推广状态
	 */
	private String promoteStatus;
	/**
	 * 申请通过时间
	 */
	@TableField(fill = FieldFill.INSERT)
	private Date gmtCreate;
	/**
	 * 修改时间
	 */
	@TableField(fill = FieldFill.INSERT_UPDATE)
	private Date gmtModified;

}
