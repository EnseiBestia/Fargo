package com.fargo.basis.common.model;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;


public class OrderedMap<PK,T>  implements Map<PK,T>{
	List<PK> keyList=new ArrayList<PK>();
	List<T> list=new ArrayList<T>();
	Map<PK,T> map=new HashMap<PK,T>();
	
	public int size() {
		// TODO Auto-generated method stub
		return list.size();
	}
	
	public boolean isEmpty() {
		// TODO Auto-generated method stub
		return list.size()==0;
	}
	
	
	public Iterator<T> iterator() {
		// TODO Auto-generated method stub
		return list.iterator();
	}
	
	public Object[] toArray() {
		// TODO Auto-generated method stub
		return list.toArray();
	}
	
	public List<T> getList() {
		return list;
	}
	public List<PK> getKeyList() {
		return keyList;
	}
	public Map<PK, T> getMap() {
		return map;
	}

	public void clear() {
		// TODO Auto-generated method stub
		map.clear();
		list.clear();
		keyList.clear();
	}

	@Override
	public boolean containsKey(Object key) {
		// TODO Auto-generated method stub
		return map.containsKey(key);
	}

	@Override
	public boolean containsValue(Object value) {
		// TODO Auto-generated method stub
		return map.containsValue(value);
	}

	@Override
	public T get(Object key) {
		// TODO Auto-generated method stub
		return map.get(key);
	}

	@Override
	public T put(PK key, T value) {
		// TODO Auto-generated method stub
		if(!map.containsKey(key)){
			keyList.add(key);
			list.add(value);
			map.put(key, value);
			return value;
		}
		return value;
	}

	@Override
	public T remove(Object key) {
		// TODO Auto-generated method stub
		if(map.containsKey(key)){
			keyList.remove(key);
			list.remove(map.get(key));
			return map.remove(key);
		}
		return null;
	}

	@Override
	public void putAll(Map<? extends PK, ? extends T> m) {
		// TODO Auto-generated method stub
		if(m!=null){
			for(PK key:m.keySet()){
				this.put(key, m.get(key));
			}
		}
	}

	@Override
	public Set<PK> keySet() {
		// TODO Auto-generated method stub
		return map.keySet();
	}

	@Override
	public Collection<T> values() {
		// TODO Auto-generated method stub
		return list;
	}

	@Override
	public Set<java.util.Map.Entry<PK, T>> entrySet() {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
}
