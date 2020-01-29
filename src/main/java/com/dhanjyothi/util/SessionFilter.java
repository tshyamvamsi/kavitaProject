package com.dhanjyothi.util;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SessionFilter implements Filter {

    @Override
    public void doFilter(ServletRequest req, ServletResponse res,
                FilterChain chain) throws IOException,
                ServletException {

            HttpServletRequest request = (HttpServletRequest) req;
            HttpServletResponse response = (HttpServletResponse) res;
            String url = request.getRequestURI();

            response.setHeader("pragma", "no-cache");              
            response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");             
            response.setHeader("Expires", "0"); 
            HttpSession session = request.getSession(false);

            
            if(session==null && !url.contains("login.html")) {
                response.sendRedirect(request.getContextPath() + "/login.html");
                response.setHeader("message", "Session Timeout.");
                return;
            }

            chain.doFilter(req, res);
        }

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}
}
