package com.sxs.common.util;

import java.util.List;

/**
 * 
 * @ClassName: PaginationVO
 * @Description: 分页数据封装类
 * @author: tank
 * @date: 2017年2月17日 上午9:30:53
 * @param <T>
 */
public class PaginationVO<T> {

	private Long total;
	
	private List<T> list;

	public Long getTotal() {
		return total;
	}

	public void setTotal(long total2) {
		this.total = total2;
	}

	public List<T> getList() {
		return list;
	}

	public void setList(List<T> list) {
		this.list = list;
	}
	
	
}
