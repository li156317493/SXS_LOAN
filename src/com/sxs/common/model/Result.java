package com.sxs.common.model;

import java.io.Serializable;

public class Result implements Serializable{

	private static final long serialVersionUID = 949740283776531551L;
	//  "000000" 成功 ，其他均为失败
	private String code;
	// 失败信息，成功时不返回
	private String errorMessage;
	//返回的数据信息
	private Object data;

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getErrorMessage() {
		return errorMessage;
	}

	public void setErrorMessage(String errorMessage) {
		this.errorMessage = errorMessage;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}
	public Result(){
	}
	
	public Result(String code){
		this.code = code;
	}
	public Result(String code, String error){
		this.code = code;
		this.errorMessage = error;
	}
	public static Result getSuccessResult(){
		return new Result("000000");
	}
	public static Result getErrorResult(){
		return new Result("-1","参数异常");
	}
	
	
}
