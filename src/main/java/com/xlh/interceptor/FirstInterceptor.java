package com.xlh.interceptor;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.xlh.pojo.Element;
import com.xlh.pojo.Url;
import com.xlh.pojo.User;
import com.xlh.service.UrlService;
import com.xlh.service.impl.UrlServiceimpl;

public class FirstInterceptor implements HandlerInterceptor{
/*	  @Resource
      private UrlService urlServiceImpl;*/
//拦截全部请求 将登陆页面login.jsp放行
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2) throws Exception {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
/*		StringBuffer url=request.getRequestURL();
		String uri=url.substring(16, url.length());
        int rid = user.getRid();
      List<Url> selUrlByRid = urlServiceImpl.selUrlByRid(rid);
      System.out.println(selUrlByRid);
      boolean flag=false;
      for (Url url2 : selUrlByRid) {	
		if (uri.equals(url2.getName())) {
			flag=true;			
		}
	}  
      System.out.println(flag);
      */
		 if (user!=null) {
			 return true;
		}
		 else{
			 response.sendRedirect(request.getContextPath() + "/UserAuthorityNot.jsp");
		 }
	return false;
	}

	
	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object arg2, ModelAndView arg3)
			throws Exception {
	}

}
