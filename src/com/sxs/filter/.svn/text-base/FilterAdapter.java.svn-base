package com.sxs.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

/**
 * 
 * @ClassName: FilterAdapter
 * @Description:  缺省适配器
 * @author: tank
 * @date: 2017年2月17日 上午9:34:34
 */
public abstract class FilterAdapter implements Filter {

	public void destroy() {
	}

	public void init(FilterConfig filterConfig) throws ServletException {
	}

	public abstract void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException;
}