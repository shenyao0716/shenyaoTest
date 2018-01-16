<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
session.removeAttribute("userid");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>登录界面</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
    <link href="Static/css/style.css" rel="stylesheet">
    <link href="Static/css/style-responsive.css" rel="stylesheet">
   
   
    <script src="JS/jquery.js"></script>
</head>

<body class="login-body">

<div class="container">

    <form class="form-signin" action="./loginServ">
        <div class="form-signin-heading text-center">
            <h1 class="sign-title">个人业务查询系统</h1>
            <img src="Static/images/logo.png" alt=""/>
        </div>
        <div class="login-wrap" style="text-align:center ">
            <input type="text" name="uname" id="name2" class="form-control" placeholder="用户名" autofocus>
            <input type="password"  name="pwd" id="pwd2"class="form-control" placeholder="密码">
              <button class="btn btn-login "  style="width:60px;font-size:15px; id="login" type="submit">
                                             确定
            </button>
               &nbsp;&nbsp;&nbsp;&nbsp;
            <button class="btn btn-login "  style="width:60px;font-size:15px;"  id="cancel" type="submit">
                                             取消
            </button>
         
         
        </div>

    </form>
</div>


<script>
  $("#cancel").click(function(){
    $("#name2").val("");
    $("#pwd2").val("");
       
   });

   
</script>
</body>
</html>
