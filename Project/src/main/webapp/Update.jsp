<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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

<%
	try{
	connection = DriverManager.getConnection(connectionUrl+database, userid, password);
	statement=connection.createStatement();
	String sql ="select * from bills where billno="+billno;
	resultSet = statement.executeQuery(sql);
	while(resultSet.next()){
%>

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

<div class="container col-md-5">  
  <h3 class="text-center">Update Bill Details</h3>
  <br>
  
  <div class="card">
  <div class="card-body">    
  <form method="post" action="UpdateProcess.jsp">
	
  	<div class="form-group">  
      <label>Bill No:</label>  
      <input type="hidden" name="billno" class="form-control" value="<%=resultSet.getString("billno") %>">
      <input type="text" name="billno" class="form-control" value="<%=resultSet.getString("billno") %>"> 
    </div>
          
    <div class="form-group">  
      <label>Name:</label>  
      <input type="text" name="name" class="form-control" value="<%=resultSet.getString("name") %>">
    </div>  
      
    <div class="form-group">  
      <label>Account No:</label>  
      <input type="text" name="account" class="form-control" value="<%=resultSet.getString("account") %>">  
    </div> 
    
    <div class="form-group">  
      <label>Payment:</label>  
      <input type="number" name="payment" class="form-control" value="<%=resultSet.getString("payment") %>"> 
    </div> 
    
    <div class="form-group">  
      <label>Date:</label>  
      <input type="date" name="date" class="form-control" value="<%=resultSet.getString("date") %>">
    </div> 
     
    <button type="submit" class="btn btn-success save-btn">Update Bill</button>  
      
  </form> 
  </div>
  </div>
  
</div>  

<%
	}
	connection.close();
	}
	catch (Exception e) {
	e.printStackTrace();
	}
%>

</body>
</html>