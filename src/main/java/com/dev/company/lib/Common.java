package com.dev.company.lib;

import java.util.HashMap;
import java.util.Map;

import org.json.JSONObject;

public class Common {

	
	public static String keyVal(String data, String statusKey, String statusVal){
	        String statusKeys[] = statusKey.split(","); // key
	        String statusVals[] = statusVal.split(","); // value
	        
	        
	        Map<String, Object> map = new HashMap<String, Object>();
	        
	        for(int i=0; i < statusKeys.length; i++) {
	        	map.put(statusKeys[i], statusVals[i]);  // 원하는 key,val 배열에 담기
	        }
	        String dataVal = (String)map.get(data);  //val 출력
	        return dataVal;
	}
	
	
	public static void main(String args[]) {
//		department("2","1,2,3","원,투,쓰리");
//		String data = "{'15' : '일'}";
//		JSONObject jsonObject = new JSONObject(data);
//		Map<String, Object> map = jsonObject.toMap();
//		System.out.println(map.get("15"));
	}
}
