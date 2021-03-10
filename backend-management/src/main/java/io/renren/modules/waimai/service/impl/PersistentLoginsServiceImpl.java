package io.renren.modules.waimai.service.impl;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;
import io.renren.modules.waimai.dao.PersistentLoginsDao;
import io.renren.modules.waimai.entity.PersistentLoginsEntity;
import io.renren.modules.waimai.service.PersistentLoginsService;
import org.springframework.stereotype.Service;

import java.util.Map;

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