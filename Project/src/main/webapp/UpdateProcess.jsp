<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost/bill_management";%>
<%!String user = "root";%>
<%!String psw = "";%>

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
	String billno = request.getParameter("billno");
	String name=request.getParameter("name");
	String account=request.getParameter("account");
	String payment=request.getParameter("payment");
	String date=request.getParameter("date");
	
	if(billno != null)
	{
	Connection con = null;
	PreparedStatement ps = null;
	int billNo = Integer.parseInt(billno);
	
	try
	{
	Class.forName(driverName);
	con = DriverManager.getConnection(url,user,psw);
	String sql="Update bills set billno=?, name=?, account=?, payment=?, date=? where billno="+billno;
	ps = con.prepareStatement(sql);
	ps.setString(1, billno);
	ps.setString(2, name);
	ps.setString(3, account);
	ps.setString(4, payment);
	ps.setString(5, date);
	int i = ps.executeUpdate();
	
	if(i > 0)
	{
	out.print("Record Updated Successfully");
	}
	else
	{
	out.print("There is a problem in updating Record.");
	} 
	}
	
	catch(SQLException sql)
	{
	request.setAttribute("error", sql);
	out.println(sql);
	}
	}
%>

  <br>
  <div class="container text-center">
       <a href="./" class="btn btn-success">Go to Bill Details </a>
  </div>

</body>
</html>
