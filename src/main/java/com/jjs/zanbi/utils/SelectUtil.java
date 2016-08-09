package com.jjs.zanbi.utils;

import com.jjs.zanbi.model.Org;
import com.jjs.zanbi.model.Role;
import com.jjs.zanbi.service.OrgService;
import com.jjs.zanbi.service.RoleService;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by kaiwen on 2016/8/6.
 */

@Component
public class SelectUtil {

    @Resource
    OrgService orgService;

    @Resource
    RoleService roleService;

    public String getOrgSelectHtml(boolean withoption){

        StringBuffer sb = new StringBuffer();
        if(withoption){
            sb.append("<option>--请选择--</option>");
        }
        List<Org> orgList = orgService.selectAll();

        for (Org org : orgList) {

            sb.append("<option")
                    .append(" value='")
                    .append(org.getId())
                    .append("'>")
                    .append(org.getOrgName())
                    .append("</option>")
            .append("\n");
        }

        return sb.toString();
    }



    public String getRoleSelectHtml(boolean withoption){

        StringBuffer sb = new StringBuffer();

        if(withoption){
            sb.append("<option>--请选择--</option>");
        }
        List<Role> roleList = roleService.selectAll();

        for (Role role : roleList) {
            sb.append("<option")
                    .append(" value='")
                    .append(role.getId())
                    .append("'>")
                    .append(role.getRoleName())
                    .append("</option>")
                    .append("\n");
        }

        return sb.toString();
    }
}
