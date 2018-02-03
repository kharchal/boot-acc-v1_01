package ua.com.hav.acc.config;

import org.apache.tomcat.jdbc.pool.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

/**
 * Created by sunny on 31.10.17
 */


@Configuration
@EnableWebSecurity(debug = false)
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                .authorizeRequests()
//                .antMatchers("/").permitAll()
//                .antMatchers("/admin**").access("hasRole('ADMIN_ROLE')")
//                .antMatchers("/guest**").access("hasRole('ROLE_GUEST')")


//                .antMatchers("/users/**").access("hasAuthority('ROLE_ADMIN')")
//                .antMatchers("/", "/register", "/app").permitAll()
//                .antMatchers("/static/**").permitAll()
//                .antMatchers("/zone/def").hasRole("ADMIN")
                .anyRequest().permitAll()
                .and()
                .formLogin().loginPage("/login").permitAll()

                .and()
                .logout().logoutSuccessUrl("/login?logout").permitAll()
                .and()
//                .exceptionHandling().accessDeniedPage("/403")

//                .and()
                .csrf().disable();
//                .permitAll();
    }




    @Autowired
    public void configAuthentication(AuthenticationManagerBuilder auth, @Qualifier("dataSource") DataSource dataSource) throws Exception {

        auth.jdbcAuthentication().dataSource(dataSource)
                .usersByUsernameQuery("select login, password, 1 from user where login=?")
//                .authoritiesByUsernameQuery("select u.login, r.value from user u left join role r on u.user_id = r.id where login=?");
                .authoritiesByUsernameQuery("select u.login as username, r.value as role from user u left join users_roles ur on ur.user_id = u.id " +
                        "left join role r on ur.role_id = r.id where u.login=?");
    }
}