<%@ page contentType="text/html; charset=GB2312" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>登录</title>
</head><body bgcolor="#ffffc0">
<form method="POST" action="list.jsp">
<p align="center">
用户名：<input type="text" name="username" size="20">
</p>

<p align="center">
密 码：<input type="password" name="password" size="20">
</p>

<p align="center">
<input type="radio" value="manage" checked name="select">管理  
<input type="radio" name="select" value="statistic">统计
</p>

<p align="center">
<input type="submit" value="登 录" name="login">
<input type="reset" value="重 写" name="reset">
</p>

</form>
</body>
</html>