package com.MeetingRoomMS.Tool;

import java.util.Collections;
import java.util.Comparator;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class Sort2 implements Comparator<JSONObject>{


		@Override
		public int compare(JSONObject o1, JSONObject o2) {
			int flag=(int)(Double.parseDouble(o1.getString("amount"))-Double.parseDouble(o2.getString("amount")))*10;
			if(flag<0){return 1;}
	        
	        else if(flag>0){return -1;}
	        
	        else{return 0;}
		}
		
		public  JSONArray sorted(JSONArray arr){
	    
			  
			    Sort2 comparator =new Sort2();
			    Collections.sort(arr,comparator);       
				return arr;	   
		}


}
