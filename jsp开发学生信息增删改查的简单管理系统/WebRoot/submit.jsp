<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%String path=request.getContextPath() ;
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
  %>
  <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
  <html>
    <head>
    <base href="<%=basePath%>">
     <title>输入学生信息界面</title>
     <meta http-equiv="program" content="no-cache">
     <meta http-equiv="cache-control" content="no-cache">
     <meta http-equiv="expires" content="0">
     <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
     <meta http-equiv="description" content="This is my page">
     <!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
       <script type="test/javascript">
         function validate(){
         var id=document.forms[0].id.vaule;
         var age=document.forms[0].age.vaule;
         var name=document.forms[0].name.vaule;
         var major=document.forms[0].major.vaule;
         
if(id<=0){
         alter("学号不能为空，请输入学号");
         return false;
 }
        
else if(name.length<=0){
        alter("姓名不能为空，请输入姓名");
        return false;
}
       
else if(age<=0){
       alter("年龄不能为空，请输入年龄");
       return false;
}
      
 else if(major<=0){
       alter("专业不能为空，请输入所学专业");
       return false;
}

else{
        return ture;    
}
 }
       </script>

  </head>
    <body>
       <center>
  
       <form action="insert.jsp" method="post" id="form" onSubmit="return validate()">
       <h4>学号:<input type="text" name="id" class="{required:true}"></input></h4>
       <h4>姓名:<input type="text" name="name"></input></h4>
       <h4>年龄:<input type="text" name="age"></input></h4>
       <h4>性别:<input type="radio" name="gender" value="女">女
               <input type="radio" name="gender" value="男">男</h4>
       <h4>专业:<input type="text" name="major"></input></h4>
        <input type="submit" value="提交"/>
       </form>      
     </center>
         <a href=layout.jsp>查看已输入的信息</a>
     </body> 
    </html>