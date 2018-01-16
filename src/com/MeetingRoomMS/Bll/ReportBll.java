package com.MeetingRoomMS.Bll;

import java.text.DecimalFormat;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder.In;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.MeetingRoomMS.Dao.ReportDao;
import com.MeetingRoomMS.Dao.RoomDao;
import com.MeetingRoomMS.Dao.UserDao;
import com.MeetingRoomMS.Entity.Report;
import com.MeetingRoomMS.Entity.room;
import com.MeetingRoomMS.Entity.user;

import com.MeetingRoomMS.Tool.DateUtil;
import com.MeetingRoomMS.Tool.Sort2;
public class ReportBll {

	
	public JSONArray getRoomUsage(int typeid,String from,String to){
		
//		   StringBuffer sql=new StringBuffer("select Room.roomid,Room.room,ISNULL(amount,0) as amount from ((select Meeting.roomid,room,count(*) as amount from Meeting,Room where status=2 and act_starttime>='"+from+"' and act_endtime<='"+to+"'");
//		    if(userid!=0){
//			   sql.append(" and userid="+userid);
//		    }
//		   sql.append(" and Meeting.roomid=Room.roomid GROUP BY Meeting.roomid,room) as t1 RIGHT OUTER JOIN  Room on t1.roomid=Room.roomid)");
		
	
		JSONArray arrall=new JSONArray();
		String  from1=from+" 00:00:00";
		String to1=to+" 59:59:59";
		 List<room> roomlist=null;
		if(typeid!=0){
		   roomlist=new RoomDao().getRoomInfoType(typeid);
		}else{
		  roomlist=new RoomDao().getRoomInfo();
		}
		StringBuffer sql=null;
	    for(room rm:roomlist){
	    	int count[]=new int[] {0,0,0,0,0,0,0,0,0};
	     	  sql=new StringBuffer("select meetingid,act_starttime,act_endtime,sch_starttime,sch_endtime,room from Meeting,Room where status=1 and Room.roomid=Meeting.roomid and Meeting.roomid="+rm.getRoomid()+" and act_starttime>='"+from1+"' and act_endtime<='"+to1+"'");
			  
			 // System.out.println(sql.toString());
			  JSONArray arr =new ReportDao().getReportBy(sql.toString());

		      for(int j=0;j<arr.size();j++){
				 //System.out.println(arr.getJSONObject(j).getString("room")+"--"+arr.getJSONObject(j).getString("date")+"--"+arr.getJSONObject(j).getString("stime")+"--"+arr.getJSONObject(j).getString("etime"));
	
					   String acts=arr.getJSONObject(j).getString("stime").substring(0,2);
					   String acte=arr.getJSONObject(j).getString("etime").substring(0,2);
	 	               for(int i=Integer.parseInt(acts);i<=Integer.parseInt(acte);i++){
	 	            	   
	 	            	   if(i<Integer.parseInt(acte)){
	 	            		   if(i>Integer.parseInt(acts)){
	 	            			  count[i-9]+=60;         	
	 	            		   }else{
	 	            			  count[i-9]+=DateUtil.count(arr.getJSONObject(j).getString("stime"),(i+1)+":00");
	 	            		   }
	 	            	   }else{
	 	            		   count[i-9]+=Integer.parseInt(arr.getJSONObject(j).getString("etime").substring(3,5));
	 	            	   }
	 	        	     
	 	               }
	
			  }
			  		  
			  JSONObject o=new JSONObject();
			  o.put("room",rm.getRoom());
			  int i=1;
			  int amount=0;
			  DecimalFormat df = new DecimalFormat("0.0");
			  for (int a : count) {
		        o.put(convert(i),df.format((float)a/60));
		        amount+=a;
		        i++;
		      }
			  o.put("amount",df.format((float)amount/60));
			  arrall.add(o);
			  
			
		}
	    return new Sort2().sorted(arrall);
	 
		
	}
	
	public String convert(int n){

		switch (n){
			case 1:return "one";
			case 2:return "two";
			case 3:return "three";
			case 4:return "four";
			case 5:return "five";
			case 6:return "six";
			case 7:return "seven";
			case 8:return "eight";
			default:return "";
		}

	}
	public String convert1(int n){

		switch (n){
			case 1:return "one1";
			case 2:return "two1";
			case 3:return "three1";
			case 4:return "four1";
			case 5:return "five1";
			case 6:return "six1";
			case 7:return "seven1";
			case 8:return "eight1";
			default:return "";
		}

	}
	
	public JSONArray getUserUsage(int userid,String from,String to){
		
//		   StringBuffer sql=new StringBuffer("select Room.roomid,Room.room,ISNULL(amount,0) as amount from ((select Meeting.roomid,room,count(*) as amount from Meeting,Room where status=2 and act_starttime>='"+from+"' and act_endtime<='"+to+"'");
//		    if(userid!=0){
//			   sql.append(" and userid="+userid);
//		    }
//		   sql.append(" and Meeting.roomid=Room.roomid GROUP BY Meeting.roomid,room) as t1 RIGHT OUTER JOIN  Room on t1.roomid=Room.roomid)");
		
	
		JSONArray arrall=new JSONArray();
		String  from1=from+" 00:00:00";
		String to1=to+" 59:59:59";
		JSONArray userarr=new UserDao(). getUserById(userid);

		StringBuffer sql=null;
	    for(int x=1;x<userarr.size();x++){
	    	  int count[]=new int[] {0,0,0,0,0,0,0,0,0};
	    	  int count1[]=new int[] {0,0,0,0,0,0,0,0,0};
	     	  sql=new StringBuffer("select meetingid,act_starttime,act_endtime,sch_starttime,sch_endtime,name from Meeting,Users where status=1 and Users.userid=Meeting.userid and Meeting.userid="+userarr.getJSONObject(x).get("userid")+" and act_starttime>='"+from1+"' and act_endtime<='"+to1+"'");
			 // System.out.println(sql.toString());
			  JSONArray arr =new ReportDao().getReportBy2(sql.toString());

		      for(int j=0;j<arr.size();j++){
				 //System.out.println(arr.getJSONObject(j).getString("room")+"--"+arr.getJSONObject(j).getString("date")+"--"+arr.getJSONObject(j).getString("stime")+"--"+arr.getJSONObject(j).getString("etime"));
		    	      String schs1=arr.getJSONObject(j).getString("stime1").substring(0,2);
				      String sche1=arr.getJSONObject(j).getString("etime1").substring(0,2);
					   String acts=arr.getJSONObject(j).getString("stime").substring(0,2);
					   String acte=arr.getJSONObject(j).getString("etime").substring(0,2);
	 	               for(int i=Integer.parseInt(acts);i<=Integer.parseInt(acte);i++){
	 	            	   
	 	            	   if(i<Integer.parseInt(acte)){
	 	            		   if(i>Integer.parseInt(acts)){
	 	            			  count[i-9]+=60;         	
	 	            		   }else{
	 	            			  count[i-9]+=DateUtil.count(arr.getJSONObject(j).getString("stime"),(i+1)+":00");
	 	            		   }
	 	            	   }else{
	 	            		   count[i-9]+=Integer.parseInt(arr.getJSONObject(j).getString("etime").substring(3,5));
	 	            	   }
	 	        	     
	 	               }
	 	              for(int a=Integer.parseInt(schs1);a<=Integer.parseInt(sche1);a++){
	 	            	   
	 	            	   if(a<Integer.parseInt(sche1)){
	 	            		   if(a>Integer.parseInt(schs1)){
	 	            			  count1[a-9]+=60;         	
	 	            		   }else{
	 	            			  count1[a-9]+=DateUtil.count(arr.getJSONObject(j).getString("stime1"),(a+1)+":00");
	 	            		   }
	 	            	   }else{
	 	            		   count1[a-9]+=Integer.parseInt(arr.getJSONObject(j).getString("etime1").substring(3,5));
	 	            	   }
	 	        	     
	 	               }
	
			  }
			  		  
			  JSONObject o=new JSONObject();
			  o.put("userid", userarr.getJSONObject(x).get("userid"));
			  o.put("name",userarr.getJSONObject(x).get("name"));
			  int i=1,b=1;
			  int amount=0;
			  DecimalFormat df = new DecimalFormat("0.0");
			  for (int a : count) {
		        o.put(convert(i),df.format((float)a/60));
		        amount+=a;
		        i++;
		      }
			  for (int a : count1) {
			        o.put(convert1(b),df.format((float)a/60));
			        b++;
			   }
			  o.put("amount",df.format((float)amount/60));
			  arrall.add(o);
			  
			
		}
	    return new Sort2().sorted(arrall);
	 
		
	}
	
	
	public static void main(String[] args) {
	
		System.out.println(new ReportBll().getUserUsage(0,"2017-03-22","2017-03-22"));
					
	}
}
