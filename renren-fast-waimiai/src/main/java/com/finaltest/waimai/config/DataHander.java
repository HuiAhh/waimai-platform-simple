package com.finaltest.waimai.config;

import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import org.apache.ibatis.reflection.MetaObject;
import org.springframework.stereotype.Component;

import javax.lang.model.element.VariableElement;
import javax.sound.midi.MetaEventListener;
import java.util.Date;

/**
 * @author 钱春江
 * @create 2020-10-2020/10/28
 */
@Component
public class DataHander implements MetaObjectHandler {

    @Override
    public void insertFill(MetaObject metaObject) {
        Date date = new Date();
        this.setFieldValByName("gmtCreate",date,metaObject);
        this.setFieldValByName("gmtModified",date,metaObject);
    }

    @Override
    public void updateFill(MetaObject metaObject) {
        Date date = new Date();
        this.setFieldValByName("gmtModified",date,metaObject);
    }
}
