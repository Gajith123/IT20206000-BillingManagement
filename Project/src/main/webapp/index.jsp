<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="java.sql.*,java.util.*"%>
<%@ page import="java.io.*" %> 
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
 
<%
	String billno = request.getParameter("billno");
	String driver = "com.mysql.jdbc.Driver";
	String connectionUrl = "jdbc:mysql://localhost/";
	String database = "bill_management";
	String userid = "root";
	String password = "";
	try {
	Class.forName(driver);
	} 
	catch (ClassNotFoundException e) {
	e.printStackTrace();
	}
	Connection connection = null;
	Statement statement = null;
	ResultSet resultSet = null;
%>

<html>
<head>
     <title>Billing Management</title>
     <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>

<body>

    <header>
        <nav class="navbar navbar-expand-md navbar-dark" style="background-color: orange">
            <div>
                <a class="navbar-brand">Billing Management</a>
            </div>

            <ul class="navbar-nav">
                <li><a href="./" class="nav-link">Bill List</a></li>
            </ul>
        </nav>
    </header>
    <br>
    
<div class="container">
    <h3 class="text-center">Bill Details</h3>
       <hr>
       
    <br>

	<table class="table table-bordered data-table" border="1">
	<tr>
		<td>Bill No</td>
		<td>Name</td>
		<td>Account No</td>
		<td>Payment</td>
		<td>Date</td>
		<td>Action</td>
	</tr>

<%
	try{
	connection = DriverManager.getConnection(connectionUrl+database, userid, password);
	statement=connection.createStatement();
	String sql ="select * from bills";
	resultSet = statement.executeQuery(sql);
	 int i=0;
	while(resultSet.next()) {
%>

	<tr>
		<td><%=resultSet.getString("billno") %></td>
		<td><%=resultSet.getString("name") %></td>
		<td><%=resultSet.getString("account") %></td>
		<td><%=resultSet.getString("payment") %></td>
		<td><%=resultSet.getString("date") %></td>
		<td><a href="Update.jsp?billno=<%=resultSet.getString("billno")%>" class="btn btn-success">Update</a> | 
		<a href="Delete.jsp?billno=<%=resultSet.getString("billno") %>" class="btn btn-danger">Delete</a></td>
	</tr>
<%
	i++;
	}
	connection.close();
	} 
	catch (Exception e) {
	e.printStackTrace();
	}
%>

</table>
<br>

	<div class="container text-center">
       <a href="Add.jsp" class="btn btn-success"> Add New Bill </a>
    </div>
	
</div>
</body>
</html>




