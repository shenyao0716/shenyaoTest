package com.MeetingRoomMS.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.MeetingRoomMS.Entity.meeting;
import com.MeetingRoomMS.Tool.DBConn;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class ReportDao {

	private Connection conn;
	private PreparedStatement prst;
	private ResultSet rs;
	
	
	
	
   public JSONArray getReportBy(String sql){
	    conn=DBConn.getCon();
		JSONArray arr=new JSONArray();
		try {
			
			prst=conn.prepareStatement(sql);
	
			rs=prst.executeQuery();
			JSONObject o=null;
			while(rs.next())
			{
				o=new JSONObject();
                o.put("meetingid",rs.getInt("meetingid"));
                o.put("room",rs.getString("room"));
                o.put("date",rs.getString("act_starttime").substring(0,10));
                
                o.put("stime",rs.getString("act_starttime").substring(11,16));
                o.put("etime",rs.getString("act_endtime").substring(11,16));
                o.put("stime1",rs.getString("sch_starttime").substring(11,16));
                o.put("etime1",rs.getString("sch_endtime").substring(11,16));
                arr.add(o);
			}
			return arr;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}finally{
			DBConn.closeDB(conn, prst, rs);
		}
	   
   }
	
   public JSONArray getReportBy2(String sql){
	    conn=DBConn.getCon();
		JSONArray arr=new JSONArray();
		try {
			
			prst=conn.prepareStatement(sql);
	
			rs=prst.executeQuery();
			JSONObject o=null;
			while(rs.next())
			{
				o=new JSONObject();
               o.put("meetingid",rs.getInt("meetingid"));
               o.put("name",rs.getString("name"));
               o.put("date",rs.getString("act_starttime").substring(0,10));
               
               o.put("stime",rs.getString("act_starttime").substring(11,16));
               o.put("etime",rs.getString("act_endtime").substring(11,16));
               o.put("stime1",rs.getString("sch_starttime").substring(11,16));
               o.put("etime1",rs.getString("sch_endtime").substring(11,16));
               arr.add(o);
			}
			return arr;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}finally{
			DBConn.closeDB(conn, prst, rs);
		}
	   
  }
}
