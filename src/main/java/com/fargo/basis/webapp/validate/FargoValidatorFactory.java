package com.fargo.basis.webapp.validate;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.config.AbstractFactoryBean;
import org.springframework.core.io.Resource;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;
import org.springmodules.validation.commons.DefaultValidatorFactory;

public class FargoValidatorFactory extends DefaultValidatorFactory{
	public FargoValidatorFactory(){
		super();
		//this.getValidator(beanName, bean, errors)
	}
	public org.apache.commons.validator.Validator  getValidator(String beanName, Object bean, Errors errors){
		org.apache.commons.validator.Validator v= super.getValidator(beanName, bean, errors);
		return v;
	}

}
