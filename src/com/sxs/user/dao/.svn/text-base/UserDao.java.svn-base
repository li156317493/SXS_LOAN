package com.sxs.user.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.sxs.common.dao.BaseDao;
import com.sxs.common.util.PaginationVO;
import com.sxs.domain.User;

/**
 * 
 * <p>Title:UserDao</p>
 * <p>Description:</p>
 * <p>Company:</p>
 * @author tmk 
 * @date 2017年2月16日 下午6:22:49
 */
@Repository
public class UserDao extends BaseDao<User> implements IUserDao{

	@SuppressWarnings("unchecked")
	@Override
	public User findUserByAccount(String account) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select u from User u where u.account=? ");
		List<User> list = null;
		query.setParameter(0, account);
		try{
			list = query.list();
		}catch (Exception e){
			e.printStackTrace();
		}
		if(list.size()>0) {
			return list.get(0);
		}
		return null;
	}

	@SuppressWarnings("unchecked")
	@Override
	public User validate(String account, String md5) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select u from User u where u.account=? and u.passWord=? ");
		List<User> list = null;
		query.setParameter(0, account);
		query.setParameter(1, md5);
		try{
			list = query.list();
		}catch (Exception e){
			e.printStackTrace();
		}
		if(list.size()>0) {
			return list.get(0);
		}
		return null;
	}

	@Override
	public PaginationVO<User> findUserByPage() {
		List<User>  list =  findObjListByHqlByPage("select u from User u where  u.passWord is not null and u.account <> 'admin' order by u.id desc",null);
		int total = findCountByHql("select count(u) from User u where  u.passWord is not null and u.account <> 'admin' order by u.id desc",null);
		PaginationVO<User> paginationVO = new PaginationVO<User>();
		paginationVO.setList(list);
		paginationVO.setTotal(total);
		return paginationVO;	
	}
}
