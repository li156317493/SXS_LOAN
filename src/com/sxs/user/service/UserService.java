package com.sxs.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sxs.common.service.BaseService;
import com.sxs.common.util.ApplicationExectpion;
import com.sxs.common.util.Md5Utils;
import com.sxs.common.util.PaginationVO;
import com.sxs.domain.User;
import com.sxs.user.dao.IUserDao;

/**
 * 
 * <p>Title:UserService</p>
 * <p>Description:</p>
 * <p>Company:</p>
 * @author tmk 
 * @date 2017年2月16日 下午6:23:49
 */
@Service
public class UserService extends BaseService<IUserDao, User> implements IUserService{

	private IUserDao userDao;
	
	@Autowired(required = true)
	public void setNewsDao(IUserDao userDao) {
		this.userDao = userDao;
	}
	@Override
	public User login(String account, String passWord) {
		User userAccount = userDao.findUserByAccount(account);
		if (userAccount == null) {
			throw new ApplicationExectpion("您输入的用户名不存在，请重新输入...");
		}
		User user = userDao.validate(account,Md5Utils.MD5(passWord));
		if (user == null) {
			throw new ApplicationExectpion("您输入的密码错误，请重新输入...");
		}
		return user;
	}
	@Override
	public PaginationVO<User> findUserByPage() {
		return userDao.findUserByPage();
	}
	@Override
	public void deleteUsers(String[] ids) {
		for (String userid : ids) {
			userDao.deleteById(Integer.parseInt(userid));
		}
		
	}
	@Override
	public User findUserByAccount(String username) {
		return userDao.findUserByAccount(username);
	}

}
