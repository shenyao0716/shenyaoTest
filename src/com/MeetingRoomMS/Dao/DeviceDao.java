package com.MeetingRoomMS.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.MeetingRoomMS.Entity.device;
import com.MeetingRoomMS.Tool.DBConn;

public class DeviceDao {

	private Connection conn;
	private PreparedStatement prst;
	private ResultSet rs;
	
	public int updateRoomDeviceInfo(int id,int rid){
		conn=DBConn.getCon();
		try {
			prst=conn.prepareStatement("insert into RoomDevice (roomid,deviceid) values(?,?)");
			prst.setInt(1, id);
			prst.setInt(2, rid);
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
	
	public List<device> getDeviceInfo(){
		conn=DBConn.getCon();
	    List<device> list =new ArrayList<device>();
	    try {
	    	prst=conn.prepareStatement("select * from Device");
			rs=prst.executeQuery();
			while(rs.next())
			{
				device d=new device();
				d.setDeviceid(rs.getInt("deviceid"));
				d.setDevice(rs.getString("device"));
				d.setMemo(rs.getString("memo"));
				list.add(d);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			DBConn.closeDB(conn, prst, rs);
		}
			return list;
	
	}
	
	public List<device> getDeviceIdByRoomId(int id){
		conn=DBConn.getCon();
		List<device> list=new ArrayList<device>();
		try {
			prst=conn.prepareStatement("select deviceid from RoomDevice where roomid="+id);
			rs=prst.executeQuery();
			while(rs.next())
			{
				device d=new device();
				d.setDeviceid(rs.getInt("deviceid"));
				list.add(d);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			DBConn.closeDB(conn, prst, rs);
		}
			return list;
	}
	
	public int deleteRDevice(int id,int rid){
		conn=DBConn.getCon();
		try {
			prst=conn.prepareStatement("delete from RoomDevice	where roomid="+id+"and deviceid="+rid);
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
}
