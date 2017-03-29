package com.sxs.user.dao;

import com.sxs.common.dao.IBaseDao;
import com.sxs.common.util.PaginationVO;
import com.sxs.domain.User;

/**
 * 
 * <p>Title:IUserDao</p>
 * <p>Description:</p>
 * <p>Company:</p>
 * @author tmk 
 * @date 2017年2月16日 下午6:22:25
 */
public interface IUserDao extends IBaseDao<User>{

	User findUserByAccount(String account);

	User validate(String account, String md5);

	PaginationVO<User> findUserByPage();

}
