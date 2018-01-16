package com.MeetingRoomMS.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.MeetingRoomMS.Entity.room;
import com.MeetingRoomMS.Tool.BaseDao;
import com.MeetingRoomMS.Tool.DBConn;

public class RoomDao extends BaseDao{

	private Connection conn;
	private PreparedStatement prst;
	private ResultSet rs;
	
	
	public List<room> getRoomInfo(){
		conn=DBConn.getCon();
		List<room> list=new ArrayList<room>();
		try {
			prst=conn.prepareStatement("select * from Room");
			rs=prst.executeQuery();
			while(rs.next())
			{
				room r=new room();
				r.setRoomid(rs.getInt("roomid"));
				r.setRoom(rs.getString("room"));
				r.setCapacity(rs.getInt("capacity"));
				r.setAddress(rs.getString("address"));
				r.setMemo(rs.getString("memo"));
				r.setImgsrc(rs.getString("imgsrc"));
				r.setTypeid(rs.getInt("typeid"));
				
				list.add(r);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			DBConn.closeDB(conn, prst, rs);
		}
			return list;
	}
	
	public List<room> getRoomInfoType(int id){
		conn=DBConn.getCon();
		List<room> list=new ArrayList<room>();
		try {
			prst=conn.prepareStatement("select * from Room where typeid="+id);
			rs=prst.executeQuery();
			while(rs.next())
			{
				room r=new room();
				r.setRoomid(rs.getInt("roomid"));
				r.setRoom(rs.getString("room"));
				r.setCapacity(rs.getInt("capacity"));
				r.setAddress(rs.getString("address"));
				r.setMemo(rs.getString("memo"));
				r.setImgsrc(rs.getString("imgsrc"));
				r.setTypeid(rs.getInt("typeid"));
				
				list.add(r);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			DBConn.closeDB(conn, prst, rs);
		}
			return list;
	}
	
	public int deleteRoomById(int id){
		conn=DBConn.getCon();
		try {
			prst=conn.prepareStatement("delete from Room where roomid="+id);
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
	
	public int addroom(room r){
		conn=DBConn.getCon();
		try {
			prst=conn.prepareStatement("insert into Room (room,capacity,address,memo,imgsrc,typeid)"
                    +"values(?,?,?,?,?,?)");
			prst.setString(1,r.getRoom());
			prst.setInt(2, r.getCapacity());
			prst.setString(3, r.getAddress());
			prst.setString(4, r.getMemo());
			if(r.getImgsrc()==null||r.getImgsrc()==""){
				prst.setString(5, r.getImgsrc());
			}else{
				prst.setString(5, r.getImgsrc());
			}
			prst.setInt(6, r.getTypeid());  System.out.println(r.getRoom());
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
	
	public int checkRoomExist(int id){
		conn=DBConn.getCon();
		int i=0;
		try {
			prst=conn.prepareStatement("select * from Meeting where roomid="+id);
			rs=prst.executeQuery();
			while(rs.next())
			{
				i++;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			DBConn.closeDB(conn, prst, rs);
		}
		return i;
	}
	
	public int updateRoom(room r){
		conn=DBConn.getCon();		
		try {			
			prst=conn.prepareStatement("update Room set room=?,capacity=?,address=?,memo=?,imgsrc=?,typeid=? where roomid=?");
			prst.setString(1,r.getRoom());
			prst.setInt(2, r.getCapacity());
			prst.setString(3, r.getAddress());
			prst.setString(4, r.getMemo());
			if(r.getImgsrc()==null||r.getImgsrc()==""){
				prst.setString(5, "暂无,待上传");
			}else{
				prst.setString(5, r.getImgsrc());
			}
			prst.setInt(6, r.getTypeid());  
			prst.setInt(7, r.getRoomid());
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
