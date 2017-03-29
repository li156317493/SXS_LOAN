package com.sxs.filter;

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

import com.sxs.domain.User;

/**
 * 
 * @ClassName: PortalsFilter
 * @Description: 请求处理过滤器
 * @author: tank
 * @date: 2017年2月17日 上午9:35:30
 */
public class PortalsFilter implements Filter {
	String excludedUrl = "";
	String[] excludedUrlArray={};
	
	final String loginUrl="/user/login"; //登陆页面url
	
	final String logininUrl="/user/loginin"; //登陆
	
	final String resourcesUrl="/resources"; //不拦截静态资源
	final String jspFile="/file"; //不拦截静态资源
	final String ueditorUrl="/ueditor"; //不拦截静态资源
	@Override
	public void destroy() {

	}
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
			HttpServletRequest req = (HttpServletRequest) request;
			HttpServletResponse res = (HttpServletResponse) response;
			HttpSession session = req.getSession(true);
			String contextPath=req.getContextPath();
			User sessionUser = (User)session.getAttribute("session_user");
			//不拦截资源文件 
		if (req.getRequestURI().contains("/error/")
				|| req.getRequestURI().contains("/inc")
				|| req.getRequestURI().contains(jspFile)
				|| req.getRequestURI().contains(resourcesUrl)
				|| req.getRequestURI().contains(ueditorUrl)) {
			chain.doFilter(request, response);
			return;
		}
			if(req.getRequestURI().equals("/")){
				res.sendRedirect(contextPath+loginUrl);
			}else if(req.getRequestURI().equals(contextPath+loginUrl) || req.getRequestURI().equals(contextPath+logininUrl)){
				if (sessionUser == null) {
					chain.doFilter(request, response);
				}else{
					res.sendRedirect(contextPath+loginUrl);	
				}
			}else{
				if (sessionUser == null) {
					req.getRequestDispatcher(contextPath+"/error/404").forward(request,response);
				}else{
					chain.doFilter(request, response);
				}
			}
        	return;
	}

	@Override
	public void init(FilterConfig config) throws ServletException {
		excludedUrl = config.getInitParameter("excludedUrl");
		if(excludedUrl!=null && !"".equals(excludedUrl)){
			 excludedUrlArray = excludedUrl.split(",");
		}
	}

}