package io.renren.modules.waimai.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * 用户配送地址
 * 
 * @author qianchunjiang
 * @date 2020-10-28 23:03:42
 */
@Data
@TableName("user_address")
public class UserAddressEntity implements Serializable {
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
	 * 姓名
	 */
	private String username;
	/**
	 * 性别
	 */
	private String gender;
	/**
	 * 联系电话
	 */
	private String mobile;
	/**
	 * 地址
	 */
	private String adress;
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
