package com.MeetingRoomMS.Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.MeetingRoomMS.Bll.RoomBll;
import com.MeetingRoomMS.Dao.RoomDao;

import net.sf.json.JSONArray;


public class getTypeRoomInfServ extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	doPost(request, response);
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
	    response.setContentType("text/html;charset=UTF-8");

	    int tid=Integer.parseInt(request.getParameter("tid"));
	    JSONArray ja=new RoomBll().getTypeRoom(tid);
	    
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
