package com.MeetingRoomMS.Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.MeetingRoomMS.Bll.MeetingBll;
import com.MeetingRoomMS.Dao.MeetingDao;
import com.MeetingRoomMS.Dao.UserDao;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class getAvanceMeetRoomServ extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
	    response.setContentType("text/html;charset=UTF-8");
	    
	    String sdate=request.getParameter("from");
		String edate=request.getParameter("to");
		int typeid=Integer.parseInt(request.getParameter("roomtype"));
		int userid=Integer.parseInt(request.getParameter("userid"));
		                            //   System.out.println(typeid);System.out.println(userid);
		                             //  System.out.println(sdate);System.out.println(edate);
		JSONArray ja=new JSONArray();
		
		if(typeid==0&&userid==0)
		{
			ja=new MeetingBll().getMeetInfoZero(sdate,edate);
		}else if(typeid==0&&userid!=0)
		{
			ja=new MeetingBll().getMeetInfoZeroTwo(userid, sdate, edate);
		}else if(typeid!=0&&userid==0)
		{
			ja=new MeetingBll().getMeetInfoZeroThree(typeid, sdate, edate);
		}else if(typeid!=0&&userid!=0)
		{
			ja=new MeetingBll().getMeetInfoZeroFour(typeid, userid, sdate, edate);
		}

		PrintWriter out=response.getWriter();
		 
	     out.print(ja);
	     out.flush();
		 out.close();
	
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
