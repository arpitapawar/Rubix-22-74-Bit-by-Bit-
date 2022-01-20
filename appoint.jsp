<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="java.sql.ResultSet;" %>
<!DOCTYPE html>
<html>
<head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="style/navbar.css">
        <link rel="stylesheet" href="style/appointment.css">
        <title>Hello, world!</title>    
</head>
<body>
<%
ResultSet rs=(ResultSet)request.getAttribute("resultSet");

%>
  
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        
        <header class="header">
        <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #ffbd00;">
            <a class="navbar-brand" href="#">Navbar</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
          
            <div class="collapse navbar-collapse" id="navbarSupportedContent" >
              <ul class="navbar-nav mr-auto" >
                <li class="nav-item active">
                  <a class="nav-link" href="main.html">Home </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#">Find Doctors</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#">Medicines</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#">Lab Tests</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#">Video Consult</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Information</a>
                  </li>
              </ul>
              <form class="form-inline my-2 my-lg-0">           
                <button class="btn btn-light" style="margin-right: 68px; border-radius: 15px 50px; background-color: rgb(250, 243, 245); color: rgb(91, 21, 105);" type="submit">
                   </button>
              </form>
            </div>
        </nav>
        </header>
        <h2 style="margin: 80px 0 30px 60px; display: flex;">Appointment Form</h2>
        
        <div class="form1">
          <form class="form" action="#">
              
              <label style=" margin-top: 30px;">Name</label>
              <br>
              <input type="text" placeholder="Full Name" style=" width: 500px;"/>
              <br>
              <label>Contact Number</label>
              <br>
              <input type="text" placeholder="Number" style="width: 500px;" />
              <br>
              <label>Health Problem</label>
              <br>
              <textarea type="tel" placeholder="Health Problem" style=" width: 500px; height: 100px;"></textarea>
              <br>
              <label>Date</label>
              <br>
              <input type="date" placeholder="dd-mm-yyyy" style=" width: 500px;"/>
              <br>
              <label>Doctor's Name</label><select name="doc" style="width: 500px;">
              <br>
              <% while(rs.next()){ 
              String doc=rs.getString(1);
              %>
               <option value="" disabled selected hidden>Select your option</option>
               <option value=<%= doc %> > <%= doc %> </option>
              <br>
              
              <% } %>
              </select>
              
              <button type="submit" class="btn btn-primary" style=" margin-bottom: 30px;">Submit</button>
          </form>
      </div>
</body>
</html>