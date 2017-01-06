package com.fargo.basis.dao.st;

import org.hibernate.Criteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.fargo.basis.common.model.SearchConditionValue;
import com.fargo.basis.dao.hibernate.GenericDaoHibernate;
import com.fargo.basis.model.LibraryInfo;


@Repository("libraryInfoDao")
public class LibraryInfoDaoHibernate extends GenericDaoHibernate<LibraryInfo, Long> implements LibraryInfoDao {

    public LibraryInfoDaoHibernate() {
         super(LibraryInfo.class);
    }
	@Override
	public void saveMainBody(LibraryInfo libraryInfo)  {
		LibraryInfo libraryInfo2=super.get(libraryInfo.getLibraryId());
		if(libraryInfo!=null && libraryInfo2!=null){
		}	
		super.save(libraryInfo);
        
	}
	@Override
	protected void assembleQryParam(SearchConditionValue searchValue,
			Criteria cr) {
		if(searchValue.getTextValue()!=null && !"".equals(searchValue.getTextValue())){
			cr.add(Restrictions.or(Restrictions.like("identification", searchValue.getTextValue(),MatchMode.ANYWHERE),
						Restrictions.like("libraryName", searchValue.getTextValue(),MatchMode.ANYWHERE),
						Restrictions.like("path", searchValue.getTextValue(),MatchMode.ANYWHERE)));
    	}
	}    
}
