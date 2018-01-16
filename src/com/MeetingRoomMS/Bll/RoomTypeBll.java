package com.MeetingRoomMS.Bll;

import java.util.List;

import com.MeetingRoomMS.Dao.RoomTypeDao;
import com.MeetingRoomMS.Entity.roomtype;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class RoomTypeBll {

	public JSONArray getRoomype(){
		List<roomtype> list=new RoomTypeDao().getRoomType();
		JSONArray ja=new JSONArray();
		for(roomtype rt:list){
			JSONObject jo=new JSONObject();
			jo.put("typeid", rt.getTypeid());
			jo.put("type", rt.getType());
			
			ja.add(jo);
		}
		return ja;
	}
	
	public JSONArray getRoomypeA(){
		List<roomtype> list=new RoomTypeDao().getRoomType();
		JSONArray ja=new JSONArray();
		JSONObject jo1 =new JSONObject();
		jo1.put("typeid", 0);
		jo1.put("type", "全部");
		ja.add(jo1);
		for(roomtype rt:list){
			JSONObject jo=new JSONObject();
			jo.put("typeid", rt.getTypeid());
			jo.put("type", rt.getType());
			
			ja.add(jo);
		}
		return ja;
	}
	
}
