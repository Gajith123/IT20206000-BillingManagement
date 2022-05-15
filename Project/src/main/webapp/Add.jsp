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
  <h3 class="text-center">Add Bill Details</h3>  
  <br>
  
  <div class="card">
  <div class="card-body">    
  <form method="post" action="Process.jsp">  
  	
  	<div class="form-group">  
      <label>Bill No:</label>  
      <input type="text" name="billno" class="form-control" placeholder="Type Bill No.." required="">  
    </div>
          
    <div class="form-group">  
      <label>Name:</label>  
      <input type="text" name="name" class="form-control" placeholder="Type Name.." required="">  
    </div>  
      
    <div class="form-group">  
      <label>Account No:</label>  
      <input type="text" name="account" class="form-control" placeholder="Type Account No.."  required="">  
    </div> 
    
    <div class="form-group">  
      <label>Payment:</label>  
      <input type="number" name="payment" class="form-control" placeholder="Type Payment.." required="">  
    </div> 
    
    <div class="form-group">  
      <label>Date:</label>  
      <input type="date" name="date" class="form-control" placeholder="Type Date.." required="">  
    </div> 
     
    <button type="submit" class="btn btn-success save-btn">Add Bill</button>  
      
  </form> 
  </div>
  </div>
  
</div>   
</body>
</html>