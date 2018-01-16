package com.MeetingRoomMS.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.MeetingRoomMS.Entity.roomtype;
import com.MeetingRoomMS.Tool.DBConn;

public class RoomTypeDao {

	private Connection conn;
	private PreparedStatement prst;
	private ResultSet rs;
	
	
	public String getRoomTypeName(int t){
		conn=DBConn.getCon();
		String typename=null;
		try {
			prst=conn.prepareStatement("select type from RoomType where typeid=?");
			prst.setInt(1, t);
			rs=prst.executeQuery();
			if(rs.next())
			{
				typename=rs.getString("type");
				return typename;
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
	
	public List<roomtype> getRoomType(){
		conn=DBConn.getCon();
		List<roomtype> list=new ArrayList<roomtype>();
		
		try {
			prst=conn.prepareStatement("select * from RoomType");
			rs=prst.executeQuery();
			while(rs.next()){
				roomtype rt=new roomtype();
				rt.setTypeid(rs.getInt("typeid"));
				rt.setType(rs.getString("type"));
				
				list.add(rt);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			DBConn.closeDB(conn, prst, rs);
		}
		return list;
		
	}
	
}
