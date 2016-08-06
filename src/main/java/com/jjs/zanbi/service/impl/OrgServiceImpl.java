package com.jjs.zanbi.service.impl;

import com.jjs.zanbi.dao.OrgMapper;
import com.jjs.zanbi.model.Org;
import com.jjs.zanbi.service.OrgService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by kaiwen on 2016/8/6.
 */
@Service("orgService")
public class OrgServiceImpl implements OrgService {

    @Resource
    OrgMapper orgMapper;

    public List<Org> selectAll(){
        List<Org> orgList = orgMapper.selectAll();
        return orgList;
    }
}
