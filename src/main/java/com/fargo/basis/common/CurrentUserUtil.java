package com.fargo.basis.common;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;

import com.fargo.basis.model.AuthUser;


public class CurrentUserUtil {
	public static UserDetails getCurrentUserDetail(){
		return (UserDetails)getCurrentUser();
	}
	public static AuthUser getCurrentUser(){
		return getCurrentUser(SecurityContextHolder.getContext()
			    .getAuthentication());
	}
	
	
	private static AuthUser getCurrentUser(Authentication auth) {
	//	System.out.println();
		AuthUser currentUser=null;
        if(auth==null){
        	currentUser=null;
        }else if (auth.getPrincipal() instanceof UserDetails) {
        //	System.out.println("======================auth.getPrincipal():"+auth.getPrincipal().getClass());
            currentUser = (AuthUser) auth.getPrincipal();
        } else if (auth.getDetails() instanceof UserDetails) {
        //	System.out.println("======================auth.getPrincipal():"+auth.getPrincipal().getClass());
            currentUser = (AuthUser) auth.getDetails();
        } else {
            return null;
        }
        return currentUser;
    }
	

}
