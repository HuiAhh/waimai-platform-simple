package io.renren.modules.waimai.entity;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * 菜品信息表
 * 
 * @author qianchunjiang
 * @date 2020-10-28 23:03:42
 */
@Data
@TableName("food")
public class FoodEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 主键
	 */
	@TableId
	private Integer id;
	/**
	 * 商店ID
	 */
	private Integer shopId;
	/**
	 * 分类ID
	 */
	private Integer cateId;
	/**
	 * 食品名字
	 */
	private String title;
	/**
	 * 描述
	 */
	private String describle;
	/**
	 * 折扣
	 */
	private double discount;
	/**
	 * 食品封面图
	 */
	private String cover;
	/**
	 * 原价
	 */
	private double originPrice;
	/**
	 * 售价
	 */
	private double sellPrice;
	/**
	 * 状态 0下架1上架
	 */
	@TableLogic
	private Integer showstatus;

	/**
	 * 规格选项
	 */
	private String selection;
	/**
	 * 总的销量
	 */
	private Integer totalSales;
	/**
	 * 好评率
	 */
	private Float praiseRate;
	/**
	 * 创建时间
	 */
	@TableField(fill = FieldFill.INSERT)
	private Date gmtCreate;
	/**
	 *
	 */
	@TableField(fill = FieldFill.INSERT_UPDATE)
	private Date gmtModified;
}
