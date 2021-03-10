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
 * @date 2020-11-03 15:51:49
 */
@Data
@TableName("news")
public class NewsEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 系统消息id
	 */
	@TableId
	private Integer newsId;

	/**
	 * 消息内容
	 */
	private String message;
	/**
	 * 接收者id
	 */
	private Integer receiveId;

	/**
	 * 创建时间
	 */
	@TableField(fill = FieldFill.INSERT)
	private Date gmtCreate;

}
