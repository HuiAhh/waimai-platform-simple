package io.renren.modules.waimai.entity;

import lombok.Data;

import java.util.List;

/**
 * @author 钱春江
 * @create 2020-11-2020/11/6
 */
@Data
public class Order {
    public OrderDetailEntity orderDetailEntity;
    public List<OrderFoodEntity> orderFoodEntities;
}
