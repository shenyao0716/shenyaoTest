package com.MeetingRoomMS.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;





import com.MeetingRoomMS.Entity.cutimg;
import com.MeetingRoomMS.Entity.meeting;
import com.MeetingRoomMS.Tool.BaseDao;
import com.MeetingRoomMS.Tool.DBConn;

public class MeetingDao {

	private Connection conn;
	private PreparedStatement prst;
	private ResultSet rs;
	
	
    public String getTimeDuan(String a,String b){
    	String bb=a.substring(11, 16)+"--"+b.substring(11, 16);
//		System.out.println(bb);
		return bb;
    }
	
	
	public int deleteAdvanceM(int id,String reason,String admin){
		conn=DBConn.getCon();
		try {
			prst=conn.prepareStatement("update Meeting set status=3,memo=?,cancelperson=? where meetingid=?");
			prst.setString(1, reason);
			prst.setString(2, admin);
			prst.setInt(3, id);
			
			prst.executeUpdate();
		    return 1;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
	    	   return 0;
		}finally{
		       DBConn.closeDB(conn, prst, rs);
	      }
	}
	
	public int overfeedback(int id,String reason){
		conn=DBConn.getCon();
		try {
			prst=conn.prepareStatement("update Meeting set memo=? where meetingid=?");
			prst.setString(1, reason);
			prst.setInt(2, id);
			
			prst.executeUpdate();
		    return 1;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
	    	   return 0;
		}finally{
		       DBConn.closeDB(conn, prst, rs);
	      }
	}
	
	public int deleteOverM(int id){
		conn=DBConn.getCon();
		try {
			prst=conn.prepareStatement("delete from Meeting where meetingid="+id);
			prst.executeUpdate();
		    return 1;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
	    	   return 0;
		}finally{
		       DBConn.closeDB(conn, prst, rs);
	      }
	}
	
	public String getTypeRoomCapacity(int id){
		conn=DBConn.getCon();
		String capa=null;
		try {			
				prst=conn.prepareStatement("select capacity from Room where roomid=?");
				prst.setInt(1, id);
				rs=prst.executeQuery();
				if(rs.next())
				{
					capa=rs.getString("capacity");
					return capa;
				}else
				{return null;}			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}finally{
			DBConn.closeDB(conn, prst, rs);
		}
	}
	
	public String getTypeRoomName(int id){
		conn=DBConn.getCon();
		String room=null;
		try {			
				prst=conn.prepareStatement("select room from Room where roomid=?");
				prst.setInt(1, id);
				rs=prst.executeQuery();
				if(rs.next())
				{
					room=rs.getString("room");
					return room;
				}else
				{return null;}			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}finally{
			DBConn.closeDB(conn, prst, rs);
		}
	}
	
	public List<cutimg> getMeetImg(int id){
		conn=DBConn.getCon();
		List<cutimg> list=new ArrayList<cutimg>();
		try {			
				prst=conn.prepareStatement("select status,imgsrc from CutImg where meetingid=?");
				prst.setInt(1, id);
				rs=prst.executeQuery();
				while(rs.next())
				{
					cutimg ct=new cutimg();
					ct.setStatus(rs.getInt("status"));
					ct.setImgsrc(rs.getString("imgsrc"));
					list.add(ct);
					
				}		
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			DBConn.closeDB(conn, prst, rs);
		}
			return list;
	}
	
	public String getTypeRoomAddress(int id){
		conn=DBConn.getCon();
		String addr=null;
		try {			
				prst=conn.prepareStatement("select address from Room where roomid=?");
				prst.setInt(1, id);
				rs=prst.executeQuery();
				if(rs.next())
				{
					addr=rs.getString("address");
					return addr;
				}else{return null;}			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}finally{
			DBConn.closeDB(conn, prst, rs);
		}
	}
	
	public String getUserName(int id){
		conn=DBConn.getCon();
		String name=null;
		try {			
				prst=conn.prepareStatement("select name from Users where userid=?");
				prst.setInt(1, id);
				rs=prst.executeQuery();
				if(rs.next())
				{
					name=rs.getString("name");
					return name;
				}else
				{return null;}			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}finally{
			DBConn.closeDB(conn, prst, rs);
		}
	}	
	
	public List<meeting> getAdvancceMeetZero(String s,String e){
		conn=DBConn.getCon();
		List<meeting> list=new ArrayList<meeting>();
		try {
			prst=conn.prepareStatement("select * from Meeting where status=0 and sch_starttime>=? and sch_starttime<=?");
			prst.setString(1, s);
			prst.setString(2, e);
			rs=prst.executeQuery();
			while(rs.next())
			{
				meeting m=new meeting();
				m.setMeetingid(rs.getInt("meetingid"));
				m.setStatus(rs.getInt("status"));
				m.setSch_startime(getTimeDuan(rs.getString("sch_starttime"),rs.getString("sch_endtime")));
				m.setSch_endtime(rs.getString("sch_endtime").substring(0, 10));
				m.setRoomid(rs.getInt("roomid"));
				m.setAct_starttime(rs.getString("act_starttime"));
				m.setAct_endtime(rs.getString("act_endtime"));
				m.setUserid(rs.getInt("userid"));
				m.setContent(rs.getString("content"));
				m.setMemo(rs.getString("memo"));
				m.setCode(rs.getString("code"));
				m.setAttendence(rs.getInt("attendance"));
				
				list.add(m);
			}
		} catch (Exception e1) {
			// TODO: handle exception
			e1.printStackTrace();
		}finally{
			DBConn.closeDB(conn, prst, rs);
		}
			return list;
	}
	
	public List<meeting> getAdvancceMeetOne(){
		conn=DBConn.getCon();
		List<meeting> list=new ArrayList<meeting>();
		try {
			prst=conn.prepareStatement("select * from Meeting where status=1");
			rs=prst.executeQuery();
			while(rs.next())
			{
				meeting m=new meeting();
				m.setMeetingid(rs.getInt("meetingid"));
				m.setStatus(rs.getInt("status"));
				//getTimeDuan(rs.getString("sch_starttime"),rs.getString("sch_endtime"));
				m.setSch_startime(getTimeDuan(rs.getString("sch_starttime"),rs.getString("sch_endtime")));
				m.setSch_endtime(rs.getString("sch_endtime").substring(0, 10));
				m.setRoomid(rs.getInt("roomid"));
				m.setAct_starttime(rs.getString("act_starttime"));
				m.setAct_endtime(rs.getString("act_endtime"));
				m.setUserid(rs.getInt("userid"));
				m.setContent(rs.getString("content"));
				m.setMemo(rs.getString("memo"));
				m.setCode(rs.getString("code"));
				m.setAttendence(rs.getInt("attendance"));
				
				list.add(m);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			DBConn.closeDB(conn, prst, rs);
		}
			return list;
	}
	
	public List<meeting> getAdvancceMeetTwo(String s,String e){
		conn=DBConn.getCon();
		List<meeting> list=new ArrayList<meeting>();
		try {
			prst=conn.prepareStatement("select * from Meeting where status=2 and sch_starttime>=? and sch_starttime<=?");
			prst.setString(1, s);
			prst.setString(2, e);
			rs=prst.executeQuery();
			while(rs.next())
			{
				meeting m=new meeting();
				m.setMeetingid(rs.getInt("meetingid"));
				m.setStatus(rs.getInt("status"));
				m.setSch_startime(getTimeDuan(rs.getString("sch_starttime"),rs.getString("sch_endtime")));
				m.setSch_endtime(rs.getString("sch_endtime").substring(0, 10));
				m.setRoomid(rs.getInt("roomid"));
				m.setAct_starttime(getTimeDuan(rs.getString("sch_starttime"),rs.getString("sch_endtime")));
				m.setAct_endtime(rs.getString("act_endtime").substring(11, 16));
				m.setUserid(rs.getInt("userid"));
				m.setContent(rs.getString("content"));
				m.setMemo(rs.getString("memo"));
				m.setCode(rs.getString("code"));
				m.setAttendence(rs.getInt("attendance"));
				
				list.add(m);
			}
		} catch (Exception e1) {
			// TODO: handle exception
			e1.printStackTrace();
		}finally{
			DBConn.closeDB(conn, prst, rs);
		}
			return list;
	}
	
	public List<meeting> getChooseTypeTwo(int id,String sdate,String edate){
		conn=DBConn.getCon();
		List<meeting> list=new ArrayList<meeting>();
		try {
			prst=conn.prepareStatement("select * from Meeting where status=0 and userid=? and sch_starttime>=? and sch_starttime<=?");
			prst.setInt(1, id);
			prst.setString(2, sdate);
			prst.setString(3, edate);
			rs=prst.executeQuery();
			while(rs.next())
			{
				meeting m=new meeting();
				m.setMeetingid(rs.getInt("meetingid"));
				m.setStatus(rs.getInt("status"));
				m.setSch_startime(getTimeDuan(rs.getString("sch_starttime"),rs.getString("sch_endtime")));
				m.setSch_endtime(rs.getString("sch_endtime").substring(0, 10));
				m.setRoomid(rs.getInt("roomid"));
				m.setAct_starttime(rs.getString("act_starttime"));
				m.setAct_endtime(rs.getString("act_endtime"));
				m.setUserid(rs.getInt("userid"));
				m.setContent(rs.getString("content"));
				m.setMemo(rs.getString("memo"));
				m.setCode(rs.getString("code"));
				m.setAttendence(rs.getInt("attendance"));
				
				list.add(m);
				
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			DBConn.closeDB(conn, prst, rs);
		}
		                                      
		return list;		
	}
	
	public List<meeting> getChooseTypeThree(int id,String sdate,String edate){
		conn=DBConn.getCon();
		List<meeting> list=new ArrayList<meeting>();
		try {
			prst=conn.prepareStatement("select * from Meeting where status=0 and roomid in(select roomid from Room where typeid=?) and sch_starttime>=? and sch_starttime<=?");
			prst.setInt(1, id);
			prst.setString(2, sdate);
			prst.setString(3, edate);
			rs=prst.executeQuery();
			while(rs.next())
			{
				meeting m=new meeting();
				m.setMeetingid(rs.getInt("meetingid"));
				m.setStatus(rs.getInt("status"));
				m.setSch_startime(getTimeDuan(rs.getString("sch_starttime"),rs.getString("sch_endtime")));
				m.setSch_endtime(rs.getString("sch_endtime").substring(0, 10));
				m.setRoomid(rs.getInt("roomid"));
				m.setAct_starttime(rs.getString("act_starttime"));
				m.setAct_endtime(rs.getString("act_endtime"));
				m.setUserid(rs.getInt("userid"));
				m.setContent(rs.getString("content"));
				m.setMemo(rs.getString("memo"));
				m.setCode(rs.getString("code"));
				m.setAttendence(rs.getInt("attendance"));
				
				list.add(m);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			DBConn.closeDB(conn, prst, rs);
		}
			return list;		
	}
	public List<meeting> getChooseTypeFour(int id,int idd,String sdate,String edate){
		conn=DBConn.getCon();
		List<meeting> list=new ArrayList<meeting>();
		try {
			prst=conn.prepareStatement("select * from Meeting where status=0 and roomid in(select roomid from Room where typeid=?) and userid=? and sch_starttime>=? and sch_starttime<=?");
			prst.setInt(1, id);
			prst.setInt(2, idd);
			prst.setString(3, sdate);
			prst.setString(4, edate);
			rs=prst.executeQuery();
			while(rs.next())
			{
				meeting m=new meeting();
				m.setMeetingid(rs.getInt("meetingid"));
				m.setStatus(rs.getInt("status"));
				m.setSch_startime(getTimeDuan(rs.getString("sch_starttime"),rs.getString("sch_endtime")));
				m.setSch_endtime(rs.getString("sch_endtime").substring(0, 10));
				m.setRoomid(rs.getInt("roomid"));
				m.setAct_starttime(rs.getString("act_starttime"));
				m.setAct_endtime(rs.getString("act_endtime"));
				m.setUserid(rs.getInt("userid"));
				m.setContent(rs.getString("content"));
				m.setMemo(rs.getString("memo"));
				m.setCode(rs.getString("code"));
				m.setAttendence(rs.getInt("attendance"));
				
				list.add(m);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			DBConn.closeDB(conn, prst, rs);
		}
			return list;		
	}
	
	public List<meeting> getIngUserTypeO(int id) {
		conn=DBConn.getCon();
		List<meeting> list=new ArrayList<meeting>();
		try {
			prst=conn.prepareStatement("select * from Meeting where userid=? and status=1");
			prst.setInt(1, id);
			rs=prst.executeQuery();
			while(rs.next())
			{
				meeting m=new meeting();
				m.setMeetingid(rs.getInt("meetingid"));
				m.setStatus(rs.getInt("status"));
				m.setSch_startime(getTimeDuan(rs.getString("sch_starttime"),rs.getString("sch_endtime")));
				m.setSch_endtime(rs.getString("sch_endtime").substring(0, 10));
				m.setRoomid(rs.getInt("roomid"));
				m.setAct_starttime(rs.getString("act_starttime"));
				m.setAct_endtime(rs.getString("act_endtime"));
				m.setUserid(rs.getInt("userid"));
				m.setContent(rs.getString("content"));
				m.setMemo(rs.getString("memo"));
				m.setCode(rs.getString("code"));
				m.setAttendence(rs.getInt("attendance"));
				
				list.add(m);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			DBConn.closeDB(conn, prst, rs);
		}
			return list;
	}
	
    public List<meeting> getOverChooseTypeTwo(int id,String sdate,String edate){
	conn=DBConn.getCon();
	List<meeting> list=new ArrayList<meeting>();
	try {
		prst=conn.prepareStatement("select * from Meeting where status=2 and userid=? and sch_starttime>=? and sch_starttime<=?");
		prst.setInt(1, id);
		prst.setString(2, sdate);
		prst.setString(3, edate);
		rs=prst.executeQuery();
		while(rs.next())
		{
			meeting m=new meeting();
			m.setMeetingid(rs.getInt("meetingid"));
			m.setStatus(rs.getInt("status"));
			m.setSch_startime(getTimeDuan(rs.getString("sch_starttime"),rs.getString("sch_endtime")));
			m.setSch_endtime(rs.getString("sch_endtime").substring(0, 10));
			m.setRoomid(rs.getInt("roomid"));
			m.setAct_starttime(rs.getString("act_starttime"));
			m.setAct_endtime(rs.getString("act_endtime"));
			m.setUserid(rs.getInt("userid"));
			m.setContent(rs.getString("content"));
			m.setMemo(rs.getString("memo"));
			m.setCode(rs.getString("code"));
			m.setAttendence(rs.getInt("attendance"));
			
			list.add(m);
		}
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}finally{
		DBConn.closeDB(conn, prst, rs);
	}
		return list;	
}

    public List<meeting> getOverChooseTypeThree(int id,String sdate,String edate){
	conn=DBConn.getCon();
	List<meeting> list=new ArrayList<meeting>();
	try {
		prst=conn.prepareStatement("select * from Meeting where status=2 and roomid in(select roomid from Room where typeid=?) and sch_starttime>=? and sch_starttime<=?");
		prst.setInt(1, id);
		prst.setString(2, sdate);
		prst.setString(3, edate);
		rs=prst.executeQuery();
		while(rs.next())
		{
			meeting m=new meeting();
			m.setMeetingid(rs.getInt("meetingid"));
			m.setStatus(rs.getInt("status"));
			m.setSch_startime(getTimeDuan(rs.getString("sch_starttime"),rs.getString("sch_endtime")));
			m.setSch_endtime(rs.getString("sch_endtime").substring(0, 10));
			m.setRoomid(rs.getInt("roomid"));
			m.setAct_starttime(rs.getString("act_starttime"));
			m.setAct_endtime(rs.getString("act_endtime"));
			m.setUserid(rs.getInt("userid"));
			m.setContent(rs.getString("content"));
			m.setMemo(rs.getString("memo"));
			m.setCode(rs.getString("code"));
			m.setAttendence(rs.getInt("attendance"));
			
			list.add(m);
			
		}
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}finally{
		DBConn.closeDB(conn, prst, rs);
	}
		return list;	
}
    public List<meeting> getOverChooseTypeFour(int id,int idd,String sdate,String edate){
	conn=DBConn.getCon();
	List<meeting> list=new ArrayList<meeting>();
	try {
		prst=conn.prepareStatement("select * from Meeting where status=2 and roomid in(select roomid from Room where typeid=?) and userid=? and sch_starttime>=? and sch_starttime<=?");
		prst.setInt(1, id);
		prst.setInt(2, idd);
		prst.setString(3, sdate);
		prst.setString(4, edate);
		rs=prst.executeQuery();
		while(rs.next())
		{
			meeting m=new meeting();
			m.setMeetingid(rs.getInt("meetingid"));
			m.setStatus(rs.getInt("status"));
			m.setSch_startime(getTimeDuan(rs.getString("sch_starttime"),rs.getString("sch_endtime")));
			m.setSch_endtime(rs.getString("sch_endtime").substring(0, 10));
			m.setRoomid(rs.getInt("roomid"));
			m.setAct_starttime(rs.getString("act_starttime"));
			m.setAct_endtime(rs.getString("act_endtime"));
			m.setUserid(rs.getInt("userid"));
			m.setContent(rs.getString("content"));
			m.setMemo(rs.getString("memo"));
			m.setCode(rs.getString("code"));
			m.setAttendence(rs.getInt("attendance"));
			
			list.add(m);
		}
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}finally{
		DBConn.closeDB(conn, prst, rs);
	}
		return list;	
}

    public List<meeting> getCancelChooseTypeTwo(int id,String sdate,String edate){
	conn=DBConn.getCon();
	List<meeting> list=new ArrayList<meeting>();
	try {
		prst=conn.prepareStatement("select * from Meeting where status=3 and userid=? and sch_starttime>=? and sch_starttime<=?");
		prst.setInt(1, id);
		prst.setString(2, sdate);
		prst.setString(3, edate);
		rs=prst.executeQuery();
		while(rs.next())
		{
			meeting m=new meeting();
			m.setMeetingid(rs.getInt("meetingid"));
			m.setStatus(rs.getInt("status"));
			m.setSch_startime(getTimeDuan(rs.getString("sch_starttime"),rs.getString("sch_endtime")));
			m.setSch_endtime(rs.getString("sch_endtime").substring(0, 10));
			m.setRoomid(rs.getInt("roomid"));
			m.setAct_starttime(rs.getString("act_starttime"));
			m.setAct_endtime(rs.getString("act_endtime"));
			m.setUserid(rs.getInt("userid"));
			m.setContent(rs.getString("content"));
			m.setMemo(rs.getString("memo"));
			m.setCode(rs.getString("code"));
			m.setAttendence(rs.getInt("attendance"));
			
			list.add(m);
		}
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}finally{
		DBConn.closeDB(conn, prst, rs);
	}
		return list;
	
}
    public List<meeting> getCancelChooseTypeThree(int id,String sdate,String edate){
	conn=DBConn.getCon();
	List<meeting> list=new ArrayList<meeting>();
	try {
		prst=conn.prepareStatement("select * from Meeting where status=3 and roomid in(select roomid from Room where typeid=?) and sch_starttime>=? and sch_starttime<=?");
		prst.setInt(1, id);
		prst.setString(2, sdate);
		prst.setString(3, edate);
		rs=prst.executeQuery();
		while(rs.next())
		{
			meeting m=new meeting();
			m.setMeetingid(rs.getInt("meetingid"));
			m.setStatus(rs.getInt("status"));
			m.setSch_startime(getTimeDuan(rs.getString("sch_starttime"),rs.getString("sch_endtime")));
			m.setSch_endtime(rs.getString("sch_endtime").substring(0, 10));
			m.setRoomid(rs.getInt("roomid"));
			m.setAct_starttime(rs.getString("act_starttime"));
			m.setAct_endtime(rs.getString("act_endtime"));
			m.setUserid(rs.getInt("userid"));
			m.setContent(rs.getString("content"));
			m.setMemo(rs.getString("memo"));
			m.setCode(rs.getString("code"));
			m.setAttendence(rs.getInt("attendance"));
			
			list.add(m);
		}
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}finally{
		DBConn.closeDB(conn, prst, rs);
	}
		return list;
	
}

    public List<meeting> getCancelChooseTypeFour(int id,int idd,String sdate,String edate){
	conn=DBConn.getCon();
	List<meeting> list=new ArrayList<meeting>();
	try {
		prst=conn.prepareStatement("select * from Meeting where status=3 and roomid in(select roomid from Room where typeid=?) and userid=? and sch_starttime>=? and sch_starttime<=?");
		prst.setInt(1, id);
		prst.setInt(2, idd);
		prst.setString(3, sdate);
		prst.setString(4, edate);
		rs=prst.executeQuery();
		while(rs.next())
		{
			meeting m=new meeting();
			m.setMeetingid(rs.getInt("meetingid"));
			m.setStatus(rs.getInt("status"));
			m.setSch_startime(getTimeDuan(rs.getString("sch_starttime"),rs.getString("sch_endtime")));
			m.setSch_endtime(rs.getString("sch_endtime").substring(0, 10));
			m.setRoomid(rs.getInt("roomid"));
			m.setAct_starttime(rs.getString("act_starttime"));
			m.setAct_endtime(rs.getString("act_endtime"));
			m.setUserid(rs.getInt("userid"));
			m.setContent(rs.getString("content"));
			m.setMemo(rs.getString("memo"));
			m.setCode(rs.getString("code"));
			m.setAttendence(rs.getInt("attendance"));
			
			list.add(m);
		}
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}finally{
		DBConn.closeDB(conn, prst, rs);
	}
		return list;
	
}

	public List<meeting> getAdvancceMeetThree(String s,String e){
		conn=DBConn.getCon();
		List<meeting> list=new ArrayList<meeting>();
		try {
			prst=conn.prepareStatement("select * from Meeting where status=3 and sch_starttime>=? and sch_starttime<=?");
			prst.setString(1, s);
			prst.setString(2, e);
			rs=prst.executeQuery();
			while(rs.next())
			{
				meeting m=new meeting();
				m.setMeetingid(rs.getInt("meetingid"));
				m.setStatus(rs.getInt("status"));
				m.setSch_startime(getTimeDuan(rs.getString("sch_starttime"),rs.getString("sch_endtime")));
				m.setSch_endtime(rs.getString("sch_endtime").substring(0, 10));
				m.setRoomid(rs.getInt("roomid"));
				m.setAct_starttime(rs.getString("act_starttime"));
				m.setAct_endtime(rs.getString("act_endtime"));
				m.setUserid(rs.getInt("userid"));
				m.setContent(rs.getString("content"));
				m.setMemo(rs.getString("memo"));
				m.setCode(rs.getString("code"));
				m.setAttendence(rs.getInt("attendance"));//cancelperson
				m.setCancelperson(rs.getString("cancelperson"));
				list.add(m);
			}
		} catch (Exception e1) {
			// TODO: handle exception
			e1.printStackTrace();
		}finally{
			DBConn.closeDB(conn, prst, rs);
		}
			return list;
	}
	


}
