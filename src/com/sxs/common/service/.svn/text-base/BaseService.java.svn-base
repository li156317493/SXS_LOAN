package com.sxs.common.service;

import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.sxs.common.dao.IBaseDao;
import com.sxs.common.model.IModel;

/**
 * 
 * @ClassName: BaseService
 * @Description: 基础service的实现
 * @author: tank
 * @date: 2017年2月17日 上午9:26:09
 * @param <D>
 * @param <M>
 */
public class BaseService<D extends IBaseDao<M>,M extends IModel> implements IBaseService<D,M> {
    
	private D baseDao;
	
	@Autowired(required = true)
	public void setBaseDao(D baseDao){
		this.baseDao = baseDao;
	}
   
	@Override
	public D getBaseDao() {
		return baseDao;
	}

	@Override
    public Serializable save(M model) {
        return baseDao.save(model);
    }

    @Override
    public void saveOrUpdate(M model) {
        baseDao.saveOrUpdate(model);
    }

    @Override
    public void update(M model) {
        baseDao.update(model);
    }
    
    @Override
    public void delete(Serializable id) {
        baseDao.deleteById(id);
    }

    @Override
    public void deleteObject(M model) {
        baseDao.delete(model);;
    }

    @Override
    public M get(Serializable id) {
        return (M) baseDao.get(id);
    }

   
    
    @Override
    public int countAll() {
        return baseDao.findAllCount();
    }

    @Override
    public List<M> listAll() {
        return baseDao.findAll();
    }
    
}
