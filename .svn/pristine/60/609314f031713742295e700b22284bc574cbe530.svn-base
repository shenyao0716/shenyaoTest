<%@ page language="java" import="java.util.* " contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

String userid=session.getAttribute("userid").toString();
int admins=Integer.parseInt(userid);

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'common.jsp' starting page</title>
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style>
	  ul li:hover{cursor:pointer}

	</style>

  </head>
  
  <body>
   <div class="header-section">

            <!--toggle button start-->
            <a class="toggle-btn"><i class="fa fa-bars"></i></a>
            <!--toggle button end-->
         
            <div id="titletime" class="pull-left  col-lg-2" style="text-align:left;line-height:51px;font-size:16px;font-weight:bold;"></div>
		    
            <!--notification menu start -->
            <div class="menu-right">
                <ul class="notification-menu">   
                    <li>
                        <a href="#" class="btn btn-default dropdown-toggle"  data-toggle="dropdown">
                            <i class="fa fa-user" id="show">                    
                            </i>
                            <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-usermenu pull-right">
                            <!-- <li ><a onclick='queryInfo()'><i class="fa fa-user"></i>基本信息</a></li> -->
                            <!-- <li ><a onclick='setInfo()'><i class="fa fa-cog"></i>设置</a></li> -->
                            <li ><a href="login.jsp"><i class="fa fa-sign-out"></i>退出</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
            <!--notification menu end -->

        </div>
        <!-- header section end-->
        
        <!-- 用户基本信息框 -->
 <!--       <div class="modal fade" id="infodialog" tabindex="-1" role="dialog" data-backdrop='static' aria-hidden="true">
           <div class="modal-dialog" style="width:25%">
              <div class="modal-content">
                   <div class="modal-header">
                     <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                     <h4 class="modal-title">基本信息</h4>
                   </div>
                   <div class="modal-body row">
                       
                         <div class="col-md-12">
                                <div class="form-group">
                                        <label> 用户名</label>
                                        <input id="uname"  readonly  class="form-control">
                                </div>
                                <div class="form-group">
                                         <label>姓名</label>
                                         <input id="name" readonly class="form-control">
                                </div>
                                <div class="form-group">
                                         <label>电话</label>
                                         <input id="phone" readonly class="form-control">
                                </div>
                                 <div class="form-group">
                                          <label> 备注</label>
                                          <textarea id="memo" readonly class="form-control"></textarea>
                                 </div>       
                            </div>
                   </div>
             </div>					 
           </div>
       </div> -->
         <!--用户基本信息框  结束-->
         
 <!--           用户设置框
       <div class="modal fade" id="setdialog" tabindex="-1" role="dialog"  data-backdrop='static' aria-hidden="true">
           <div class="modal-dialog" style="width:25%">
              <div class="modal-content">
                   <div class="modal-header">
                     <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                     <h4 class="modal-title">用户信息修改</h4>
                   </div>
                   <div class="modal-body row">
                         <div class="col-md-12">
                                <div class="form-group">
                                        <label> 用户名</label>
                                        <input id="uname2"   class="form-control">
                                </div>
                                 <div class="form-group">
                                        <label>密码</label>
                                        <input id="upwd"   class="form-control">
                                </div>
                                <div class="form-group">
                                         <label>电话</label>
                                         <input id="phone2"  class="form-control">
                                </div>
                                 <div class="form-group">
                                          <label> 备注</label>
                                          <textarea id="memo2"  class="form-control"></textarea>
                                 </div>       
                            </div>
                   </div>
                   <div class="modal-footer">
				                        <button type="button" id="cancel" class="btn btn-default" data-dismiss="modal">取消
			                               	</button>
				                           <button type="button" id="titleok"  class="btn btn-primary">
					                                                                                修改
				                           </button>
		           </div>
             </div>					 
           </div>
       </div> -->
         <!--用户设置框  结束-->
        
<script>
  $(document).ready(function(){

    var showtime=title_getToday()+","+title_getWeek();
    $("#titletime").append(showtime);
   });
   
  var admins=<%=admins%>;
 getUserInfo(admins);
  
  function queryInfo(){
      $("#infodialog").modal('show');  
  }
  function getUserInfo(id){
      $.ajax({
		      type:"Post",
		      url:"/MeetingRoomMS/getUserInfoNameServ",
		      data:{"userid":id},
		      async:false,
		      dataType:"json",
		      success:function(ja){	
		            $("#show").html("");
		            $("#show").append("&nbsp;"+ja[0].name+"");
		            $("#uname").val(ja[0].username);
		            
		           
		            $("#phone").val(ja[0].phone);  
		           
		            
		            
		            $("#name").val(ja[0].name);
		               
			  },
			  error:function(){alert("加载失败");}
	   });
   }  
  
  
  
   
  function title_getToday(){
    var date=new Date();
	var y = date.getFullYear();
	var m = date.getMonth()+1;
	var d = date.getDate();
	return y+"-"+m+"-"+d;
   }
   
 function title_getWeek(){
     var numWeekDay=new Date().getDay();
    if (numWeekDay == 0) {
        return '周日';
    } else if (numWeekDay == 1) {
        return '周一';
    } else if (numWeekDay == 2) {
        return '周二';
    } else if (numWeekDay == 3) {
        return '周三';
    } else if (numWeekDay == 4) {
        return '周四';
    } else if (numWeekDay == 5) {
        return '周五';
    } else if (numWeekDay == 6) {
        return '周六';
    } else {
        return '';
    }
   }

           
</script>
  </body>
</html>
