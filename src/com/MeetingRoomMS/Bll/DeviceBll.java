package com.MeetingRoomMS.Bll;

import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.MeetingRoomMS.Dao.DeviceDao;
import com.MeetingRoomMS.Entity.device;

public class DeviceBll {
	
	public int updateRoomDevice(int rid,int roleid){
		int flag=new DeviceDao().updateRoomDeviceInfo(rid, roleid);
		return flag;
	}
	
	public int deleteRoomDevice(int rid,int roleid){
		int flag=new DeviceDao().deleteRDevice(rid, roleid);
		return flag;
	}

	public JSONArray getDevice(){
	List<device> list=new DeviceDao().getDeviceInfo();
	JSONArray ja=new JSONArray();
	for(device d:list){
		JSONObject jo=new JSONObject();
		jo.put("deid", d.getDeviceid());
		jo.put("de", d.getDevice());
		jo.put("memo", d.getMemo());
		ja.add(jo);
	}
	return ja;
	}
	
	public JSONArray getDeviceId(int id){
		List<device> list=new DeviceDao().getDeviceIdByRoomId(id);
		JSONArray ja=new JSONArray();
		for(device d:list){
			JSONObject jo=new JSONObject();
			jo.put("dvid", d.getDeviceid());
			ja.add(jo);
		}
		return ja;
	}
}
