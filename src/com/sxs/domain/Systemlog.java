package com.sxs.domain;

import com.sxs.common.model.IModel;


/**
 * 用户操作日志类
 * <p>Title:Systemlog</p>
 * <p>Description:</p>
 * <p>Company:</p>
 * @author tmk 
 * @date 2017年2月16日 下午6:09:51
 */
public class Systemlog implements IModel {

	private static final long serialVersionUID = -8726555626318426525L;

	private long id;//主键

	private String createTime;//操作时间  yyyy-MM-dd HH:mm:ss

	private String description;//操作描述

	private String logType;//操作模块

    private String desc1;//备用字段
	
	private String desc2;
	
	private String desc3;
	
	private String desc4;
	
	private User user;//用户

	public Systemlog() {
		super();
	}

	public Systemlog(int id, String createTime, String description,
			String logtype, User user) {
		super();
		this.id = id;
		this.createTime = createTime;
		this.description = description;
		this.logType = logtype;
		this.user = user;
	}

	public Systemlog(int id, String createTime, String description,
			String logtype, String desc1, String desc2, String desc3,
			String desc4, User user) {
		super();
		this.id = id;
		this.createTime = createTime;
		this.description = description;
		this.logType = logtype;
		this.desc1 = desc1;
		this.desc2 = desc2;
		this.desc3 = desc3;
		this.desc4 = desc4;
		this.user = user;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getLogtype() {
		return logType;
	}

	public void setLogtype(String logtype) {
		this.logType = logtype;
	}

	public String getDesc1() {
		return desc1;
	}

	public void setDesc1(String desc1) {
		this.desc1 = desc1;
	}

	public String getDesc2() {
		return desc2;
	}

	public void setDesc2(String desc2) {
		this.desc2 = desc2;
	}

	public String getDesc3() {
		return desc3;
	}

	public void setDesc3(String desc3) {
		this.desc3 = desc3;
	}

	public String getDesc4() {
		return desc4;
	}

	public void setDesc4(String desc4) {
		this.desc4 = desc4;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getLogType() {
		return logType;
	}

	public void setLogType(String logType) {
		this.logType = logType;
	}
	
}