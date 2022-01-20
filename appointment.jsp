<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ page import="java.sql.ResultSet" import="Hospital.Database" import="Hospital.ConsultForm"%>
<!DOCTYPE html>
<html>
<head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
       
        <link rel="stylesheet" href="style/appointment.css">
        <title>Appointment</title>
        
    
</head>
<body>
<%
if(request.getSession().getAttribute("email")==null){
	//if user has not logged in uname(username is the label) will be null
	response.sendRedirect("docLog.html");
}

String special=ConsultForm.specialization;
Database obj=new Database();
ResultSet rs=obj.getDoc(special);	
String slot=null;
String[] slot_arr=null;
int i=0;
%>

        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        
        <header class="header">
        <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #980F5A;">
            <a class="navbar-brand" href="#" style="color: rgb(255, 255, 255); font-family: cursive; font-size: 30px; font-weight: 400; margin-left:3%;margin-right: 80px; text-shadow: 2px 2px 5px ;">VitaCure</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
            
          
            <div class="collapse navbar-collapse" id="navbarSupportedContent" >
              <ul class="navbar-nav mr-auto" >
                <li class="nav-item active">
                  <a class="nav-link" href="pat_home.html" style="padding-right: 15px; color:white; font-size:20px;">Home </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="doctor.html" style="padding-right: 15px; padding-left: 15px; color:white; font-size:20px;">Doctors</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="medicine.html" style="padding-right: 15px; padding-left: 15px; color:white; font-size:20px;">Medicines</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#" style="padding-right: 15px; padding-left: 15px; color:white; font-size:20px;">Lab Tests</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#"  style="color:white; font-size:20px;">About Us</a>
                </li>
                
              </ul>
              <form action="Logout" method="post" form-inline my-2 my-lg-0">           
                <button class="btn btn-light" style="margin-left:600px; border-radius: 15px 50px; background-color: rgb(250, 243, 245); color: rgb(91, 21, 105); " value="Logout" type="submit">
                  <a style="color:black; text-decoration:none">Logout</a></button>
              </form>
              
              
            </div>
        </nav>
        
        </header>
        <h2 style="margin: 80px 0 30px 60px; display: flex;">Appointment Form</h2>
        
        <div class="form1">
          <form class="form" action="Appointment" method="post">
              
              <label style=" margin-top: 30px;">Name</label>
              <br>
              <input type="text" placeholder="Full Name" name="name" style=" width: 500px;"/>
              <br>
              <label>Contact Number</label>
              <br>
              <input type="text" placeholder="Number" name="contact" style="width: 500px;" />
              <br>
              <label>Health Problem</label>
              <br>
              <textarea type="tel" placeholder="Health Problem" name="health_issue" style=" width: 500px; height: 100px;"></textarea>
              <br>
              <label>Date</label>
              <br>
              <input type="date" placeholder="dd-mm-yyyy" name="date" style=" width: 500px;"/>
              <br>
              <label>Doctor's Name</label><select name="doc_name" style="width: 500px;">
              <br>
  
                <% while(rs.next()){
	           String doc=rs.getString(1);
	           slot=rs.getString(8);
	           slot_arr=slot.split(",");
	           for(int j=0;j<slot_arr.length;j++){System.out.print(slot_arr[j]);}
	           System.out.print("------doc-----"+doc);
                  %>
         <option value="" disabled selected hidden>Select your option</option>
         <option value=<%= doc %> > <%= doc %> </option>
  
            <% } %> 
             
           </select><br>
            <label>book slot</label><select name="slot" style="width: 500px;">
              <br>
            <% for(int j=0;j<slot_arr.length;j++){ 
            	String slot1=slot_arr[j];
                  %>
         <option value="" disabled selected hidden>Select your option</option>
         <option value=<%= slot1%> > <%= slot1%> </option>
  
           
            <% } %> 
           </select><br> <br><br>
              <button type="submit" class="btn btn-primary" style=" margin-bottom: 30px;">Submit</button>
          </form>
      </div>
</body>
</html>