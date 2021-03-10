package io.renren.modules.waimai.entity;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * 商家的食物分类
 * 
 * @author qianchunjiang
 * @date 2020-10-28 23:03:42
 */
@Data
@TableName("food_category")
public class FoodCategoryEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 主键
	 */
	@TableId
	private Integer id;
	/**
	 * 分类类型
	 */
	private String name;
	/**
	 * 描述
	 */
	private String describle;
	/**
	 * 
	 */
	private Integer parentId;
	/**
	 * 
	 */
	private Integer level;
	/**
	 * 
	 */
	@TableLogic
	private Integer isDeleted;
	@TableField(fill = FieldFill.INSERT)
	private Date gmtCreate;
	/**
	 *
	 */
	@TableField(fill = FieldFill.INSERT_UPDATE)
	private Date gmtModified;

}
