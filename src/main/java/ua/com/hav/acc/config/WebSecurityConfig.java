package ua.com.hav.acc.config;

import org.apache.tomcat.jdbc.pool.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.annotation.web.servlet.configuration.EnableWebMvcSecurity;

/**
 * Created by sunny on 31.10.17
 */


@Configuration
@EnableWebMvcSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                .authorizeRequests()
                .antMatchers("/users").hasAnyRole("USER", "ADMIN")
                .antMatchers("/", "/register").permitAll()
                .antMatchers("/static/**").permitAll()
//                .antMatchers("/zone/def").hasRole("ADMIN")
                .anyRequest().authenticated()
                .and()
                .formLogin().loginPage("/login").permitAll()
//                    .successForwardUrl("/users/")
// .failureForwardUrl("/login?error")
                .and()
                .logout().logoutSuccessUrl("/login?logout").permitAll()
                .and()
                .exceptionHandling().accessDeniedPage("/403")
                .and()
                .csrf().disable();
//                .permitAll();
    }


//    public void configGlobal(AuthenticationManagerBuilder auth) throws Exception {
//        auth.inMemoryAuthentication()
//                .withUser("user").password("111").roles("USER")
//            .and()
//                .withUser("admin").password("333").roles("ADMIN");
//    }


    @Autowired
    public void configAuthentication(AuthenticationManagerBuilder auth, @Qualifier("dataSource") DataSource dataSource) throws Exception {

        auth.jdbcAuthentication().dataSource(dataSource)
                .usersByUsernameQuery("select login, password, 1 from user where login=?")
//                .authoritiesByUsernameQuery("select u.login, r.value from user u left join role r on u.user_id = r.id where login=?");
                .authoritiesByUsernameQuery("select u.login, r.value from user u left join users_roles ur on ur.user_id = u.id " +
                        "left join role r on ur.role_id = r.id where login=?");
    }
}