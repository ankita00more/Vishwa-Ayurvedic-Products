<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page import="java.io.*" %> 
    

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
<%
try {
	
String c2 = request.getParameter("code11");

String c1=(String)c2;


PrintWriter pw = response.getWriter();

connection = DriverManager.getConnection(
connectionUrl + dbName, userId, password);
String sql = "delete from product where code =?";
pst=connection.prepareStatement(sql);
pst.setString(1, c1);


int status = pst.executeUpdate();
pw.print(status);
if (status > 0) {
RequestDispatcher rd = request.getRequestDispatcher("Delete.jsp");
rd.forward(request, response);
}
else{
	pw.print("Something went wrong...");
	pw.print("<a href='Update.jsp'>Try Again..</a>");

}

} catch (Exception e) {
e.printStackTrace();
}
%>

</div>
</body>
</html>
