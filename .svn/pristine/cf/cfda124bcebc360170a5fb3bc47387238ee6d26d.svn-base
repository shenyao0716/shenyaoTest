package com.MeetingRoomMS.Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import com.MeetingRoomMS.Bll.RoomTypeBll;

public class getRoomTypeAServ extends HttpServlet {


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
	     response.setContentType("text/html;charset=UTF-8");
	     JSONArray ja=new RoomTypeBll().getRoomypeA();
	     PrintWriter out=response.getWriter();
	     out.print(ja);
	     out.flush();
		 out.close();
	}


	public void init() throws ServletException {
		// Put your code here
	}

}
