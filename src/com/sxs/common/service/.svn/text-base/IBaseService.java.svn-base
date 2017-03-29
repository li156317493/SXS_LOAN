package com.sxs.common.service;


import java.io.Serializable;
import java.util.List;

import com.sxs.common.dao.IBaseDao;
import com.sxs.common.model.IModel;

/**
 * 
 * @ClassName: IBaseService
 * @Description: 基础service接口
 * @author: tank
 * @date: 2017年2月17日 上午9:26:20
 * @param <D>
 * @param <M>
 */
public interface IBaseService<D extends IBaseDao<M>,M extends IModel> {
	
	public D getBaseDao();
    
    public Serializable save(M model);

    public void saveOrUpdate(M model);
    
    public void update(M model);

    public void delete(Serializable id);

    public void deleteObject(M model);

    public M get(Serializable id);
    
    public int countAll();
    
    public List<M> listAll();
    
}
