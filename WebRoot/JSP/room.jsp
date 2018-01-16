<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
int userid=Integer.parseInt(session.getAttribute("userid").toString());
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>会议室信息</title>
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
                 <li class="menu-list  nav-active"><a href="JSP/index.jsp"><i class="fa fa-home"></i> <span>会议室管理</span></a>      
                      <ul class="sub-menu-list">
                        <li  class="active"><a href="JSP/room.jsp">会议室信息查询</a></li>
                        <li ><a href="JSP/usage.jsp">用户使用情况报表</a></li>
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
                <div class="col-lg-8">
                <section class="panel">
                <div class="panel-body">
                   <div class="panel panel-default">
                    <div class="panel-body" style="line-height:34px;font-size:18px">
                          <div class="row"> 
					           <div class="col-lg-7">
                                                                                                          会议室信息表
						       </div>	
						       <div class="btn-group col-lg-3" id="addcustomer">
                                 <button id="editable-sample_new" onclick="add()" class="btn btn-primary">
                                                                                                   添加会议室 <i class="fa fa-plus"></i>
                                 </button>
                               </div>			   
				           </div>
                    </div>
                   </div>
                   <div class="clearfix">
                   
                        <div  class="col-lg-4 ">
				       <div class="input-group" > 
                         <span class="input-group-addon">部门选择</span>
                             <select class="form-control input-sm m-bot15" onchange="getDatatype()"  id="typeselect3">			      
                           </select>	
                
                         </div>
                       </div>
                         
                         
                         
                  <table class="table table-hover table-striped">
		           <thead>
		         	<tr>
                        <th class="col-lg-1">序号</th>
						<th class="col-lg-2">会议室</th>
						<th class="col-lg-4">会议地址</th>
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
          
          <div class="col-lg-4">
                <section class="panel">
                <div class="panel-body">
                   <div class="panel panel-default">
                    <div class="panel-body" style="font-size:18px">
                          <div class="row"> 
					           <div class="col-lg-7">
                                                                                                          设备信息
						       </div>	   
				           </div>
                    </div>
                   </div>
                   <div class="clearfix" >

                        <ul id="shebei" class="row"> 
                        
				               <!-- <li class="col-lg-6 col-lg-offset-1">
                                <input type='checkbox' name='box' onclick="updateRF(this)"/>                                                    
						         <div style='display:none' class='fuid'></div>
						        </li> 	
						        <li class="col-lg-6 col-lg-offset-1">
                                <input type='checkbox' name='box' onclick="updateRF(this)"/>                                                     
						         <div style='display:none' class='fuid'></div>
						       </li> 	
						        <li class="col-lg-6 col-lg-offset-1">
                                <input type='checkbox' name='box' onclick="updateRF(this)"/>                                                   
						         <div style='display:none' class='fuid'></div>
						       </li>  		 -->			
				        </ul>
		
	               </div>
              </div>
             </section>
           </div>
      </div>
    </div>
        <!--body wrapper end-->
    </div>
    <!-- main content end-->
    
    
    
    <!-- Modal -->
    <form id="updataroom" method="post" enctype="multipart/form-data">
               <div class="modal" id="updatedialog" data-backdrop='static' tabindex="-1" role="dialog" aria-hidden="true">
                     <div class="modal-dialog" style="width:60%">
                           <div class="modal-content">
                               <div class="modal-header">
                                   <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                       <h5 class="modal-title">会议室信息</h5>
                                </div>
                               <div class="modal-body row" >
                                      <div class="col-lg-5">
                                          <!-- <img src="Static/images/room1.jpg" height="300px" width="100%" alt=""> -->

                                            <div class="form-group" style="margin-top:10px">
                                             <img alt="" id="myImgc" src="" height="300px" width="100%">
                                                <input name="pict"  type="file" id="exampleInputFile"   accept="image/*"  onchange="changeImg(event)">
                                           
                                            </div>
                                      </div>
                                       <div class="col-lg-7">
                                                <div class="form-group row">
                                                   <div class="col-lg-7">
                                                    <label>名称</label>
                                                      <input name="roname" id="rname" style="background:#ffffff"  class="form-control">
                                                   </div>
                                                    <div class="col-lg-5">
                                                    <label>容量</label>
                                                      <input name="rocapacity" id="rcapacity" style="background:#ffffff"  class="form-control">
                                                   </div>
                                                 </div>
                                                <div class="form-group">
                                                    <label>会议室类型</label>
                                                      <select name="roselect" class="form-control input-sm m-bot15" onchange="getData(fromdate,todate)" id="typeselect">
						                               
                                                      </select>	
                                                </div>
                                                 <div class="form-group">
                                                    <label>地址</label>
                                                    <textarea name="roaddr" id="raddr" rows="1" class="form-control"></textarea>
                                                </div>
                                                   <div class="form-group">
                                                    <label>备注</label>
                                                    <textarea name="romemo" id="rmemo" rows="2" class="form-control"></textarea>
                                                </div>
                                      </div>
                               </div>
                                <div class="modal-footer">
				                          
				                           <button type="button" id="ok5" onclick="updataroom()" class="btn btn-primary">
					                                                                                   修改                  
				                           </button>
				                           <button type="button" id="cancel5" class="btn btn-default" data-dismiss="modal">取消
			                               	</button>                       
		                        </div>
                            </div>
				   </div>
		    </div>
		    </form>
         <!-- 添加框 -->
         <form id="addroom" method="post" enctype="multipart/form-data">
                        <div class="modal" id="adddialog" data-backdrop='static' tabindex="-1" role="dialog" aria-hidden="true">
                     <div class="modal-dialog" style="width:60%">
                           <div class="modal-content">
                               <div class="modal-header">
                                   <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                       <h5 class="modal-title">会议室信息</h5>
                                </div>
                               <div class="modal-body row" >
                               
                                      <div class="col-lg-5">
                                         <!--  <img src="Static/images/room1.jpg" height="300px" width="100%" alt=""> -->

                                            <div class="form-group" style="margin-top:10px">
                                            <img alt="" id="myImg" src="" height="300px" width="100%">
                                                <input name="pic" type="file" id="exampleInputFile1"  accept="image/*"  onchange="changImg(event)">   
                                            </div>
                                            
                                            
   
                                      </div>
                                     
                                       <div class="col-lg-7">
                                                <div class="form-group row">
                                                   <div class="col-lg-7">
                                                    <label>名称</label>
                                                      <input name="rrrname" id="rrname" style="background:#ffffff"  class="form-control">
                                                   </div>
                                                    <div class="col-lg-5">
                                                    <label>容量</label>
                                                      <input name="rrrcapacity" id="rrcapacity" style="background:#ffffff"  class="form-control">
                                                   </div>
                                                 </div>
                                                <div class="form-group">
                                                    <label>会议室类型</label>
                                                      <select  name="rrrselect" class="form-control input-sm m-bot15" onchange="getData(fromdate,todate)" id="typeselect1">
						                               
                                                      </select>	
                                                </div>
                                                 <div class="form-group">
                                                    <label>地址</label>
                                                    <textarea name="rrraddre" id="rraddr" rows="1" class="form-control"></textarea>
                                                </div>
                                                   <div class="form-group">
                                                    <label>备注</label>
                                                    <textarea name="rrrmemo" id="rrmemo" rows="2" class="form-control"></textarea>
                                                </div>
                                      </div>
                               </div>
                                <div class="modal-footer">
				                          
				                           <button type="button" id="ok5" onclick="addmroom()" class="btn btn-primary">
					                                                                                   添加                 
				                           </button>
				                           <button type="button" id="cancel5" class="btn btn-default" data-dismiss="modal">取消
			                               	</button>                       
		                        </div>
                            </div>
				   </div>
		    </div>
		    </form>
 </section>

 <!-- Placed js at the end of the document so the pages load faster -->
    <script src="Static/js/jquery-1.10.2.min.js"></script>
    <script src="Static/js/jquery-ui-1.9.2.custom.min.js"></script>
    <script src="Static/js/jquery-migrate-1.2.1.min.js"></script>
    <script src="Static/js/bootstrap.min.js"></script>
    <script src="Static/js/modernizr.min.js"></script>
    <script src="Static/js/jquery.nicescroll.js"></script>
    
    
    <script type="text/javascript" src="JS/jquery-form.js"></script>
    <script type="text/javascript" src="JS/page.js"></script>
    <!--common scripts for all pages-->
    <script src="Static/js/scripts.js"></script>
    
    
    <script>
    var updatetype;
    
    getData();
    device();
    typp()
    typpp();
    typppp();
    var setid;
    var roleid;
    var deviid;
    function getData(){
    	$.ajax({
     		type:"post",
     		url:"/MeetingRoomMS/getAllRoomsInfoServ",
     		dataType:"json",
     		success:function(ja){
     			$("#roleinfo").children().remove();
     			for(var i=0;i<ja.length;i++)
     			{
     				var a=i+1;    
     				$("#roleinfo").append("<tr class='rolerow' id='rd' onclick='showdevice(this)'><td>"+a+"&nbsp;&nbsp;<a onclick='update(this)'>修改</a></td><td class='troom'>"+ja[i].room+"</td><td class='taddre'>"+ja[i].address+"</td><td><a  style='color:red' onclick='remove(this)'>删除</a></td><td style='display:none' class='troomid'>"+ja[i].roomid+"</td><td style='display:none' class='tcapacity'>"+ja[i].capacity+"</td><td style='display:none' class='timgsrc'>"+ja[i].imgsrc+"</td><td style='display:none' class='ttype'>"+ja[i].type+"</td><td style='display:none' class='tmemo'>"+ja[i].memo+"</td></tr>");
     			
     			}
     		}
     		
     	});
    }
    //获取设备信息
    var da = new Array();
    
    function device(){
    	
    	$.ajax({
     		type:"post",
     		url:"/MeetingRoomMS/getDeviceInfoServ",
     		dataType:"json",
     		success:function(ja){
     			for(var i=0;i<ja.length;i++){
     				da[i]=ja[i].deid;
     				$("#shebei").append("<li class='col-lg-6 col-lg-offset-1'><input type='checkbox' name='box' onclick='updateRF(this)'/>"+ja[i].de+"<div style='display:none' class='fuid'>"+ja[i].deid+"</div>");
     			}
     		}
     		
     	});
    }
    
    //会议室改变、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、。。。。
    function getDatatype(){
    	//alert($("#typeselect3").val());
    	if($("#typeselect3").val()==0){getData();}
    	else{
    		$.ajax({
         		type:"post",
         		url:"/MeetingRoomMS/getTypeRoomInfServ",
         		data:{"tid":$("#typeselect3").val()},
         		dataType:"json",
         		success:function(ja){
         			$("#roleinfo").children().remove();
         			for(var i=0;i<ja.length;i++)
         			{
         				var a=i+1;    
         				$("#roleinfo").append("<tr class='rolerow' id='rd' onclick='showdevice(this)'><td>"+a+"&nbsp;&nbsp;<a onclick='update(this)'>修改</a></td><td class='troom'>"+ja[i].room+"</td><td class='taddre'>"+ja[i].address+"</td><td><a  style='color:red' onclick='remove(this)'>删除</a></td><td style='display:none' class='troomid'>"+ja[i].roomid+"</td><td style='display:none' class='tcapacity'>"+ja[i].capacity+"</td><td style='display:none' class='timgsrc'>"+ja[i].imgsrc+"</td><td style='display:none' class='ttype'>"+ja[i].type+"</td><td style='display:none' class='tmemo'>"+ja[i].memo+"</td></tr>");
         			
         			}
         		}
         		
         	});
    	}
    }

    //添加图片后预览
    function changImg(e){    
            for (var i = 0; i < e.target.files.length; i++) {    
                var file = e.target.files.item(i);    
                if (!(/^image\/.*$/i.test(file.type))) {    
                    continue; //不是图片 就跳出这一次循环    
                }    
                //实例化FileReader API    
                var freader = new FileReader();    
                freader.readAsDataURL(file);    
                freader.onload = function(e) {    
                    $("#myImg").attr("src",e.target.result);    
                }    
            }    
        }   
  //修改图片后预览
    function changeImg(e){    
            for (var i = 0; i < e.target.files.length; i++) {    
                var file = e.target.files.item(i);    
                if (!(/^image\/.*$/i.test(file.type))) {    
                    continue; //不是图片 就跳出这一次循环    
                }    
                //实例化FileReader API    
                var freader = new FileReader();    
                freader.readAsDataURL(file);    
                freader.onload = function(e) {    
                    $("#myImgc").attr("src",e.target.result);    
                }    
            }    
        }  
    
    //添加。。。。。。。。。。。。。。。。。。
    function addmroom(){

    	if($("#rrname").val()!=""&&$("#rrcapacity").val()!=""&&$("#rraddr").val()!=""&&$("#rrmemo").val()!=""&&$("#exampleInputFile1").val()!=""){	
        var options  = {  
           type:"Post",  
           url:"/MeetingRoomMS/addRoomServ",
           dataType:"json",
           success:function(){ 
        	   getData();
             }
        };
        $("#addroom").ajaxSubmit(options);
    	}
    	else{alert("请填写完整");}
        
    }
    //修改-----------------------------------------
    function updataroom(){
    	//alert(setid);
    	
    	if($("#rname").val()!=""&&$("#rcapacity").val()!=""&&$("#raddr").val()!=""&&$("#rmemo").val()!=""&&$("#exampleInputFile").val()!=""){	
            var options  = {  
               type:"Post",  
               url:"/MeetingRoomMS/updataRoomServ?iddd="+setid,
               dataType:"json",
               success:function(){
            	   $("#typeselect3").val("0");
            	   getData();
            	     alert("修改成功");
            	   
                 }
            };
            $("#updataroom").ajaxSubmit(options);
            
        	}
        	else{alert("请填写完整");}
            $("#updatedialog").modal('hide');
    }
 
    //会议室类型
    function typppp(){
    	$.ajax({
		      type:"Post",
		      url:"/MeetingRoomMS/getRoomTypeServ",      
		      dataType:"json",
		      success:function(ja){	     
		         for(var i=0;i<ja.length;i++){
		        	
		        	 if(updatetype==ja[i].type){
		        		 $("#typeselect").append("<option  selected='selected' value='"+ja[i].typeid+"'>"+ja[i].type+"</option>");
		        	 }
		        	 else{
                      $("#typeselect").append("<option value='"+ja[i].typeid+"'>"+ja[i].type+"</option>");
		        	 }
               }
			   },
			  error:function(){alert("加载失败");}
	   });
    }
    
    //会议室类型
    function typpp(){
    	$.ajax({
		      type:"Post",
		      url:"/MeetingRoomMS/getRoomTypeServ",		      
		      dataType:"json",
		      success:function(ja){	     
		         for(var i=0;i<ja.length;i++){
	
                      $("#typeselect1").append("<option value='"+ja[i].typeid+"'>"+ja[i].type+"</option>");	
                     
               }
			   },
			  error:function(){alert("加载失败");}
	   });
    }
    function typp(){
    	$.ajax({
		      type:"Post",
		      url:"/MeetingRoomMS/getRoomTypeAServ",		      
		      dataType:"json",
		      success:function(ja){	     
		         for(var i=0;i<ja.length;i++){

                      $("#typeselect3").append("<option value='"+ja[i].typeid+"'>"+ja[i].type+"</option>");
               }
			   },
			  error:function(){alert("加载失败");}
	   });
    }
    // 点击删除。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。
    function remove(obj){
  	  var roomid;
  	  //alert($(obj).parent().siblings(".idd").text());
  	  roomid=$(obj).parent().siblings(".troomid").text();
  	  if(confirm("是否删除")){
  	       // alert($(obj).parent().siblings(".idd").text());
  	       
  		  $.ajax({
  	    		type:"post",
  	    		url:"/MeetingRoomMS/deleteRoomInfoServ",
  	    		data:{"roomid":roomid},
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


      function update(obj){
    	  
       $("#updatedialog").modal('show');
       $("#rname").val($(obj).parent().siblings(".troom").text());
       $("#rcapacity").val($(obj).parent().siblings(".tcapacity").text());
       $("#raddr").val($(obj).parent().siblings(".taddre").text());
       updatetype=$(obj).parent().siblings(".ttype").text();
       $("#rmemo").val($(obj).parent().siblings(".tmemo").text());
       var s=$(obj).parent().siblings(".tmemo").text();
       //$("#exampleInputFile").val("accept='image/jpg'");
       //$("#exampleInputFile").attr("accept",$(obj).parent().siblings(".timgsrc").text());
       $("#myImgc").attr("src",$(obj).parent().siblings(".timgsrc").text());
       //alert($(obj).parent().siblings(".timgsrc").text());
       //$("#imgs").append("<img src="+$(obj).parent().siblings(".timgsrc").text()+" height='200' width='200'>");
    /*    $("#exampleInputFile").val($(obj).parent().siblings(".timgsrc").text());
       alert($(obj).parent().siblings(".timgsrc").text()) */
       setid=$(obj).parent().siblings(".troomid").text();
      }
      
      var rid;
      //点击某一行、、、、、、、、、、、、、、、、、、、、、、、、、
      function showdevice(obj){
    	  $(".rolerow").removeAttr("style","background");
          $("input[name='box']").removeAttr("checked");
          $(obj).css("background","#dcdcdc");
    	   rid=$(obj).children().siblings(".troomid").text();
    	 // alert(rid);
    	   $.ajax({
 	    		type:"post",
 	    		url:"/MeetingRoomMS/getRoomDeviceServ",
 	    		data:{"did":rid},
 	    		dataType:"json",
 	    		success:function(ja){
 	    			check(ja);
 	    		}
 	    		
 	    	});
      }
      
      function check(arr){
          var boxArray=$("input[name='box']");
          for(var i=0;i<arr.length;i++){
           boxArray.each(
           function (){  
             if((arr[i].dvid+"")==$(this).siblings(".fuid").text()){
               $(this).attr("checked","checked");
               return true;
             }              
           });
          }
    }
	  
      function updateRF(obj){
    	  
      	//alert(rid);
      	var rolede= $(obj).siblings(".fuid").text();
      //	alert(rolede);
        if(obj.checked){
            $.ajax({
    		      type:"Post",
    		      url:"/MeetingRoomMS/updateRoomDeviceServ",
    		      data:{"roomid":rid,"roleid":rolede},
    		      async:false,
    		      dataType:"json",
    		      success:function(flag){	
                      if(flag==1){alert("设置角色成功");}
                      else{
                         alert("设置失败");
                      }
    			  },
    			  error:function(){alert("加载失败");}
    	   }); 
           
        }
        else{
          $.ajax({
    		      type:"Post",
    		      url:"/MeetingRoomMS/deleteRoomDeviceServ",
    		      data:{"roomid":rid,"roleid":rolede},
    		      async:false,
    		      dataType:"json",
    		      success:function(flag){	
                      if(flag==1){alert("取消角色成功");}
                      else{
                         alert("设置失败");
                      }
    			   },
    			  error:function(){alert("加载失败");}
    	   }); 
         
       }
      
      } 
      function add(){
    	 
    	  $("#adddialog").modal('show');
    	  $("#rrname").val("");
          $("#rrcapacity").val("");
          $("#rraddr").val("");
          $("#rrmemo").val("");
          $("#exampleInputFile1").val("");
          $("#myImg").attr("src","");   
      }
    </script>
 </body>
</html>
