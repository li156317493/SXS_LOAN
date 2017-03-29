package com.sxs.filter;

/**
 * 
 * @ClassName: PaginationContext
 * @Description: 分页参数处理
 * @author: tank
 * @date: 2017年2月17日 上午9:34:48
 */
public class PaginationContext {
    
	private PaginationContext() {}
	
	private static final ThreadLocal<Integer> pageNoThreadLocal = new ThreadLocal<Integer>();
	
	private static final ThreadLocal<Integer> pageSizeThreadLocal = new ThreadLocal<Integer>();
	
	public static void setPageNo(int pageNo) {
		pageNoThreadLocal.set(pageNo);
	}
	
	public static void setPageSize(int pageSize) {
		pageSizeThreadLocal.set(pageSize);
	}
	
	public static int getPageNo() {
		return pageNoThreadLocal.get();
	} 
	
	public static int getPageSize() {
		return pageSizeThreadLocal.get();
	}
	
	public static void removePageNo() {
		pageNoThreadLocal.remove();
	}
	
	public static void removePageSize() {
		pageSizeThreadLocal.remove();
	}
}
