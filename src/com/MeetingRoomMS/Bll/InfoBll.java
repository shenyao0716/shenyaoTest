package com.MeetingRoomMS.Bll;

import com.MeetingRoomMS.Dao.InfoDao;

public class InfoBll {

	public int addaddInfoWhenCancelMeetBll(String r,int id){
		int flag=new InfoDao().addInfoWhenCancelMeet(r, id);
		return flag;
	}
	
	public int userUseSituationFbackBll(String r,int id){
		int flag=new InfoDao().userUseSituationFback(r, id);
		return flag;
	}
}
