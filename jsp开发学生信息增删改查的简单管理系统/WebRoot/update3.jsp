   <%@page language="java" import="java.util.*" pageEncoding="UTF-8" %>
   <%@ page import="java.sql.*"%>
   
   <% 
    String path=request.getContextPath();
    String basePath=request.getScheme()+"//"+request.getServerName()+":"+request.getServerPort()+path+"/";
     %>
   
    <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
    <html>
    <head>
      <base href=".">
      <title>学生信息</title>
        <meta http-equiv="progma" content="no-cache">
        <meta http-equiv="cache-control" content="no-cache">
        <meta http-equiv="expirs" content="0">
        <meta http-equiv="keywords" content="keywoord1,keyword2,keyword3">
        <meta http-equiv="decription" content="This is my page">
        <!-- 
         <link rel="stylesheet" type="text/css" href="style.css">
           --> 
      </head>
        
        <body>
           <%
             response.setCharacterEncoding("UTF-8");
             request.setCharacterEncoding("UTF-8");
             String id=request.getParameter("id");
             //String name=request.getParameter("name");
             //String age=request.getParameter("age");
             //String gender=request.getParameter("gender");
             //String major=request.getParameter("major");
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
              %>
               <br>
              <h3>要修改的学生信息如下</h3>
      <% 
               		  String s="";
               		  String a="";
               		  String b="";
               		  String c="";
               		  String e="";
               while(rs.next()){
                     e=rs.getString("id");
                     s=rs.getString("name");
                     a=rs.getString("age");
                     b=rs.getString("gender");
                     c=rs.getString("major");
                	 break;         
               }
              %>
 	<form action="update2.jsp" method="post" >
        <h4> 学号：<input type="text"   name="id"value="<%=e%>"    title="学号不能改变"></input><br></h4>
        <h4>  姓名：<input type="text" value="<%=s%>" name="name"  title="姓名不能为空"></input><br></h4>
        <h4>  年龄：<input type="text"  name="age"    value=<%=a%> title="年龄不能为空"></input><br></h4>
        <%
        if("男".equals(b)){            //若是男生，则选中男生按钮
    %>
    <input type="radio"  name="gender" value="男" checked="checked" />男
    <input type="radio"  name="gender" value="女" />女
    <%
        }else{                                    //否则，显示选中女生按钮
    %>
    <input type="radio" name="gender" value="男" />男
    <input type="radio" name="gender" value="女" checked="checked" />女
    <%
    }
    %>
      <h4>专业:<input type="text" name="major" value="<%=c%>"></h4>      
        <input type="submit" value="保存"/>
  </form>
        <h3><a href=submit.jsp>返回信息输入页面</a></h3>
		<h3><a href=layout.jsp>返回信息查询页面</a></h3>
    <% 
    if(rs!=null)
    {
        rs.close();
    }
    
        if(stat!=null)
    {
        stat.close();
    }
        if(conn!=null)
    {
        conn.close();
    }
    %> 
          </body>
      </html> 