package com.MeetingRoomMS.Entity;

public class meeting {

	int meetingid;
	int status;
	String sch_startime;
	String sch_endtime;
	int roomid;
	String act_starttime;
	String act_endtime;
	int userid;
	String content;
	String memo;
	String code;
	int attendence;
	String cancelperson;
	
	
	public String getCancelperson() {
		return cancelperson;
	}
	public void setCancelperson(String cancelperson) {
		this.cancelperson = cancelperson;
	}
	public int getAttendence() {
		return attendence;
	}
	public void setAttendence(int attendence) {
		this.attendence = attendence;
	}
	public int getMeetingid() {
		return meetingid;
	}
	public void setMeetingid(int meetingid) {
		this.meetingid = meetingid;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getSch_startime() {
		return sch_startime;
	}
	public void setSch_startime(String sch_startime) {
		this.sch_startime = sch_startime;
	}
	public String getSch_endtime() {
		return sch_endtime;
	}
	public void setSch_endtime(String sch_endtime) {
		this.sch_endtime = sch_endtime;
	}
	public int getRoomid() {
		return roomid;
	}
	public void setRoomid(int roomid) {
		this.roomid = roomid;
	}
	public String getAct_starttime() {
		return act_starttime;
	}
	public void setAct_starttime(String act_starttime) {
		this.act_starttime = act_starttime;
	}
	public String getAct_endtime() {
		return act_endtime;
	}
	public void setAct_endtime(String act_endtime) {
		this.act_endtime = act_endtime;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
}
