package com.fargo.basis.webapp.util.displaytable;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

public class PageTools {

	public static int getPageSizeOfUserForm(HttpServletRequest request,
			String formName) {
		// TODO Auto-generated method stub
		Cookie[] cookies = request.getCookies();
		int size=10;
        for(Cookie c :cookies ){
      //      System.out.println(c.getName()+"--->"+c.getValue());
            
            if(c.getName()!=null && c.getName().equals(formName+"-pageSize")){
            	size= Integer.parseInt(c.getValue());
            }
        }
		return size;
	}

}