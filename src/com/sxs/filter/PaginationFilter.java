package com.sxs.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

/**
 * 
 * @ClassName: PaginationFilter
 * @Description: 分页参数过滤器
 * @author: tank
 * @date: 2017年2月17日 上午9:35:12
 */
public class PaginationFilter extends FilterAdapter {

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest)request;
		int pageNo = 1;
		int pageSize = 8;
		if (req.getParameter("pageNo") != null) {
			pageNo = Integer.parseInt(req.getParameter("pageNo"));
		}
		if(req.getSession().getServletContext().getInitParameter("pageSize") != null){
			pageSize = Integer.parseInt(req.getSession().getServletContext().getInitParameter("pageSize"));
		}
		//将分页数据设置到threadlocal中
		PaginationContext.setPageNo(pageNo);
		PaginationContext.setPageSize(pageSize);
		try {
			//继续执行
			chain.doFilter(req, response);
		}finally {
			PaginationContext.removePageNo();
			PaginationContext.removePageSize();
		}
	}
}
