<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户信息</title>
    
   <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
	<meta http-equiv="pragma" content="no-cache">
	
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
   <link href="Static/css/style.css" rel="stylesheet">
    <link href="Static/css/style-responsive.css" rel="stylesheet">
    <link href="Static/css/table.css" rel="stylesheet">
     <link href="CSS/page.css" rel="stylesheet"> 
    <script type="text/javascript" src="JS/jquery.js"></script>
    
    <style>
      ul li{list-style:none}
    </style>
    
  </head> 
 <body class="sticky-header">

   <section>
    <!-- left side start-->
    <div class="left-side sticky-left-side">
        <!--logo and iconic logo start-->
       
        <div class="logo" style="text-align:center">
            <a href="JSP/index.jsp"><img style="width:45px;height:45px;border-radius:22.5px" 
               src="Static/images/title.png" alt=""></a>
        </div>
       <div class="logo-icon text-center">
            <a href="JSP/index.jsp"><img style="width:45px;height:45px;border-radius:22.5px"
                src="Static/images/title.png" alt=""></a>
        </div>
        <!--logo and iconic logo end-->

        <div class="left-side-inner">

            <!--sidebar nav start-->
            <ul class="nav nav-pills nav-stacked custom-nav">
                <li class="menu-list"><a href="JSP/index.jsp"><i class="fa fa-square"></i> <span>首页</span></a>      
                </li> 
                 <li class="menu-list"><a href="JSP/index.jsp"><i class="fa fa-file-text"></i><span>会议清单管理</span></a>      
                      <ul class="sub-menu-list">
                        <li><a href="JSP/advance.jsp">预定会议信息 </a></li>
                         <li><a href="JSP/ing.jsp">正在开始会议信息 </a></li>
                         <li><a href="JSP/over.jsp">已结束会议信息 </a></li>
                         <li><a href="JSP/cancel.jsp">已取消会议信息 </a></li>
                     </ul>
                 </li>
                 <li class="menu-list"><a href="JSP/index.jsp"><i class="fa fa-home"></i> <span>会议室管理</span></a>      
                      <ul class="sub-menu-list">
                        <li><a href="JSP/room.jsp">会议室信息查询</a></li>
                     </ul>
                 </li>
                 <li class="menu-list "><a href="JSP/index.jsp"><i class="fa fa-bar-chart-o"></i> <span>统计信息管理</span></a>      
                      <ul class="sub-menu-list">
                        <li><a href="JSP/rsage.jsp">会议室使用情况报表</a></li>

                     </ul>
                 </li>
                  <li class="menu-list  nav-active"><a href="JSP/index.jsp"><i class="fa fa-users"></i> <span>用户管理</span></a>      
                      <ul class="sub-menu-list">
                        <li   class="active"><a href="JSP/user.jsp">用户信息查询</a></li>
                     </ul>
                 </li>
            </ul>
            <!--sidebar nav end-->

        </div>
    </div>
    <!-- left side end-->
    
    <!-- main content start-->
    <div class="main-content" >

        <!-- header section start-->
        <jsp:include page="common.jsp" flush="true" />  
        <!-- header section end-->

        <!--body wrapper start-->
             <div class="wrapper">

                <section class="panel">
                <div class="panel-body">
                   <div class="panel panel-default">
                    <div class="panel-body" style="line-height:34px;font-size:18px">
                          <div class="row"> 
					           <div class="col-lg-9">
                                                                                                          用户信息表
						       </div>	
						       <div class="btn-group col-lg-3" id="addcustomer">
                                 <button id="editable-sample_new" onclick="add()" class="btn btn-primary">
                                                                                                   添加用户 <i class="fa fa-plus"></i>
                                 </button>
                               </div>			   
				           </div>
                    </div>
                   </div>
                   <div class="clearfix">

                  <table class="table table-hover table-striped">
		           <thead>
		         	<tr>
                        <th class="col-lg-1">序号</th>
                        <th class="col-lg-1">姓名</th>
				        <th  class="col-lg-2">用户名</th>
						<th  class="col-lg-2">密码</th>
                        <th  class="col-lg-2">联系电话</th>
                        <th  class="col-lg-2">备注</th>
                        <th class="col-lg-1">操作</th>
			        </tr>
		           </thead>
	               <tbody id="roleinfo">
	                 
		           </tbody>
	             </table>
	         </div>
           </div>
           </section>

    </div>
        <!--body wrapper end-->
    </div>
    <!-- main content end-->
    
    
    
    <!-- Modal -->
               <div class="modal" id="updatedialog" data-backdrop='static' tabindex="-1" role="dialog" aria-hidden="true">
                     <div class="modal-dialog" >
                           <div class="modal-content">
                               <div class="modal-header">
                                   <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                       <h5 class="modal-title">用户信息</h5>
                                </div>
                               <div class="modal-body ">
                                             <div class="row">
                                             <div class="col-lg-6">
                                                 <div class="input-group" style="margin-top:10px;" >
                                                      <span class="input-group-addon">姓名</span>
                                                      <input id="dname"  style="background:#ffffff" class="form-control">
                                                 </div>
                                              </div>
                                              <div class="col-lg-6">
                                                 <div class="input-group" style="margin-top:10px;" >
                                                      <span class="input-group-addon">联系电话</span>
                                                      <input id="dphone"  style="background:#ffffff" class="form-control">
                                                 </div>
                                              </div>
                                           </div>
                                           
                                            <div class="row">
                                             <div class="col-lg-6">
                                                 <div class="input-group" style="margin-top:10px;" >
                                                      <span class="input-group-addon">用户名</span>
                                                      <input id="duname"  style="background:#ffffff" class="form-control">
                                                 </div>
                                              </div>
                                              <div class="col-lg-6">
                                                 <div class="input-group" style="margin-top:10px;" >
                                                      <span class="input-group-addon">密码</span>
                                                      <input id="dpwd"  style="background:#ffffff" class="form-control">
                                                 </div>
                                              </div>
                                           </div>
                                 
                             <div class="row">
                                           
                                              <div class="col-lg-6">
                                                 <div class="input-group" style="margin-top:10px;" >
                                                      <span class="input-group-addon">邮箱</span>
                                                      <input id="demail"  style="background:#ffffff" class="form-control">
                                                 </div>
                                              </div>
                                           </div>    
                                 
                                 
                                             <div class="row"  style="margin-top:10px">
                                               <div class="col-lg-12">
                                                    <label><strong>备注</strong></label>
                                                    <textarea id="dmemo"  rows="4" class="form-control"></textarea>
                                                </div>
                                             </div>
                                        </div>
                                <div class="modal-footer">
				                          
				                           <button type="button" id="ok5" onclick="updateRecord()" class="btn btn-primary">
					                                                                                   修改                  
				                           </button>
				                           <button type="button" id="cancel5" class="btn btn-default" data-dismiss="modal">取消
			                              	</button>                       
		                        </div>
                            </div>
				   </div>
		    </div>
         <!-- 确认框 -->
         
             <!-- Modal -->
               <div class="modal" id="adddialog" data-backdrop='static' tabindex="-1" role="dialog" aria-hidden="true">
                     <div class="modal-dialog" >
                           <div class="modal-content">
                               <div class="modal-header">
                                   <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                       <h5 class="modal-title">用户信息</h5>
                                </div>
                               <div class="modal-body ">
                                             <div class="row">
                                             <div class="col-lg-6">
                                                 <div class="input-group" style="margin-top:10px;" >
                                                      <span class="input-group-addon">姓名</span>
                                                      <input id="ddname"  style="background:#ffffff" class="form-control">
                                                 </div>
                                              </div>
                                              <div class="col-lg-6">
                                                 <div class="input-group" style="margin-top:10px;" >
                                                      <span class="input-group-addon">联系电话</span>
                                                      <input id="ddphone"  style="background:#ffffff" class="form-control">
                                                 </div>
                                              </div>
                                           </div>
                                           
                                            <div class="row">
                                             <div class="col-lg-6">
                                                 <div class="input-group" style="margin-top:10px;" >
                                                      <span class="input-group-addon">用户名</span>
                                                      <input id="dduname"  style="background:#ffffff" class="form-control">
                                                 </div>
                                              </div>
                                              <div class="col-lg-6">
                                                 <div class="input-group" style="margin-top:10px;" >
                                                      <span class="input-group-addon">密码</span>
                                                      <input id="ddpwd"  style="background:#ffffff" class="form-control">
                                                 </div>
                                              </div>
                                           </div>
                                           
                                     <div class="row">
                                           
                                              <div class="col-lg-6">
                                                 <div class="input-group" style="margin-top:10px;" >
                                                      <span class="input-group-addon">邮箱</span>
                                                      <input id="ddemail"  style="background:#ffffff" class="form-control">
                                                 </div>
                                              </div>
                                           </div>           
                                           
                                 
                                             <div class="row"  style="margin-top:10px">
                                               <div class="col-lg-12">
                                                    <label><strong>备注</strong></label>
                                                    <textarea id="ddmemo"  rows="4" class="form-control"></textarea>
                                                </div>
                                             </div>
                                        </div>
                                <div class="modal-footer">
				                          
				                           <button type="button" id="ok5" onclick="adduserinfo()" class="btn btn-primary">
					                                                                                   添加                 
				                           </button>
				                           <button type="button" id="cancel5" class="btn btn-default" data-dismiss="modal">取消
			                              	</button>                       
		                        </div>
                            </div>
				   </div>
		    </div>
         <!-- 添加框 -->
 </section>

 <!-- Placed js at the end of the document so the pages load faster -->
    <script src="Static/js/jquery-1.10.2.min.js"></script>
    <script src="Static/js/jquery-ui-1.9.2.custom.min.js"></script>
    <script src="Static/js/jquery-migrate-1.2.1.min.js"></script>
    <script src="Static/js/bootstrap.min.js"></script>
    <script src="Static/js/modernizr.min.js"></script>
    <script src="Static/js/jquery.nicescroll.js"></script>
    
    

    <script type="text/javascript" src="JS/page.js"></script>
    <!--common scripts for all pages-->
    <script src="Static/js/scripts.js"></script>
    
    
    <script>
    var setid;
    
    getData();
      function update(obj){
       $("#updatedialog").modal('show'); 
 
       $("#dname").val($(obj).parent().siblings(".tname").text());
       $("#dphone").val($(obj).parent().siblings(".tphone").text());
       $("#duname").val($(obj).parent().siblings(".tuname").text());
       $("#dpwd").val($(obj).parent().siblings(".tupwd").text());
       $("#dmemo").val($(obj).parent().siblings(".tmemo").text());
       $("#demail").val($(obj).parent().siblings(".temail").text());
       setid=$(obj).parent().siblings(".idd").text();
    	   
    	    	       
      }
      //修改user信息································
      function updateRecord(){
         // alert($('#dname').val());
         
       //  alert(setid)
         
         var json={
				"dname":$("#dname").val(),
				"dphone":$("#dphone").val(),
				"duname":$("#duname").val(),
				"dpwd":$("#dpwd").val(),
				"dmemo":$("#dmemo").val(),
				"demail":$("#demail").val(),
				"did":setid,
		         };
		if($("#dname").val()!=""&&$("#dname").val()!=""&&$("#dphone").val()!=""&&$("#duname").val()!=""&&$("#dpwd").val()!=""&&$("#dmemo").val()!="")
		{
			 $.ajax({
			     type:"post",
			     url:"/MeetingRoomMS/updateUserInfoServ",
			     data:{"json":JSON.stringify(json)},
			     dataType:"json", 
	        	 success:function(flag){
			    	 if(flag>0)
			    	 {
			    		 alert("修改成功");getData(); $("#updatedialog").modal('hide'); 
			    		
			    	 } 
			    	 else
			    	 {alert("修改失败");   }
			     }
		      });
		}else{
		       alert("请将信息填写完整");
		   }
         }
      
     function getData(){
    	 
    	 $.ajax({
     		type:"post",
     		url:"/MeetingRoomMS/getAllUsersInfoServ",
     		dataType:"json",
     		success:function(ja){
     			$("#roleinfo").children().remove();
     			for(var i=0;i<ja.length;i++)
     			{
     				var a=i+1;    
     				$("#roleinfo").append("<tr><td>"+a+"&nbsp;&nbsp;<a onclick='update(this)'>修改</a></td><td class='tname'>"
     				+ja[i].name+"</td><td class='tuname'>"
     				+ja[i].username+"</td><td class='tupwd'>"
     				+ja[i].userpwd+"</td><td class='tphone'>"
     				+ja[i].phone+"</td><td class='tmemo'>"
     				+ja[i].memo+"</td><td><a  style='color:red' onclick='remove(this)'>删除</a></td><td style='display:none' class='idd'>"+ja[i].userid+"</td><td style='display:none' class='temail'>"
     				+ja[i].email+"</td></tr>");
     			
     			}
     		}
     		
     	});
    	 
     }
      // 点击删除。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。
      function remove(obj){
    	  var uid;
    	  //alert($(obj).parent().siblings(".idd").text());
    	  uid=$(obj).parent().siblings(".idd").text();
    	  
    	  if(confirm("是否删除")){
    	       // alert($(obj).parent().siblings(".idd").text());
    	       
    		  $.ajax({
    	    		type:"post",
    	    		url:"/MeetingRoomMS/deleteUserInfoServ",
    	    		data:{"uid":uid},
    	    		dataType:"json",
    	    		success:function(flag){
    	    			if(flag>0)
   			    	 {
   			    		 alert("删除成功");getData();
   			    		
   			    	 } 
   			    	 else
   			    	 {alert("删除失败");   }
    	    		}
    	    		
    	    	});
    	  }
    	   
       	    	       
         }
      
      function add(){
    	  $("#adddialog").modal('show'); 
      }
      function adduserinfo(){
    	  var json={
  				"dname":$("#ddname").val(),
  				"dphone":$("#ddphone").val(),
  				"duname":$("#dduname").val(),
  				"dpwd":$("#ddpwd").val(),
  				"dmemo":$("#ddmemo").val(),
  		         };
  		if($("#ddname").val()!=""&&$("#ddphone").val()!=""&&$("#dduname").val()!=""&&$("#ddpwd").val()!=""&&$("#ddmemo").val()!="")
		{
			 $.ajax({
			     type:"post",
			     url:"/MeetingRoomMS/addUserInfoServ",
			     data:{"json":JSON.stringify(json)},
			     dataType:"json", 
	        	 success:function(flag){
			    	 if(flag>0)
			    	 {
			    		 alert("添加成功");getData(); $("#adddialog").modal('hide'); 
			    		
			    	 } 
			    	 else
			    	 {alert("添加失败");   }
			     }
		      });
		}else{
		       alert("请将信息填写完整");
		   }
      }
	  
    </script>
 </body>
</html>