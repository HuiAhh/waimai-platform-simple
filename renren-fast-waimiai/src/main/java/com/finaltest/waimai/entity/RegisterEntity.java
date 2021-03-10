package com.finaltest.waimai.entity;


import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * 
 * 
 * @author qianchunjiang
 * @date 2020-11-03 18:41:08
 */
@Data
@TableName("register")
public class RegisterEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 
	 */
	@TableId
	private Integer id;
	/**
	 * 
	 */
	private String username;
	/**
	 * 
	 */
	private String mobile;
	/**
	 * 
	 */
	private String password;
	/**
	 * 
	 */
	private String truename;
	/**
	 * 
	 */
	private String gender;
	/**
	 * 
	 */
	private Integer identity;
	/**
	 * 
	 */
	private String registerstatus;
	/**
	 * 
	 */
	private Date gmtModified;
	/**
	 * 
	 */
	private Date gmtCreate;

}
