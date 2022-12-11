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
<link rel="stylesheet" href="update.css">
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
<div class="search">
<form action="Update2.jsp">
<input type="text" placeholder="Enter Product Code" name="code1" >
<input type="submit" value="search" class="btn2"></form>
</div>
<br><br>
<h1 align="center"><font color="#232d60"><strong>Data</strong></font></h1>
<table class="tb1" cellpadding="4" cellspacing="4">
<tr>

</tr>
<tr bgcolor="#008000">
<td><b>Name</b></td>
<td><b>Code</b></td>
<td><b>Quantity </b></td>
<td><b>Price</b></td>
</tr>
<%
try {
connection = DriverManager.getConnection(
connectionUrl + dbName, userId, password);
statement = connection.createStatement();
String sql = "SELECT * FROM product";

resultSet = statement.executeQuery(sql);
while (resultSet.next()) {
%>
<tr bgcolor="#8FBC8F">

<td><%=resultSet.getString("name")%></td>
<td><%=resultSet.getString("code")%></td>
<td><%=resultSet.getString("quantity")%></td>
<td><%=resultSet.getString("price")%></td>

</tr>

<%
}

} catch (Exception e) {
e.printStackTrace();
}
%>
</table>

</div>
</body>
</html>