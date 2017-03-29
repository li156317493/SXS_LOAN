package com.sxs.common.util;

/**
 * 
 * @ClassName: ApplicationExectpion
 * @Description: 异常错误信息封装类
 * @author: tank
 * @date: 2017年2月17日 上午9:26:53
 */
public class ApplicationExectpion extends RuntimeException{
	
	private static final long serialVersionUID = 4330661996199117850L;

	public ApplicationExectpion() {
	}

	public ApplicationExectpion(String message) {
		super(message);
	}

	public ApplicationExectpion(Throwable cause) {
		super(cause);
	}

	public ApplicationExectpion(String message, Throwable cause) {
		super(message, cause);
	}
}
