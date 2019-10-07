package com.xlh.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.xlh.pojo.User;

/**
 * Servlet Filter implementation class UrlFilter
 */
@WebFilter("/*")
public class UrlFilter implements Filter {
	public UrlFilter() {
		// TODO Auto-generated constructor stub
	}

	public void destroy() {
		// TODO Auto-generated method stub
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse rep = (HttpServletResponse) response;
		String uri = req.getRequestURI();
		String head=req.getContextPath();
	
		if (uri.endsWith(".js") || uri.endsWith(".css") || uri.endsWith(".html") || uri.endsWith(".jpg")
				|| uri.endsWith(".png") || uri.endsWith(".gif")) {
			chain.doFilter(req, rep);
		} else {
			if (uri.equals(head+"/login") || uri.equals(head+"/login.jsp")
					|| uri.equals(head+"/error.jsp")||(uri.equals(head+"/garbage2"))) {
				chain.doFilter(req, rep);
			} else {
				HttpSession session = req.getSession();
				User user = (User) session.getAttribute("user");
				if (user != null) {
					chain.doFilter(request, response);
				} else if (user == null) {
					rep.sendRedirect("error.jsp");
				}
			}
		}

	}
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
