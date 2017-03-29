package com.sxs.domain;

import java.util.HashSet;
import java.util.Set;

import com.sxs.common.model.IModel;


/**
 * 系统用户表
 * <p>Title:User</p>
 * <p>Description:</p>
 * <p>Company:</p>
 * @author tmk 
 * @date 2017年2月16日 下午6:11:01
 */
public class User implements IModel {

	private static final long serialVersionUID = -6068132594403704782L;

	private int id;//主键

	private String account;//登陆账号

	private String passWord;//登陆密码

	private String lastLoginTime;//本次登陆时间

	private String createTime;//创建时间  yyyy-MM-dd HH:mm:ss

	private Integer loginCount;//登陆次数
	
	private Integer status;//状态

	private String userType;//用户类型
	
	private String desc1;//备用字段(手机号码，发送短信验证)
	
	private String desc2;
	
	private String desc3;
	
	private String desc4;
	
	private Set<Systemlog> systemlogs = new HashSet<Systemlog>(0);//一对多关系，日志集合

	public User() {
		super();
	}
	
	public User(int id, String account, String passWord, String createTime) {
		super();
		this.id = id;
		this.account = account;
		this.passWord = passWord;
		this.createTime = createTime;
	}

	public User(int id, String account, String passWord, String lastLoginTime,
			String createTime, Integer loginCount, Integer status, String userType) {
		super();
		this.id = id;
		this.account = account;
		this.passWord = passWord;
		this.lastLoginTime = lastLoginTime;
		this.createTime = createTime;
		this.loginCount = loginCount;
		this.status = status;
		this.userType = userType;
	}

	public User(int id, String account, String passWord, String lastLoginTime,
			String createTime, Integer loginCount, Integer status, String userType,
			String desc1, String desc2, String desc3, String desc4,
			Set<Systemlog> systemlogs) {
		super();
		this.id = id;
		this.account = account;
		this.passWord = passWord;
		this.lastLoginTime = lastLoginTime;
		this.createTime = createTime;
		this.loginCount = loginCount;
		this.status = status;
		this.userType = userType;
		this.desc1 = desc1;
		this.desc2 = desc2;
		this.desc3 = desc3;
		this.desc4 = desc4;
		this.systemlogs = systemlogs;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPassWord() {
		return passWord;
	}

	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}

	public String getLastLoginTime() {
		return lastLoginTime;
	}

	public void setLastLoginTime(String lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public Integer getLoginCount() {
		return loginCount;
	}

	public void setLoginCount(Integer loginCount) {
		this.loginCount = loginCount;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
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

	public Set<Systemlog> getSystemlogs() {
		return systemlogs;
	}

	public void setSystemlogs(Set<Systemlog> systemlogs) {
		this.systemlogs = systemlogs;
	}

}