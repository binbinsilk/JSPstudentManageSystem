<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%String path=request.getContextPath();
  String basePath=request.getScheme()+"//"+request.getServerName()+":" +request.getServerPort()+path+"/";
  %>
 <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
  <html>
    <head>
       <base href=".">
       <title>修改页面</title>
       <meta http-equiv="progma" content="no-cache">
       <meta http-equiv="cache-control" content="no-cache">
       <meta http-equiv="expirs" content="no-cache">
       <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
       <meta http-equiv="decription" content="This is my page">
       <!--link rel="stylesheet" type="text/css" href="style.css" -->
       </head>
          <body>
            
            <% 
               request.setCharacterEncoding("UTF-8");
               String id1=request.getParameter("id");
               String name1=request.getParameter("name");
               String age1=request.getParameter("age");
               String gender1=request.getParameter("gender");
               String major1=request.getParameter("major");
                 Connection conn=null; 
                 Statement stat=null; 
                 ResultSet rs=null;
                 Class.forName("com.mysql.jdbc.Driver");
                 String url="jdbc:mysql://127.0.0.1:3306/normal?useUnicode=true&characterEncoding=UTF-8&useOldAliasMetadataBehavior=true";
                 String user="root";
                 String password="";
                 conn=DriverManager.getConnection(url,user,password); 
                 stat=conn.createStatement();          
                 stat.execute("update students set name='"+name1+"',age="+age1+",gender='"+gender1+"',major='"+major1+"' where id="+id1+"");
                  rs=stat.executeQuery("select * from students where id="+id1+""); 
%>

             
             
             
             <h3>修改成功！</h3>
            <h3>修改后的信息为：</h3>
<table width="450" border="100" cellSpacing=1 style="font-size:15pt;border:dashed 1pt">
    <tr>
    <td>学号</td>
    <td>姓名</td>
    <td>年龄</td>
    <td>性别</td>
    <td>专业</td>
    </tr>
    
    <% 
    while(rs.next())
    {
    out.print("<tr>");
    out.print("<td>"+rs.getInt("id")+"</td>");
    out.print("<td>"+rs.getString("name")+"</td>");
    out.print("<td>"+rs.getInt("age")+"</td>");
    out.print("<td>"+rs.getString("gender")+"</td>");
    out.print("<td>"+rs.getString("major")+"</td>");
    out.print("</tr>");
    }
    %>
      </table>
      
      <br>
      <br>
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
                 
          
           