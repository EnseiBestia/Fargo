package com.fargo.basis.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;


@Entity
public class CfgCustomValue implements Serializable{
	
	@Id
	private Long customValueId;
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String value;
	private List<CfgCustomValue> childen=new ArrayList<CfgCustomValue>();
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	public List<CfgCustomValue> getChilden() {
		return childen;
	}
	public void setChilden(List<CfgCustomValue> childen) {
		this.childen = childen;
	}
	public CfgCustomValue(){
		
	}
	public CfgCustomValue(String value1){
		this.value=value1;
	}
}
