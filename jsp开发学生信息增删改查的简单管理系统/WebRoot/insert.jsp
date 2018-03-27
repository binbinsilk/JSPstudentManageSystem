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
    <% 
    request.setCharacterEncoding("UTF-8");
    String id=request.getParameter("id");
    String name=request.getParameter("name");
    System.out.println(name);
    String age=request.getParameter("age");
    String major=request.getParameter("major");
    String gender=request.getParameter("gender");
    Connection conn=null;
    Statement stat=null;
    ResultSet rs=null;
    Class.forName("com.mysql.jdbc.Driver");
    String url="jdbc:mysql://127.0.0.1:3306/normal?useUnicode=true&characterEncoding=UTF-8&useOldAliasMetadataBehavior=true";
    String user="root";
    String password="";
    conn=DriverManager.getConnection(url,user,password); 
    stat=conn.createStatement(); 
    rs=stat.executeQuery("select * from students where id="+id+"");
    boolean s=stat.execute("insert into students(id,name,age,gender,major) values("+id+",'"+name+"',"+age+",'"+gender+"','"+major+"')"); 
    %>
    <center>
   <%
    if(s)
    {
    out.print("<br><h3>输入失败</h3>");
    }
    else{
    out.print("<br><h3>成功输入！</h3>");
    }
  
    %>
   
      <br>
    <a href=submit.jsp>返回信息输入页面</a>   
    <a href=layout.jsp>进入信息查询页面</a> 
    </center>
     <% 
     if(rs!=null){
        rs.close();
     }
     if(stat!=null){
       stat.close();
     }
     if(conn!=null){
       conn.close();
     }
     %>
    </body>
   </html>
