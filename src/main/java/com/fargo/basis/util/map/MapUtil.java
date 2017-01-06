package com.fargo.basis.util.map;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class MapUtil {
	public static void appendListEntityToMap(Map map,Object key,Object obj){
		if(!map.containsKey(key)){
			map.put(key, new ArrayList());
		}
		((ArrayList) map.get(key)).add(obj);
	}
	
	public static void appendMapEntityToMap(Map map,Object key,Object childKey,Object obj){
		if(!map.containsKey(key)){
			map.put(key, new HashMap());
		}
		((HashMap) map.get(key)).put(childKey,obj);
	}
}
