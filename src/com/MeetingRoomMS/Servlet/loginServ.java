package com.MeetingRoomMS.Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.MeetingRoomMS.Dao.UserDao;

import net.sf.json.JSONObject;



public class loginServ extends HttpServlet {

	

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
	    response.setContentType("text/html;charset=UTF-8");
	    
	    String uname=request.getParameter("uname");
	       String upwd=request.getParameter("pwd");
	       System.out.println("dd");
	       JSONObject jb=new UserDao().uservalid(uname, upwd);
	       if(jb==null){
	        	  response.sendRedirect("./login.jsp");
	        }else{
	        	 HttpSession session=request.getSession();
	        	 
	        	 
	        	   session.setAttribute("userid", jb.getInt("userid"));
	        		
	        		 response.sendRedirect("./JSP/index.jsp");
	        }
		
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
