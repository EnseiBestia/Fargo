package com.fargo.basis.service;

import java.io.Serializable;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.fargo.basis.common.model.PaginatedListHelper;
import com.fargo.basis.common.model.SearchConditionValue;


public interface GenericManager<T, PK extends Serializable> {
	  /**
     * Generic method used to get all objects of a particular type. This
     * is the same as lookup up all rows in a table.
     * @return List of populated objects
     */
    List<T> find(SearchConditionValue searchValue);
    List<T> find(Long library,SearchConditionValue searchValue);
    
    List<T> getAll();
    List<T> getAll(Long library);
    
    PaginatedListHelper<T> find(int currentPage,int pageSize,SearchConditionValue searchValue);
    PaginatedListHelper<T> find(int currentPage,int pageSize,String orderType,SearchConditionValue searchValue);
    PaginatedListHelper<T> find(int currentPage,int pageSize,Long library,SearchConditionValue searchValue);
    PaginatedListHelper<T> find(int currentPage,int pageSize,Long library,String orderType,SearchConditionValue searchValue);
    PaginatedListHelper<T> getAll(int currentPage,int pageSize);
    PaginatedListHelper<T> getAll(int currentPage,int pageSize,Long library);
    
    Long count(SearchConditionValue searchValue);
    Long count(Long library,SearchConditionValue searchValue);
    T get(PK id);

    boolean exists(PK id);
    void saveMainBody(T object);
    T save(T object);
    void remove(T object);

    void remove(PK id);
    @Deprecated
    public List<T> findByDetachedCriteria(DetachedCriteria detachedCriteria);
}
