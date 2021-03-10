package com.finaltest.waimai.config;

import com.common.utils.R;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController

public class LoginController {

    @RequestMapping("/login")
    @CrossOrigin(origins = "*")
    public R login(){
        return R.error(300,"未登录，请用/waimai/user/login登录");
    }

    @RequestMapping("/no-permission")
    @CrossOrigin(origins = "*")
    public R noPermission(){
        return R.error(403,"无权限，请用/waimai/user/login登录");
    }
}
