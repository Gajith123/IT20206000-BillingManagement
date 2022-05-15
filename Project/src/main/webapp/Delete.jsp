<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>Billing Management</title>  
  	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
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

<%
	String billno=request.getParameter("billno");
	try
	{
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/bill_management", "root", "");
	Statement st=conn.createStatement();
	int i=st.executeUpdate("DELETE FROM bills WHERE billno="+billno);
	out.println("Data Deleted Successfully!");
	}
	catch(Exception e)
	{
	System.out.print(e);
	e.printStackTrace();
	}
%>

  <br>
  <div class="container text-center">
       <a href="./" class="btn btn-success">Go to Bill Details </a>
  </div>

</body>
</html>
