<%@page import="net.sf.json.JSONArray"%>
<%@ page language="java" import="java.util.*" contentType="text/html;charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>预定信息</title>
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
                 <li class="menu-list  nav-active  "><a href="JSP/index.jsp"><i class="fa fa-file-text"></i><span>会议清单管理</span></a>      
                      <ul class="sub-menu-list">
                        <li class="active"><a href="JSP/advance.jsp">预定会议信息 </a></li>
                         <li ><a href="JSP/ing.jsp">正在开始会议信息 </a></li>
                         <li ><a href="JSP/over.jsp">已结束会议信息 </a></li>
                         <li ><a href="JSP/cancel.jsp">已取消会议信息 </a></li>
                     </ul>
                 </li>
                 <li class="menu-list "><a href="JSP/index.jsp"><i class="fa fa-home"></i> <span>会议室管理</span></a>      
                      <ul class="sub-menu-list">
                        <li><a href="JSP/room.jsp">会议室信息查询</a></li>
                        
                     </ul>
                 </li>
                 <li class="menu-list "><a href="JSP/index.jsp"><i class="fa fa-bar-chart-o"></i> <span>统计信息管理</span></a>      
                      <ul class="sub-menu-list">
                        <li><a href="JSP/rsage.jsp">会议室使用情况报表</a></li>
                         <li ><a href="JSP/usage.jsp">用户使用情况报表</a></li>
                     </ul>
                 </li>
                  <li class="menu-list "><a href="JSP/index.jsp"><i class="fa fa-users"></i> <span>用户管理</span></a>      
                      <ul class="sub-menu-list">
                        <li><a href="JSP/user.jsp">用户信息查询</a></li>
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
             <div class="row">
                <div class="col-sm-12">
                <section class="panel">
           
                <div class="panel-body">
                   <div class="panel panel-default">
                    <div class="panel-body" style="line-height:34px;font-size:18px">
                          <div class="row"> 
					           <div class="col-lg-7" style="line-height:34px;font-size:18px">
                                                                                                           预定信息表
						       </div>
						       <div class="col-lg-4 col-lg-offset--1">
							      <div class="input-group input-large custom-date-range">
                                            <input type="text" class="form-control dpd1 " readonly style="background:#ffffff"  id="from"  placeholder="起始日期" >
                                            <span class="input-group-addon">To</span>
                                            <input type="text" class="form-control dpd2" readonly style="background:#ffffff"  id="to"  placeholder="结束日期" >
                                   </div>
                               </div> 
				           </div>
                    </div>
                   </div>
                   <div class="clearfix">
				   <div class="row">
		            <div class="col-lg-3 ">
                     <div class="input-group" >
                         <span class="input-group-addon">会议室选择</span>
                         <select class="form-control input-sm m-bot15" onchange="getData(fromdate,todate)" id="meetroomselect">
						      
                         </select>		

                      </div>
					 </div>
					  <div class="col-lg-3 ">
                       <div class="input-group" >
                         <span class="input-group-addon">用户选择</span>
                         <select class="form-control input-sm m-bot15" onchange="getData(fromdate,todate)" id="userselect">
						      
                         </select>		
                      </div>
					 </div>
			      </div>
                <table class="table table-hover table-striped">
		          <thead>
		         	<tr>
			        	<th class="col-lg-1">序号</th>
                        <th class="col-lg-1">预定人</th>
				        <th class="col-lg-2">会议室</th>
				        <th class="col-lg-2">预定时段</th>
				        <th class="col-lg-2">预定时间</th>
				        <th class="col-lg-1">操作</th>
			        </tr>
			       
		          </thead>
	              <tbody id="roleinfo">
	         	    <!-- <tr>
			        	<td>1&nbsp;&nbsp;<a onclick=''>查看</a></td>
			            <td>纪文翔</td>
			            <td>会议室1</td>
			            <td>09:00-10:30</td>
			            <td>2017-03-11</td>			            
			            <td><a  style='color:red' onclick=''>删除</a></td>
			       </tr> -->
		          </tbody>
	            </table>
	           <div class="ui-page" id="ui-page1">  <!-- 页码按钮 -->
              </div>
	         </div>
           </div>
          </section>
          </div>
          </div>
          </div>
        <!--body wrapper end-->
    </div>
    <!-- main content end-->
    
    <!-- 确认框 -->
         
             <!-- Modal -->
               <div class="modal" id="lookdialog" data-backdrop='static' tabindex="-1" role="dialog" aria-hidden="true">
                     <div class="modal-dialog" >
                           <div class="modal-content">
                               <div class="modal-header">
                                   <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                       <h5 class="modal-title">预定信息</h5>
                                </div>
                               <div class="modal-body ">
                                             <div class="row">
                                             <div class="col-lg-6">
                                                 <div class="input-group" style="margin-top:10px;" >
                                                      <span class="input-group-addon">姓名</span>
                                                      <input id="username"  style="background:#ffffff" class="form-control">
                                                 </div>
                                              </div>
                                              <div class="col-lg-6">
                                                 <div class="input-group" style="margin-top:10px;" >
                                                      <span class="input-group-addon">会议室名称</span>
                                                      <input id="roomname"  style="background:#ffffff" class="form-control">
                                                 </div>
                                              </div>
                                           </div>
                                           
                                            <div class="row">
                                             <div class="col-lg-6">
                                                 <div class="input-group" style="margin-top:10px;" >
                                                      <span class="input-group-addon">容量</span>
                                                      <input id="capacity"  style="background:#ffffff" class="form-control">
                                                 </div>
                                              </div>
                                              <div class="col-lg-6">
                                                 <div class="input-group" style="margin-top:10px;" >
                                                      <span class="input-group-addon">会议室地址</span>
                                                      <input id="address"  style="background:#ffffff" class="form-control">
                                                 </div>
                                              </div>
                                           </div>
                                 
                                             <div class="row"  style="margin-top:10px">
                                               <div class="col-lg-12">
                                                    <label><strong>内容</strong></label>
                                                    <textarea id="content"  rows="4" class="form-control"></textarea>
                                                </div>
                                             </div>
                                        </div>
                                <div class="modal-footer">
				                          
				                           
				                           <button type="button" id="cancel5" class="btn btn-default" data-dismiss="modal">确定
			                              	</button>                       
		                        </div>
                            </div>
				   </div>
		    </div>
		      <div class="modal" id="canceldialog" data-backdrop='static' tabindex="-1" role="dialog" aria-hidden="true">
                     <div class="modal-dialog" >
                           <div class="modal-content">
                               <div class="modal-header">
                                   <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                       <h5 class="modal-title">请输入撤销的理由</h5>
                                </div>
                               <div class="modal-body ">
                                            
                                             <div class="row"  style="margin-top:10px">
                                               <div class="col-lg-12">
                                                    <label><strong>理由</strong></label>
                                                    <textarea id="cxcontent"  rows="4" class="form-control"></textarea>
                                                </div>
                                             </div>
                                        </div>
                                <div class="modal-footer">

				                           <button onclick="cancel()" type="button" id="cancel5" class="btn btn-primary">确定撤销
			                              	</button>
			                              	<button type="button" id="cancel5" class="btn btn-default" data-dismiss="modal">取消
			                               	</button>                       
		                        </div>
                            </div>
				   </div>
		    </div>
 </section>

 <!-- Placed js at the end of the document so the pages load faster -->
    <script src="Static/js/jquery-1.10.2.min.js"></script>
    <script src="Static/js/jquery-ui-1.9.2.custom.min.js"></script>
    <script src="Static/js/jquery-migrate-1.2.1.min.js"></script>
    <script src="Static/js/bootstrap.min.js"></script>
    <script src="Static/js/modernizr.min.js"></script>
    <script src="Static/js/jquery.nicescroll.js"></script>
    
    
     <script type="text/javascript" src="JS/js/laydate.js"></script>
    <script type="text/javascript" src="JS/page.js"></script>
    <!--common scripts for all pages-->
    <script src="Static/js/scripts.js"></script>
    
    
    <script>
   
    getMeetData();
    typp();
    tpppp();
    window.location.reload;
    //取得预定会议数据===============================================================================================
    function getMeetData(){
   	 $.ajax({
  		type:"post",
  		url:"/MeetingRoomMS/getAdvanceMeetServ",
  		data:{"from":$("#from").val(),"to":$("#to").val()},
  		dataType:"json",
  		success:function(ja){
  			
  			 $("#roleinfo").children().remove();
  			for(var i=0;i<ja.length;i++)
  			{
  				var a=i+1;    
  				$("#roleinfo").append("<tr><td>"+a+"&nbsp;&nbsp;<a onclick='look(this)'>查看</a></td><td class='tusername'>"+ja[i].username+"</td><td class='tmeetname'>"+ja[i].roomname+"</td><td class='tsch_starttime'>"+ja[i].sch_starttime+"</td><td class='tsch_endtime'>"+ja[i].sch_endtime+"</td><td><a  style='color:red' onclick='removem(this)'>撤销会议</a></td><td style='display:none' class='tmeetingid'>"+ja[i].meetingid+"</td><td style='display:none' class='troomid'>"+ja[i].roomid+"</td><td style='display:none' class='tuserid'>"+ja[i].userid+"</td><td style='display:none' class='tcontent'>"+ja[i].content+"</td><td style='display:none' class='taddress'>"+ja[i].address+"</td><td style='display:none' class='tcapacity'>"+ja[i].capacity+"</td></tr>");
  			
  			} 
  		}
  		
  	});
    }
    //会议室类型选择=============================================================================================
        function typp(){
    	$.ajax({
		      type:"Post",
		      url:"/MeetingRoomMS/getRoomTypeAServ",		      
		      dataType:"json",
		      success:function(ja){	     
		         for(var i=0;i<ja.length;i++){

                      $("#meetroomselect").append("<option value='"+ja[i].typeid+"'>"+ja[i].type+"</option>");
               }
			   },
			  error:function(){alert("加载失败");}
	   });
    }
 
//用户类型选择==============================================================================================
        	function tpppp(){
        		$.ajax({
      		      type:"Post",
      		      url:"/MeetingRoomMS/getRoomUserTypeServ",		      
      		      dataType:"json",
      		      success:function(ja){	     
      		         for(var i=0;i<ja.length;i++){

                            $("#userselect").append("<option value='"+ja[i].userid+"'>"+ja[i].name+"</option>");
                     };
      			   },
      			  error:function(){alert("加载失败");}
      	   });
        }
    //选择=====================================================================================================    
        function getData(fromdate,todate){
       $.ajax({
		      type:"Post",
		      url:"/MeetingRoomMS/getAvanceMeetRoomServ",
		      data:{"from":fromdate,"to":todate,"roomtype":$("#meetroomselect").val(),"userid":$("#userselect").val()},
		      async:false,
		      dataType:"json",
		      success:function(ja){	
		    	  $("#roleinfo").children().remove();
		  			for(var i=0;i<ja.length;i++)
		  			{
		  				var a=i+1;    
		  				$("#roleinfo").append("<tr><td>"+a+"&nbsp;&nbsp;<a onclick='look(this)'>查看</a></td><td class='tusername'>"+ja[i].username+"</td><td class='tmeetname'>"+ja[i].roomname+"</td><td class='tsch_starttime'>"+ja[i].sch_starttime+"</td><td class='tsch_endtime'>"+ja[i].sch_endtime+"</td><td><a  style='color:red' onclick='removem(this)'>撤销会议</a></td><td style='display:none' class='tmeetingid'>"+ja[i].meetingid+"</td><td style='display:none' class='troomid'>"+ja[i].roomid+"</td><td style='display:none' class='tuserid'>"+ja[i].userid+"</td><td style='display:none' class='tcontent'>"+ja[i].content+"</td><td style='display:none' class='taddress'>"+ja[i].address+"</td><td style='display:none' class='tcapacity'>"+ja[i].capacity+"</td></tr>");
		  			
		  			}
			    },
			  error:function(){alert("加载失败");}
	   });
  
  }
var userid;
var mtid;
var admname;
    //撤销============================================================================================
    function removem(obj){
    	$("#canceldialog").modal('show');
    	$("#cxcontent").val("");
    	userid=$(obj).parent().siblings(".tuserid").text();
    	mtid=$(obj).parent().siblings(".tmeetingid").text();
    	$.ajax({
			      type:"Post",
			      url:"/MeetingRoomMS/getUserInfoNameServ",
			      data:{"userid":admins},
			      async:false,
			      dataType:"json",
			      success:function(ja){	
			    	 admname=ja[0].name;
			            //$("#show").append("&nbsp;"+ja[0].name+"");
		  
				  },
				  error:function(){alert("加载失败");}
		   });
    	//alert(admname);
    }
    //点击撤销=============================================================================================
    	function cancel(){ 		
        	//alert(admins);
        		/* alert(mtid);
        		alert($("#cxcontent").val());
        		alert(userid); */
     		
        		if($("#cxcontent").val()=="")
        		{
        			alert("请输入理由");
        		}
        		else{
 
        			$.ajax({
         	    		type:"post",
         	    		url:"/MeetingRoomMS/deleteAdvanceMeetServ",
         	    		data:{"mtid":mtid,"reason":$("#cxcontent").val(),"userid":userid,"admin":admname},
         	    		async:false,
         	    		dataType:"json",
         	    		success:function(flag){
         	    			if(flag>0)
        			    	 {
        			    		 alert("撤销成功");getMeetData();
        			    		
        			    	 } else
        			  	        alert("未能撤销"); 
         	    		},
         	    		error:function(){alert("失败");}
        			});
        			$("#canceldialog").modal('hide');
        			}
        		}
    	/* 
 		 function getadminname(admins){
 			 $.ajax({
 			      type:"Post",
 			      url:"/MeetingRoomMS/getUserInfoNameServ",
 			      data:{"userid":admins},
 			      async:false,
 			      dataType:"json",
 			      success:function(ja){	
 			    	 admname=ja[0].name;
 			            //$("#show").append("&nbsp;"+ja[0].name+"");
 		  
 				  },
 				  error:function(){alert("加载失败");}
 		   });
 		 } */
 	  
    //查看===========================================================================
    function look(obj){
    	$("#lookdialog").modal('show'); 
    	 $("#username").val($(obj).parent().siblings(".tusername").text());
    	 $("#roomname").val($(obj).parent().siblings(".tmeetname").text());
    	 $("#address").val($(obj).parent().siblings(".taddress").text());
    	 $("#capacity").val($(obj).parent().siblings(".tcapacity").text());
    	 $("#content").val($(obj).parent().siblings(".tcontent").text());
    }
    
 
   //默认近30天
     var fromdate=getdate(0);
     var todate=getdate(7);
     

   
    $("#from").val(fromdate);
    $("#to").val(todate);
    
    
	laydate.skin('molv');//日历切换皮肤，请查看skins下面皮肤
	
	//日期范围限制
    var start = {
       elem: '#from',
       min:fromdate,
       max: todate, //最大日期
       choose: function(datas){
         end.min = datas; //开始日选好后，重置结束日的最小日期
         fromdate=datas;  
         getData(fromdate,todate);
       }
     };

    var end ={
       elem: '#to',
       min: fromdate,
       max: todate,
       choose: function(datas){
          start.max=datas; //结束日选好后，充值开始日的最大日期
          todate=datas;
          getData(fromdate,todate);
       }
     };
     //绑定元素
    laydate(start);
    laydate(end);

  //得到时间
  function getdate(n){

	var nowdate= new Date();
	var date = new Date(nowdate.getTime()+n* 24 * 3600 * 1000);
	var y = date.getFullYear();
	var m = date.getMonth()+1;
	var d = date.getDate();
    if(m<10){m="0"+m;}	
     
    if(d<10){d="0"+d;}
	 return y+"-"+m+"-"+d;

   }
	  
	  
    </script>
 </body>
</html>
