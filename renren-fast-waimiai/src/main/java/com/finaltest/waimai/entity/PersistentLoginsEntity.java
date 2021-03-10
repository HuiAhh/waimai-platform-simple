package com.finaltest.waimai.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

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
@TableName("persistent_logins")
public class PersistentLoginsEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 
	 */
	private String username;
	/**
	 * 
	 */
	@TableId
	private String series;
	/**
	 * 
	 */
	private String token;
	/**
	 * 
	 */
	private Date lastUsed;

}
