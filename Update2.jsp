<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UpdateInfo</title>
</head>

<%
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "project1";
String userId = "root";
String password = "";

try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
PreparedStatement pst =null;
%>
<link rel="stylesheet" href="update2.css">
<body>
<div class="container">
<div class="navbar">
<img src="images/logo1.png" class="logo">
<nav>
<ul>
<li><a href="index.html">Home</a></li>
<li><a href="">About</a></li>
<li><a href="">Contact Us</a></li>
</ul>
</nav>
</div>

<form action="service.html">
<input type="submit" class="btn1" value="Back">
</form>
<%
String c = request.getParameter("code1");
try {

connection = DriverManager.getConnection(
connectionUrl + dbName, userId, password);
String sql = "SELECT * FROM product where code="+"'"+c+"'";
pst=connection.prepareStatement(sql);

resultSet = pst.executeQuery(sql);
if (resultSet.next()) {
%>
<div class="inputs">
<form action="Update3.jsp">
<input type="text" name="pname1" value="<%=resultSet.getString("name") %>">
<br><br>
<input type="text" name="pqt1"  value="<%=resultSet.getString("quantity") %>">
<br><br>
<input type="text"  name="pprice1" value="<%=resultSet.getString("price") %>">
<br><br>
<input type="text"  name="code11" value="<%=resultSet.getString("code") %>">
<br><br>
<input type="submit" value="Update" class="btn1">
</form>
</div>
<%
}

} catch (Exception e) {
e.printStackTrace();
}
%>

</div>
</body>
</html>
