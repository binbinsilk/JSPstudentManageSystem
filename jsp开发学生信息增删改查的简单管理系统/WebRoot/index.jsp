<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%String path= request.getContextPath();
   String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
 %>
 
 <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"> 
 <html>
   <head>
   <base href="<%=path%>">
   <title>插入学生的基本信息</title>
    <meta http-equiv="program"content="no-cache"> 
    <meta http-equiv="cache-control"content="no-cache">
    <meta http-equiv="expirs"content="0"> 
    <meta http-equiv="keywords"content="keyword1,keyword2,keyword3">
    <meta http-equiv="description"content="This is my page">
    <!-- 
     <link rel="stylesheet" type="text/css" href="style.css" >
       -->
    </head>
   <body>
    <a href="layout.jsp">学生信息管理</a>  
   </body>
   </html>