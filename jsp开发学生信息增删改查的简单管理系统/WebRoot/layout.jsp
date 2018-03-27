<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>  

<% String path=request.getContextPath(); //得到一个相对路径
String basePath=request.getScheme()+"://" +request.getServerName()+path+":"+request.getServerPort()+path+"/";
 %>
 
 <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
 <html>
  <head>
     <title>学生的信息</title>
     <meta http-equiv="pragma"content="no-cache">
     <meta http-equiv="cache-control"content="no-cache">
     <meta http-equiv="expires" content="0">
     <meta http-equiv="keywords"content="keyword1,keyword2,keyword3">
     <meta http-equiv="description"content="This is my page"> 
    <!--link rel="stylesheet" type="text/css" href="styles.css" -->
        </head>
      <body>
        
        <%
         response.setCharacterEncoding("UTF-8");
         request.setCharacterEncoding("UTF-8");
         String id=request.getParameter("id");
         String name=request.getParameter("name");
         String age=request.getParameter("age");
         String gender=request.getParameter("gender");
         String major=request.getParameter("major");
         Connection conn=null;
         Statement stat=null;
         ResultSet rs=null;  
         Class.forName("com.mysql.jdbc.Driver");//数据库的驱动的名字
         String url="jdbc:mysql://127.0.0.1:3306/normal?useUnicode=true&characterEncoding=UTF-8&useOldAliasMetadataBehavior=true";//数据库的地址
         String user="root";//用户名称
         String password="";//数据库的密码
         conn=DriverManager.getConnection(url,user,password); 
        stat=conn.createStatement(); 
        String sql="select * from students";
        String a="";
        if(id!=null && id.length()>0)
        {
          a=" id='"+id+"'";
        }
        
        if(name!=null&& name.length()>0)
        {
	        if(a.length()>0){
	          a=a+" and name like '"+name+"'";
	        
	        }else
	        {
	            a=" name='"+name+"'";    
	         }
        }  
           
           if(age!=null&&age.length()>0){
           		if(a.length()>0){
           		 a=a+" and age like '"+age+"'";
           	}
           		else{
       		     a=" age='"+age+"'";   
           		}
           }
           
           
           if(gender!=null&&gender.length()>0){
           		if(a.length()>0){
           		a=a+"and gender like '"+gender+"'";
           		}
           		else	{
           		
           		a="gender='"+gender+"'";
           		}
            
           }
           
           if(major!=null&&major.length()>0){
           		if(major.length()>0)	{
           		 a=a+"And major like'"+major+"'";
           		}
           		else	{
           		  a="major='"+major+"'";
           		}
           
           }
        
        if(a.length()>0)
        {
        sql=sql+" where "+a;
        }
         rs=stat.executeQuery(sql);
        %>
           <h2>学生的信息</h2>
           <hr>
           <table width="450" border="100"cellSpacing="1" style="font-size:15pt ;border:dashed 1pt" color="red">
             <tr>
               <td>学号</td>
               <td>性别</td>
               <td>年龄</td>
               <td>姓名</td>
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
    %>
     <td><a href="submit.jsp?id=<%=rs.getInt("id") %>">增加</a></td>
     <td><a href="delete.jsp?id=<%=rs.getInt("id") %>">删除</a></td>
     <td><a href="update3.jsp?id=<%=rs.getInt("id") %>">修改</a></td>
    <%
    out.print("</tr>");
    }
  
    %>

      </table>
               
               <form action="layout.jsp" method="post">
               <h3>按学号查询:<input type="text" name="id" value=""title="学号不能为空"></input> 
                                                  按姓名查询：<input type="text"name="name" value=""title="名字不能为空"></input>   
                                                  按年龄查询:<input type="text"name="age"value=""title="年龄不能为空"></input>
                                                 按专业查询:<input type="text"name="major"value=""title="专业不能为空"></input>
                  <input type="submit" value="查询"/></h3>
                     </form> 
                 <h3> <a href="submit.jsp">返回信息输入框</a></h3>
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
