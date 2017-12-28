package ua.com.hav.acc.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;
import ua.com.hav.acc.model.User;
import ua.com.hav.acc.model.service.UserService;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by sunny on 28.12.17
 */
@WebFilter(urlPatterns = {"/users/*"}, servletNames = {"dispatcherServlet"})
@Component
public class LoggedUserFilter implements Filter {

    @Autowired
    private UserService userService;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (!principal.equals("anonymousUser")) {
            User user = userService.findByLogin(((UserDetails) principal).getUsername());
            ((HttpServletRequest) request).getSession().setAttribute("logged_user", user);
        }
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {

    }


}
