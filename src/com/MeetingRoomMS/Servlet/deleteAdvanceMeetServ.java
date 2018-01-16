package com.MeetingRoomMS.Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.MeetingRoomMS.Bll.InfoBll;
import com.MeetingRoomMS.Bll.MeetingBll;

public class deleteAdvanceMeetServ extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	doPost(request, response);
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
	     response.setContentType("text/html;charset=UTF-8");
	     
	     int id=Integer.parseInt(request.getParameter("mtid"));
	     String reason=request.getParameter("reason");
	     int uid=Integer.parseInt(request.getParameter("userid"));
	     String admin=request.getParameter("admin");
//	     System.out.println(id);System.out.println(reason);System.out.println(uid);
	     
	     int f=new InfoBll().addaddInfoWhenCancelMeetBll(reason, uid);
	     int flag=new MeetingBll().deleteAdvanceMeet(id,reason,admin);
	     PrintWriter out=response.getWriter();
	     if(flag!=0&&f!=0){
	     out.print(flag);
	     out.flush();
		 out.close();
	     }
	}

	
	public void init() throws ServletException {
		// Put your code here
	}

}
