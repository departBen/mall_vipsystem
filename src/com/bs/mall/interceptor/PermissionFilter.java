package com.bs.mall.interceptor;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bs.mall.entity.Users;

/**
 * @author ben
 *防止未登陆用户直接访问jsp页面
 */
public class PermissionFilter implements Filter {
	
	public PermissionFilter() {
		
	}

	@Override
	public void destroy() {

	}
	
	@Override
	public void init(FilterConfig arg0) throws ServletException {

	}

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain arg2)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) arg0;
		HttpServletResponse resp = (HttpServletResponse) arg1;
		
		String servletPath = req.getServletPath();
		HttpSession session = req.getSession();
		
		Users user = (Users) session.getAttribute("us");
		if (servletPath != null && servletPath.equals("/login.jsp")) {
			arg2.doFilter(arg0, arg1);
		} else {
			if (user != null) {
				arg2.doFilter(arg0, arg1);
			} else {
				RequestDispatcher rd = req.getRequestDispatcher("/login.jsp");
				rd.forward(req, resp);
			}
		}
		
	}

	

}
