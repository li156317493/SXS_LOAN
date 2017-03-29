package com.sxs.common.dao;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;

import com.sxs.common.model.IModel;

/**
 * 
 * @ClassName: IBaseDao
 * @Description: 数据库操作接口类，封装数据操作的基本方法
 * @author: tank
 * @date: 2017年2月17日 上午9:24:48
 * @param <T>
 */
public interface IBaseDao<T extends IModel> {
	
	/**
	 * 保存实例
	 * @param t
	 * @throws HibernateException
	 */
public Serializable save(T t);
	
    /**
	 * 修改实例
	 * @param t
	 * @throws HibernateException
	 */
public void update(T t);
	
    /**
	 * 更新或保存
	 * @param t
	 */
public void saveOrUpdate(T t);
	
    /**
	 * 删除实例
	 * 
	 * @param t
	 * @throws HibernateException
	 */
public void delete(T t);
	
    /**
	 * 删除实例
	 * 
	 * @param id
	 * @throws HibernateException
	 */
public int deleteById(Serializable id);
	
    /**
	 * 获取实例
	 * 
 	 * @param id
	 * @throws HibernateException
	 */
public T get(Serializable id);
	
    /**
	 * 查询全部
	 * 
	 * @throws HibernateException
	 */
public List<T> findAll();
	
    /**
	 * 查询总数
	 * 
	 * @throws HibernateException
	 */
public Integer findAllCount();
	
    /**
	 * QBC查询
	 * 
	 * @param criteria
	 * @throws HibernateException
	 */
public List<T> findByCriteria(Criteria criteria);
	
	/**
	 * QBE查询
	 * 
	 * @param t
	 * @throws HibernateException
	 */
public List<T> findByExample(T t);
	
    /**
	 * HQL查询
	 * 
	 * @param hql
	 * @param objects
	 * @throws HibernateException
	 */
public List<Object[]> findByHql(String hql,final Object...objects);
public List<Object[]> findByHql(String hql);
	
    /**
	 * SQL查询
	 * 
	 * @param hql
	 * @param objects
	 * @throws HibernateException
	 */
public List<Object[]> findBySql(String sql,final Object...objects);
public List<Object[]> findBySql(String sql);
	
    /**
	 * hql查询，返回对象列表
	 * @param hql
	 * @param objects
	 * @author ducx
	 */
public List<T> findObjListByHql(String hql,final Object...objects);
public List<T> findObjListByHql(String hql, List<Object> aList, Object... objects);
public List<T> findObjListByHql(String hql, List<Object> objects);
public List<T> findObjListByHql(String hql);
	
    /**
	 * hql查询，返回对象
	 * @param hql
	 * @param objects
	 * @return
	 */
public T findObjectByHql(String hql,final Object...objects);
public T findObjectByHql(String hql);
	
    /**
	 * 分页查寻，统计总数量
	 * @param hql
	 * @param param
	 * @return
	 */
public List<T> findObjListByHqlByPage(String hql,List<Object> param);
public int findCountByHql(String hql,List<Object> param);
	
    /**
	 * 分页查寻，返回数组
	 * @param hql
	 * @param param
	 * @return
	 */
public List<Object[]> findBySqlByPage(String sql, List<Object> param);
	
    /**
	 * 分页查询，加入List查询参数
	 * @param hql
	 * @param paramList
	 * @param param
	 * @return
	 */
public List<T> findObjListByHqlByPage(String hql,List<Object> paramList, List<Object> param);
	
	/**
	 * 获取前n位数据
	 * @param hql
	 * @param topCount
	 * @param objects
	 * @return
	 */
public List<T> findByHqlByTop(String hql, Integer topCount, List<Object> aList, final Object... objects);
	
	/**
	 * 根据hql语句更新
	 * @param hql
	 * @param param
	 * @return
	 */
public Integer updateByHql(String hql, List<Object> param);
	
	/**
	 * 根据hql语句更新
	 * @param hql
	 * @param aList
	 * @param objects
	 * @return
	 */
public Integer updateByHql(String hql, List<Object> aList, final Object... objects);
}
