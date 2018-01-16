<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%            
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户使用情况</title>
    
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
                 <li class="menu-list "><a href="JSP/index.jsp"><i class="fa fa-file-text"></i><span>会议清单管理</span></a>      
                      <ul class="sub-menu-list">
                        <li><a href="JSP/advance.jsp">预定会议信息 </a></li>
                         <li><a href="JSP/ing.jsp">正在开始会议信息 </a></li>
                         <li><a href="JSP/over.jsp">已结束会议信息 </a></li>
                         <li><a href="JSP/cancel.jsp">已取消会议信息 </a></li>
                     </ul>
                 </li>
                 <li class="menu-list "><a href="JSP/index.jsp"><i class="fa fa-home"></i> <span>会议室管理</span></a>      
                      <ul class="sub-menu-list">
                        <li><a href="JSP/room.jsp">会议室信息查询</a></li>
                     </ul>
                 </li>
                 <li class="menu-list   nav-active "><a href="JSP/index.jsp"><i class="fa fa-bar-chart-o"></i> <span>统计信息管理</span></a>      
                      <ul class="sub-menu-list">
                        <li><a href="JSP/rsage.jsp">会议室使用情况报表</a></li>
                        <li  class="active"><a href="JSP/usage.jsp">用户使用情况报表</a></li>
   
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
                                                                                                           用户使用情况表
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
                         <span class="input-group-addon">用户选择</span>
                         <select class="form-control input-sm m-bot15" onchange="getData(fromdate,todate)" id="userselect">
						      
                         </select>		

                      </div>
					 </div>
		           <div class="btn-group col-lg-3  col-lg-offset-6" id="addcustomer">
                                 <button id="editable-sample_new" onclick="show()" class="btn btn-primary">
                                                                                                   图表展示 <i class="fa  fa-bar-chart-o"></i>
                                 </button>
                      </div>
			      </div>
                <table class="table table-hover table-striped">
		          <thead>
		         	<tr>
			        	<th class="col-lg-1">序号</th>
				        <th class="col-lg-1">用户性名</th>     
				        <th class="col-lg-1">9-10</th>
				        <th class="col-lg-1">10-11</th>
				        <th class="col-lg-1">11-12</th>
				        <th class="col-lg-1">12-13</th>
				        <th class="col-lg-1">13-14</th>
				        <th class="col-lg-1">14-15</th>
				        <th class="col-lg-1">15-16</th>
				        <th class="col-lg-1">16-17</th>
				        <th class="col-lg-1">总计</th>
			        </tr>
		          </thead>
	              <tbody id="Info">
	         	    <tr>
			        	
			       </tr>
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
    
      <!-- Modal -->
               <div class="modal" id="bardialog" data-backdrop='static' tabindex="-1" role="dialog" aria-hidden="true">
                     <div class="modal-dialog">
                           <div class="modal-content">
                             <div class="modal-header">
                               <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                               <h4 class="modal-title">用户使用情况图</h4>
                             </div>
                               <div class="modal-body" >                     
                                   <section class="panel">
                                     <div class="panel-body">
                                      <div id="graph">
                                
                                       </div>

                                     </div>
                                  </section>
                               </div>
                            </div>
				   </div>
		    </div>
		    <!-- 反馈-->
		    	      <div class="modal" id="fbackdialog" data-backdrop='static' tabindex="-1" role="dialog" aria-hidden="true">
                     <div class="modal-dialog" >
                           <div class="modal-content">
                               <div class="modal-header">
                                   <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                       <h5 class="modal-title">使用反馈</h5>
                                </div>
                               <div class="modal-body ">
                                            
                                             <div class="row"  style="margin-top:10px">
                                               <div class="col-lg-12">
                                                    <label><strong>反馈</strong></label>
                                                    <textarea id="cxcontent"  rows="4" class="form-control"></textarea>
                                                </div>
                                             </div>
                                        </div>
                                <div class="modal-footer">

				                           <button onclick="feedback()" type="button" id="cancel5" class="btn btn-default">提交反馈
			                              	</button>
			                              	<button type="button" id="cancel5" class="btn btn-default" data-dismiss="modal">取消
			                               	</button>                       
		                        </div>
                            </div>
				   </div>
		    </div>
         <!-- modal -->
    <!-- main content end-->
 </section>

 <!-- Placed js at the end of the document so the pages load faster -->
    <script src="Static/js/jquery-1.10.2.min.js"></script>
    <script src="Static/js/jquery-ui-1.9.2.custom.min.js"></script>
    <script src="Static/js/jquery-migrate-1.2.1.min.js"></script>
    <script src="Static/js/bootstrap.min.js"></script>
    <script src="Static/js/modernizr.min.js"></script>
    <script src="Static/js/jquery.nicescroll.js"></script>
    
          <script src="https://img.hcharts.cn/jquery/jquery-1.8.3.min.js.js"></script>
    <script src="https://img.hcharts.cn/highcharts/highcharts.js"></script>
    <script src="https://img.hcharts.cn/highcharts/modules/exporting.js"></script>
    <script src="https://img.hcharts.cn/highcharts-plugins/highcharts-zh_CN.js"></script>
    
     <script type="text/javascript" src="JS/js/laydate.js"></script>
    <script type="text/javascript" src="JS/page.js"></script>
    <!--common scripts for all pages-->
    <script src="Static/js/scripts.js"></script>
    
    
    <script>

   //默认近30天
     var fromdate=getdate(-30);
     var todate=getdate(0);
     var arrdata=[];
    $("#from").val(fromdate);
    $("#to").val(todate);
    
    getUser();
      getData(fromdate,todate);  
	laydate.skin('molv');//日历切换皮肤，请查看skins下面皮肤
	
	//日期范围限制
    var start = {
       elem: '#from',
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
	  
	function getUser(){
         $.ajax({
      		      type:"Post",
      		      url:"./getRoomUserTypeServ",
      		      async:false,		      
      		      dataType:"json",
      		      success:function(ja){	     
      		         for(var i=0;i<ja.length;i++){

                            $("#userselect").append("<option value='"+ja[i].userid+"'>"+ja[i].name+"</option>");
                     };
      			   },
      			  error:function(){alert("加载失败");}
      	   });	
      }  
      
   function getData(fromdate,todate){

         $.ajax({
      		      type:"Post",
      		      url:"./getUserUsageServ",		
      		      data:{"userid": $("#userselect").val(),"from":fromdate,"to":todate},      
      		        async:false,
      		      dataType:"json",   
      		      success:function(array){	     
      		         $("#ui-page1").paging({pageSize:3,totalPage:Math.ceil(array.length/20),content:array});
      			     arrdata.splice(0,arrdata.length);
      			     arrdata=array;

      			     
      			   },
      			  error:function(){alert("加载失败");}
      	   });	

    }
    
    
   /* 更新数据,page.js中点调用 ,表格分页 */
  function sendAjax(page,size,array){
	  $("#Info").children().remove();
	  var total=array.length;
      if(total!=0){
          var index=(page-1)*size;
          var last;
          if(total-index>size){
            last=page*size;
          }else {
             last=total;
          }
          for(var i=index;i<last;i++){

            $("#Info").append("<tr><td>"+(i+1)+"&nbsp;&nbsp;<a onclick='fback(this)'>反馈</a></td><td>"
                     +array[i].name+"</td><td>"
                      +array[i].one+"</td><td>"
                      +array[i].two+"</td><td>"
                      +array[i].three+"</td><td>"
                      +array[i].four+"</td><td>"
                      +array[i].six+"</td><td>"
                      +array[i].seven+"</td><td>"
                      +array[i].six+"</td><td>"
                      +array[i].eight+"</td><td>"
                      +array[i].amount+"</td><td style='display:none' class='idd'>"
                      +array[i].userid+"</td><tr>");
          }
      }
 } 
   
   function fback(obj){
	   uid=$(obj).parent().siblings(".idd").text();
	   //alert(uid);
	   $("#fbackdialog").modal('show');
	   $("#cxcontent").val("");


   }
   
function feedback(){
	   if($("#cxcontent").val()==""){alert("反馈不可为空");} 
	   else{
		   $.ajax({
   		type:"post",
		url:"/MeetingRoomMS/userUseSituationFbackServ",
		data:{"reason":$("#cxcontent").val(),"userid":uid},
		dataType:"json",
		success:function(flag){
			if(flag>0)
	    	 {
				alert("反馈成功");
	    		
	    	 } else
	  	        alert("反馈失败");	 
		}
	});
		   }
}
 
 
 function show(){
 
    $("#bardialog").modal('show');

    graph();
 }
 
 function count(x){

   var count=0;
    if(x==1){
        arrdata.forEach(function(e){

            count+=parseFloat(e.one);
        });
    }else if(x==2){
       arrdata.forEach(function(e){
            count+=parseFloat(e.two);
        
        });
    }else if(x==3){
       arrdata.forEach(function(e){
            count+=parseFloat(e.three);
        
        });
    }else if(x==4){
       arrdata.forEach(function(e){
            count+=parseFloat(e.four);
        
        });
    }else if(x==5){
       arrdata.forEach(function(e){
            count+=parseFloat(e.five);
        
        });
    }else if(x==6){
       arrdata.forEach(function(e){
            count+=parseFloat(e.six);
        
        });
    }else if(x==7){
       arrdata.forEach(function(e){
            count+=parseFloat(e.seven);
        
        });
    }else{
       arrdata.forEach(function(e){
            count+=parseFloat(e.eight);
        
        });
    }

   return count;

 }
 
 
 function count1(x){

   var count=0;
    if(x==1){
        arrdata.forEach(function(e){

            count+=parseFloat(e.one1);
        });
    }else if(x==2){
       arrdata.forEach(function(e){
            count+=parseFloat(e.two1);
        
        });
    }else if(x==3){
       arrdata.forEach(function(e){
            count+=parseFloat(e.three1);
        
        });
    }else if(x==4){
       arrdata.forEach(function(e){
            count+=parseFloat(e.four1);
        
        });
    }else if(x==5){
       arrdata.forEach(function(e){
            count+=parseFloat(e.five1);
        
        });
    }else if(x==6){
       arrdata.forEach(function(e){
            count+=parseFloat(e.six1);
        
        });
    }else if(x==7){
       arrdata.forEach(function(e){
            count+=parseFloat(e.seven1);
        
        });
    }else{
       arrdata.forEach(function(e){
            count+=parseFloat(e.eight1);
        
        });
    }

   return count;

 }
 function graph(){

 
  $('#graph').highcharts({
        chart: {
            type: 'spline'
        },
        title: {
            text:'用户使用情况'
        },
        xAxis: {
            categories: ['9点', '10点', '11点', '12点', '13点', '14点',
                         '15点', '16点']
        },
        yAxis: {
            title: {
                text: '时长/h'
            }
        },
        tooltip: {
            crosshairs: true,
            shared: true
        },
        plotOptions: {
            spline: {
                marker: {
                    radius: 4,
                    lineColor: '#666666',
                    lineWidth: 1
                }
            }
        },
        series: [{
            name: '使用时长',
            marker: {
                symbol: 'square'
            },
            data: [count(1),count(2),count(3),count(4),count(5),count(6),count(7),count(8)]
            
        },{
            name: '预定时长',
            marker: {
                symbol: 'diamond'
            },
            data: [count1(1),count1(2),count1(3),count1(4),count1(5),count1(6),count1(7),count1(8)]
            
        }], credits: {
          enabled:false
        } 
    });
 
 }
    </script>
 </body>
</html>
