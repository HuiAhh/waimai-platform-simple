package com.finaltest.waimai.config;

import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.common.utils.R;
import com.finaltest.waimai.entity.UserEntity;
import com.finaltest.waimai.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@Component
public class WaimaiAuthenticationSuccessHandler implements AuthenticationSuccessHandler {
    @Autowired
    UserService userService;
    @Override
    public void onAuthenticationSuccess(HttpServletRequest httpServletRequest,
                                        HttpServletResponse httpServletResponse,
                                        Authentication authentication)
            throws IOException {
        UserEntity user = userService.getOne(new QueryWrapper<UserEntity>().eq("mobile", authentication.getName()));
        httpServletRequest.getSession().setAttribute("user", user);
        R map = R.ok().put("user", user);
        httpServletResponse.setContentType("application/json;charset=UTF-8");
        PrintWriter out = httpServletResponse.getWriter();
        out.write(JSON.toJSONString(map));
        out.flush();
        out.close();
    }
}
