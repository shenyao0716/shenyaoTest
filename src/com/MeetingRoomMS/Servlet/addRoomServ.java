package com.MeetingRoomMS.Servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.MeetingRoomMS.Bll.RoomBll;



public class addRoomServ extends HttpServlet {


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
	    response.setContentType("text/html;charset=UTF-8");
	   
	    
	    String savepath = this.getServletContext().getRealPath("/")+"images";
		File file = new File(savepath);
		if (!file.exists() && !file.isDirectory()) {
			System.out.println(savepath+"目录不存在，生成中...");			
			file.mkdir(); //不存在的话，生成所有目录
		}
		
		  /*
	     * FileItem 用来封装表单中的元素和数据
	     * DiskFileItemFactory FileItem 对象的工厂，可以设定缓冲区大小和存放临时文件目录。
	     * ServletFileUpload 处理表单数据，将数据封装到 FileItem 对象中
	     * */
	    try{
	    	
	    	DiskFileItemFactory factory = new DiskFileItemFactory();
	    	
	    	ServletFileUpload upload = new ServletFileUpload(factory);
	    	
	    	upload.setHeaderEncoding("UTF-8"); 
	 
		 	List<FileItem> list = upload.parseRequest(request);
		   //  int flag=new FriendLinkBll().addFriendLink(list, savepath);
		 	   int flag=new RoomBll().addroomb(list, savepath);
		 	System.out.println(savepath);
		     PrintWriter out=response.getWriter();
		     out.print(flag);
		     out.flush();
			 out.close();
		    
		} catch (FileUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
