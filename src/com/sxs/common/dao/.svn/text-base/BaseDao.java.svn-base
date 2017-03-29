package com.sxs.common.dao;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Example;
import org.springframework.beans.factory.annotation.Autowired;

import com.sxs.common.model.IModel;
import com.sxs.filter.PaginationContext;

/**
 * 
 * @ClassName: BaseDao
 * @Description: Spring3.3对Hibernate4已经没有了HibernateDaoSupport和HibernateTemplate的支持，使用了原生态的API
 * @author: tank
 * @date: 2017年2月17日 上午9:19:00
 * @param <T>
 */
public class BaseDao<T extends IModel> implements IBaseDao<T>{
	@Autowired
	public SessionFactory sessionFactory;
	//当前泛型类
	private Class<T> entityClass;
	//当前主键名称
	private String pkname = "id";
	private final String HQL_LIST_ALL;
	private final String HQL_COUNT_ALL;
	
	public Class<T> getEntityClass() {
		return entityClass;
	}
	
	public void setEntityClass(Class<T> entityClass) {
		this.entityClass = entityClass;
	}
	
	@SuppressWarnings({"unchecked" })
	public BaseDao() {
		//获取当前泛型类
		Type type = this.getClass().getGenericSuperclass();
		if (type.toString().indexOf("BaseDao") != -1) {
			ParameterizedType type1 = (ParameterizedType) type;
			Type[] types = type1.getActualTypeArguments();
			setEntityClass((Class<T>) types[0]);
		}else{
			type = ((Class<T>)type).getGenericSuperclass();
			ParameterizedType type1 = (ParameterizedType) type;
			Type[] types = type1.getActualTypeArguments();
			setEntityClass((Class<T>) types[0]);
		}
		HQL_LIST_ALL="from "+this.entityClass.getSimpleName() +" order by "+pkname+" desc";
		HQL_COUNT_ALL="select count(*) from "+this.entityClass.getSimpleName();
	}
	
	/**
	 * 保存实例
	 * 
	 * @param t
	 * @throws HibernateException
	 */
	@Override
	public Serializable save(T t) {
		Session session = sessionFactory.getCurrentSession();
		Serializable id = null;
		try{
			id = session.save(t);
		}catch (Exception e){
			e.printStackTrace();
		}
		return id;
	}
	/**
	 * 修改实例
	 * 
	 * @param t
	 * @throws HibernateException
	 */
	@Override
	public void update(T t) {
		Session session = sessionFactory.getCurrentSession();
		try{
			session.update(t);
		}catch (Exception e){
			e.printStackTrace();
		}
	}
	
	@Override
	public void saveOrUpdate(T t){
		Session session = sessionFactory.getCurrentSession(); 
		try{
			session.saveOrUpdate(t);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	/**
	 * 删除实例
	 * 
	 * @param t
	 * @throws HibernateException
	 */
	@Override
	public void delete(T t) {
		Session session = sessionFactory.getCurrentSession(); 
		try{
			session.delete(t);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	/**
	 * 获取实例
	 * 
	 * @param id
	 * @throws HibernateException
	 */
	@SuppressWarnings("unchecked")
	@Override
	public T get(Serializable id) {
		Session session = sessionFactory.getCurrentSession();
		T t = null;
		try{
			t=(T) session.get(getEntityClass(), id);
		}catch (Exception e){
			e.printStackTrace();
		}
		return t;
	}
	
	/**
	 * 查询全部
	 * 
	 * @throws HibernateException
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<T> findAll() {
		
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(HQL_LIST_ALL);
		List<T> list = null;
		try{
			list = query.list();
		}catch (Exception e){
			e.printStackTrace();
		}
		return list;
	}
	
	/**
	 * 查询总数
	 * 
	 * @throws HibernateException
	 */
	@Override
	public Integer findAllCount(){
		Integer count=0;
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(HQL_COUNT_ALL);
		List<?> list = null;
		try{
			list = query.list();
		}catch(Exception e){
			e.printStackTrace();
		}
		if(list!=null&&!list.isEmpty()){
			count=((Integer) list.get(0)).intValue();
		}
		return count;
	}
	
	/**
	 * QBC查询
	 * 
	 * @param criteria
	 * @throws HibernateException
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<T> findByCriteria(Criteria criteria){
		List<T> list=null;
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria1 = session.createCriteria(getEntityClass());
		criteria1=criteria;
		try{
			list = criteria1.list();
		}catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}
	
	/**
	 * QBE查询
	 * 
	 * @param t
	 * @throws HibernateException
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<T> findByExample(T t) {
		List<T> list=null;
		Example example = Example.create(t);
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(getEntityClass());
		criteria.add(example);
		try{
			list = criteria.list();
		}catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}
	/**
	 * HQL查询
	 * 
	 * @param hql
	 * @param objects
	 * @throws HibernateException
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Object[]> findByHql(String hql,final Object...objects){
		List<Object[]> list=null;
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);
		for (int i = 0; i < objects.length; i++) {
			query.setParameter(i, objects[i]);
		}
		try{
			list = query.list();
		}catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}
	/**
	 * SQL查询
	 * 
	 * @param hql
	 * @param objects
	 * @throws HibernateException
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Object[]> findBySql(String sql,final Object...objects){
		List<Object[]> list=null;
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createSQLQuery(sql);
		for (int i = 0; i < objects.length; i++) {
			query.setParameter(i, objects[i]);
		}
		try{
			list = query.list();
		}catch (Exception e){
			e.printStackTrace();
		}
		return list;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<T> findObjListByHql(String hql, Object... objects) {
		List<T> list=null;
		Session session=sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);
		if(objects!=null){
			for (int i = 0; i < objects.length; i++) {
				query.setParameter(i, objects[i]);
			}
		}
		try{
			list = query.list();
		}catch (Exception e){
			e.printStackTrace();
		}
		return list;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<T> findObjListByHql(String hql, List<Object> objects) {
		List<T> list=null;
		Session session=sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);
		query.setParameterList("aList", objects); 
		try{
			list = query.list();
		}catch (Exception e){
			e.printStackTrace();
		}
		return list;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<T> findObjListByHql(String hql, List<Object> aList, Object... objects) {
		List<T> list=null;
		Session session=sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);
		if(objects!=null){
			for (int i = 0; i < objects.length; i++) {
				query.setParameter(i, objects[i]);
			}
		}
		if (aList != null && !aList.isEmpty()) {
			query.setParameterList("aList", aList);
		}
		try{
			list = query.list();
		}catch (Exception e){
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int deleteById(Serializable id) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(get(id));
		return 1;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Object[]> findByHql(String hql) {
		List<Object[]> list=null;
		Session session = sessionFactory.getCurrentSession();
		session.beginTransaction();
		Query query = session.createQuery(hql);
		try{
			list = query.list();
		}catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Object[]> findBySql(String sql) {
		List<Object[]> list=null;
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createSQLQuery(sql);
		try{
			list = query.list();
		}catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<T> findObjListByHql(String hql) {
		List<T> list=null;
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);
		try{
			list = query.list();
		}catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public T findObjectByHql(String hql, Object... objects) {
		List<T> list=null;
		Session session=sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);
		if(objects!=null){
			for (int i = 0; i < objects.length; i++) {
				query.setParameter(i, objects[i]);
			}
		}
		query.setMaxResults(1);
		try{
			list = query.list();
		}catch(Exception e){
			e.printStackTrace();
		}
		if(list.size()>0){
			return list.get(0);
		}
		return null;
	}

	@SuppressWarnings("unchecked")
	@Override
	public T findObjectByHql(String hql) {
		List<T> list=null;
		Session session=sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);
		query.setMaxResults(1);
		try{
			list = query.list();
		}catch(Exception e){
			e.printStackTrace();
		}
		if(list.size()>0){
			return list.get(0);
		}
		return null;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<T> findObjListByHqlByPage(String hql, List<Object> param) {
		int startPage = PaginationContext.getPageNo();
		int pageSize = PaginationContext.getPageSize();
		List<T> list=null;
		Session session=sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);
		if(param!=null){
			for (int i = 0; i < param.size(); i++) {
				query.setParameter(i, param.get(i));
			}
		}
		if(startPage>0){
			startPage = startPage - 1;
		}else{
			startPage = 0;
		}
		query.setFirstResult(startPage*pageSize);
		query.setMaxResults(pageSize);
		try{
			list = query.list();
		}catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Object[]> findBySqlByPage(String sql, List<Object> param) {
		int startPage = PaginationContext.getPageNo();
		int pageSize = PaginationContext.getPageSize();
		List<Object[]> list=null;
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createSQLQuery(sql);
		if(param!=null){
			for (int i = 0; i < param.size(); i++) {
				query.setParameter(i, param.get(i));
			}
		}
		if(startPage>0){
			startPage = startPage - 1;
		}else{
			startPage = 0;
		}
		query.setFirstResult(startPage*pageSize);
		query.setMaxResults(pageSize);
		try{
			list = query.list();
		}catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<T> findObjListByHqlByPage(String hql,List<Object> paramList, List<Object> param) {
		int startPage = PaginationContext.getPageNo();
		int pageSize = PaginationContext.getPageSize();
		List<T> list=null;
		Session session=sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);
		if(param!=null){
			for (int i = 0; i < param.size(); i++) {
				query.setParameter(i, param.get(i));
			}
		}
		query.setParameterList("alist", paramList); 
		if(startPage>0){
			startPage = startPage - 1;
		}else{
			startPage = 0;
		}
		query.setFirstResult(startPage*pageSize);
		query.setMaxResults(pageSize);
		try{
			list = query.list();
		}catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int findCountByHql(String hql, List<Object> param) {
		List<?> list=null;
		Session session=sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);
		if(param!=null){
			for (int i = 0; i < param.size(); i++) {
				query.setParameter(i, param.get(i));
			}
		}
		try{
			list = query.list();
		}catch(Exception e){
			e.printStackTrace();
		}
		if(list!=null&&list.size()>0){
			return Integer.parseInt(String.valueOf(list.get(0)));
		}
		return 0;
	}

	@Override
	public List<T> findByHqlByTop(String hql, Integer topCount, List<Object> aList,
			Object... objects) {
		List<T> list=null;
		Session session=sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);
		if(objects!=null){
			for (int i = 0; i < objects.length; i++) {
				query.setParameter(i, objects[i]);
			}
		}
		if (aList != null && !aList.isEmpty()) {
			query.setParameterList("aList", aList);
		}
		query.setFirstResult(0);
		query.setMaxResults(topCount);
		try{
			list = query.list();
		}catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public Integer updateByHql(String hql, List<Object> param) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);
		if(param!=null){
			for (int i = 0; i < param.size(); i++) {
				query.setParameter(i, param.get(i));
			}
		}
		return query.executeUpdate();
	}

	@Override
	public Integer updateByHql(String hql, List<Object> aList,
			Object... objects) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);
		if(objects!=null){
			for (int i = 0; i < objects.length; i++) {
				query.setParameter(i, objects[i]);
			}
		}
		if (aList != null && !aList.isEmpty()) {
			query.setParameterList("aList", aList);
		}
		return query.executeUpdate();
	}
}
