<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="Hospital.PatLog" import="Hospital.Database" import="java.sql.ResultSet" %>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="styles/navbar.css">
    <style>
      .container {
    display: table;
	justify-content: center;
	align-items: center;
    margin-top: 110px;
    background-color: rgb(250, 250, 250);
    padding-top: 30px;
    padding-bottom: 30px;
    width: 1000px;
}
h4 {
    color: #980F5A;
    margin: 10px 0 20px 15px;
}
.para {
    color: #980F5A;
    margin: 30px 0 20px 15px;
}
body {
    background-color: rgb(245, 210, 226);
}
    </style>
    <title>Patient Profile</title>
    
  </head>
  <body>
  <%
  if(session.getAttribute("email")==null){
		//if user has not logged in uname(username is the label) will be null
		
		response.sendRedirect("home.html");
	}
	
String email=PatLog.email;
Database obj=new Database();
ResultSet rs=obj.checkPat(email);
String name=null;
String path=null;
rs.next();
String pat_name=rs.getString("name");
	/*out.println(rs.getString(2));
	out.println(rs.getString(3));
	out.println(rs.getString(4));
	out.println(rs.getString(5));
	out.println(rs.getString(6));
	out.println(rs.getString(7));*/
	name=rs.getString("image");
	path="Client_doc/"+name;
	System.out.print(path);
ResultSet rs1=obj.checkAppointForPatient(pat_name);	

%>
  
    <header class="header">
    <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #980F5A;">
            <a class="navbar-brand" href="#" style="color: rgb(255, 255, 255); font-family: cursive; font-size: 30px; font-weight: 400; margin-left:3%;margin-right: 80px; text-shadow: 2px 2px 5px ;">VitaCure</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
            
          
            <div class="collapse navbar-collapse" id="navbarSupportedContent" >
              <ul class="navbar-nav mr-auto" >
                <li class="nav-item active">
                  <a class="nav-link" href="home.html" style="padding-right: 15px; color:white; font-size:20px;">Home </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="doctor.html" style="padding-right: 15px; padding-left: 15px; color:white; font-size:20px;">Doctors</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="medicines.html" style="padding-right: 15px; padding-left: 15px; color:white; font-size:20px;">Medicines</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#" style="padding-right: 15px; padding-left: 15px; color:white; font-size:20px;">Lab Tests</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#"  style="color:white; font-size:20px;">About Us</a>
                </li>
                
              </ul>
          <form action="Logout" method="post"  class="form-inline my-2 my-lg-0">    
            <p >
             <button class="btn btn-light" style="margin-right: 68px; border-radius: 15px 50px; background-color: rgb(250, 243, 245); color: rgb(91, 21, 105);" type="submit">
               <a style="color:black; text-decoration:none">Logout</a></button>
          </form>
        </div>
    </nav>
    </header>
    
    
    <div class="container">
        <div class="row">
          <div class="two" style="border-color: #ce3288; width: 270px; border-right-style: solid; padding-left: 50px;">
            <img class="card-img-top" src="Client_doc/<%= name %>"  alt="Card image cap">
            <h4 contentEditable="true"><%out.println(rs.getString("name")); %></h4>
            <p class="para" contentEditable="true"><%out.println(rs.getString("email")); %></p>
            <p class="para" contentEditable="true"><%out.println(rs.getString("contact")); %></p>
          </div>
          <div class="two" style="width: 600px; margin-left: 50px;">
                
              
                  <p>
                    <a class="btn " style="background-color: #ce3288; color: white;" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
                    Address
                    </a>
                </p>
                <div class="collapse" id="collapseExample">
                    <div class="card card-body">
                    <%out.println(rs.getString("address")); %>
                    </div>
                </div>
                <p>
                    <a class="btn " style="background-color: #ce3288; color: white; margin-top: 30px;" data-toggle="collapse" href="#collapseExample2" role="button" aria-expanded="false" aria-controls="collapseExample">
                    Medical History
                    </a>
                </p>
                <div class="collapse" id="collapseExample2">
                    <div class="card card-body">
                    <%out.println(rs.getString("hist")); %>
                    </div>
                </div>
                <p>
                    <a class="btn " style="background-color: #ce3288; color: white; margin-top: 30px;" data-toggle="collapse" href="#collapseExample3" role="button" aria-expanded="false" aria-controls="collapseExample">
                    Prescriptions
                    </a>
                </p>
                <div class="collapse" id="collapseExample3">
                    <div class="card card-body">
                    Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident.
                    </div>
                </div>
                <p>
                    <a class="btn " style="background-color: #ce3288; color: white; margin-top: 30px;" data-toggle="collapse" href="#collapseExample4" role="button" aria-expanded="false" aria-controls="collapseExample">
                    My Appointments
                    </a>
                </p>
                <div class="collapse" id="collapseExample4">
                    <div class="card card-body">
                      <table border='1'><tr><td>Health Issue</td><td>Appointment Date</td><td>Doctor</td><td>Slot</td><td>Meeting Link</td></tr>
                <% 
                while(rs1.next()) {
	           System.out.println("in while of pat_prof.jsp");
	            System.out.println("in while of pat_prof.jsp"+rs1.getString(6));%>
              <tr>
              <td><% out.println(rs1.getString(3)); %></td>
              <td><% out.println(rs1.getString(4)); %></td>
              <td><% out.println(rs1.getString(5)); %></td>
              <td><% out.println(rs1.getString(6)); %></td>
              <td>https://meet.google.com/kzg-qfry-cio</td>
           
                <% 
                   }
                  %>
                 </tr></table>
                    </div>
                </div>
         </div>
          
        </div>
    </div>
  
</body>
  
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    
</html>