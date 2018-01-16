package com.MeetingRoomMS.Tool;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

public class DateUtil {

	
    
	public  static  Date strToDate(String strdate){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); 
		try{
		    Date date = sdf.parse(strdate);
		    return date;
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	public  static String dateToString(Date date){
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return format.format(date); 
	}
    public static  String nextDay(String date){      //把日期往后增加一天
    	Calendar  calendar=new  GregorianCalendar(); 
	    calendar.setTime(strToDate(date)); 
	    calendar.add(calendar.DATE,1);
		return  dateToString(calendar.getTime());
    }
    
    public  static boolean isInTime(String time,String mintime,String maxtime){
		SimpleDateFormat sdf =   new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			Calendar cjgt=Calendar.getInstance();
			Calendar cleft=Calendar.getInstance();
			Calendar cright=Calendar.getInstance();
			cjgt.setTime(sdf.parse(time));
			cleft.setTime(sdf.parse(mintime));
			cright.setTime(sdf.parse(maxtime));
			
			if((cjgt.compareTo(cleft)>=0)&&(cjgt.compareTo(cright)<=0) ){
				return true;
			}
			
			  return false;
		} catch (ParseException e) {
			// TODO ted catch blockAuto-genera
			e.printStackTrace();
			return false;
		}	
    }
    
    public static int count(String t1,String t2){
    	int time=0;
    	SimpleDateFormat sdf =   new SimpleDateFormat("HH:mm");
		try {
			 Date tstart = sdf.parse(t1);
			 Date tstop=sdf.parse(t2);
			 
			 time+=(tstop.getTime()-tstart.getTime());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		  return time/60000;
    }
    
    public static void main(String[] args) {
		 System.out.println(DateUtil.count("9:00","10:23"));
	}
}
