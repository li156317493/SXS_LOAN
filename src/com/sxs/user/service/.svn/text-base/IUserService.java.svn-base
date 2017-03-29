package com.sxs.user.service;

import com.sxs.common.service.IBaseService;
import com.sxs.common.util.PaginationVO;
import com.sxs.domain.User;
import com.sxs.user.dao.IUserDao;

/**
 * 
 * <p>Title:IUserService</p>
 * <p>Description:</p>
 * <p>Company:</p>
 * @author tmk 
 * @date 2017年2月16日 下午6:23:23
 */
public interface IUserService extends IBaseService<IUserDao, User>{

	User login(String account, String passWord);

	PaginationVO<User> findUserByPage();

	User findUserByAccount(String username);

	void deleteUsers(String[] ids);

}
