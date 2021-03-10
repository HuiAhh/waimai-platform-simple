package io.renren.modules.waimai.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * 用户登录表
 * 
 * @author qianchunjiang
 * @date 2020-10-28 23:03:41
 */
@Data
@TableName("user")
public class UsersEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 主键
	 */
	@TableId
	private Integer id;
	/**
	 * 用户昵称
	 */
	private String username;
	/**
	 * 联系电话
	 */
	private String mobile;
	/**
	 * 登录密码
	 */
	private String password;
	/**
	 * 钱包
	 */
	private double wallet;
	/**
	 * 用户真实姓名
	 */
	private String truename;
	/**
	 * 性别
	 */
	private String gender;
	/**
	 * 身份，0：普通顾客，1：骑手，2商家
	 */
	private Integer identity;
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
