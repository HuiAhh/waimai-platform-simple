package com.finaltest.waimai.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.WebSecurityConfigurer;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;

import javax.sql.DataSource;

/**
 * @author 钱春江
 * @create 2020-10-2020/10/24
 */
@Configuration

public class SecurityConfig extends WebSecurityConfigurerAdapter {
    @Autowired
    private UserDetailsService userDetailsService;
    @Autowired
    private DataSource dataSource;

    @Autowired
    private WaimaiAuthenticationSuccessHandler successHandler;
    @Autowired
    private WaimaiAuthenticationFailureHandler failureHandler;

    @Bean
    //注入数据源
    public PersistentTokenRepository persistentTokenRepository(){
        JdbcTokenRepositoryImpl jdbcTokenRepository=new JdbcTokenRepositoryImpl();
        jdbcTokenRepository.setDataSource(dataSource);
        return jdbcTokenRepository;
    }
    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {

        auth.userDetailsService(userDetailsService).passwordEncoder(password());
    }

    @Bean
    PasswordEncoder password() {
        return new BCryptPasswordEncoder();
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        //设置没有访问权限跳转的页面
        http.logout();
        //设置无权限跳转页面
        http.exceptionHandling().accessDeniedPage("/no-permission");
        http.formLogin()//编写自己登陆页面
                .loginPage("/login")//登陆页面设置
                .loginProcessingUrl("/waimai/user/login")//登陆访问路径
                .successForwardUrl("/index.html").permitAll()
                .successHandler(successHandler)
                .failureHandler(failureHandler)
                .and()
                .authorizeRequests()
                .antMatchers(
                        "/**",
                        "/css/**",
                        "/js/**",
                        "/index.html",
                        "/",
                        "/index",
                        "/waimai/*/list",
                        "/waimai/*/query",
                        "/waimai/food/shop/*",
                        "/waimai/shopinfo/info/*"
                ).permitAll()

                .anyRequest().authenticated()
                .and()
                .rememberMe().tokenRepository(persistentTokenRepository())
                .tokenValiditySeconds(60*60*24*10)//设置时间，秒为单位
                .userDetailsService(userDetailsService)
                .and()
                .csrf().disable();//关闭防护


    }
}


