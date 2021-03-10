package com.finaltest.waimai.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.common.utils.PageUtils;
import com.common.utils.Query;

import com.finaltest.waimai.dao.PersistentLoginsDao;
import com.finaltest.waimai.entity.PersistentLoginsEntity;
import com.finaltest.waimai.service.PersistentLoginsService;


@Service("persistentLoginsService")
public class PersistentLoginsServiceImpl extends ServiceImpl<PersistentLoginsDao, PersistentLoginsEntity> implements PersistentLoginsService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<PersistentLoginsEntity> page = this.page(
                new Query<PersistentLoginsEntity>().getPage(params),
                new QueryWrapper<PersistentLoginsEntity>()
        );

        return new PageUtils(page);
    }

}