<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="Hospital.PatLog" import="Hospital.DocLog" import="Hospital.Database" import="java.sql.ResultSet" %>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    
    <title>Hello, world!</title>
    <style>
      .nav-link{
    font-size: 18px;
    color: rgb(250, 248, 248)!important;
    margin: 3px;
    
    
    }
    .nav-link:hover {
    border-bottom: 2px solid rgb(252, 248, 248);
    }
    .nav-link1:hover {
        text-decoration: none;
    }
    
    .navbar{
        overflow: hidden;
        position: fixed; 
        top: 0; 
        width: 100%;
        z-index: 1000;

    }
    @media only screen and (max-width: 1000px){
    .nav-link:hover{
    font-weight: 700;
    position: relative;
    border-bottom: none!important;
    }
    }
    .clear{
        clear: both;
        }
    .details {
    margin-top:-20%;
        right: 90px;
        position:relative;
    }
    </style>
  </head>
  <body>
  <%  
  String email=PatLog.email;
  String pwd=PatLog.pwd;
  Database obj=new Database();
  String fileName=null;
  if( obj.checkPat(email,pwd))
  fileName="pat_prof.jsp";
  else{
	  String email1=DocLog.email;
	  String pwd1=DocLog.pwd;
	  if( obj.checkDoc(email,pwd))
		  fileName="doc_home.jsp";}
  
System.out.print("filename"+fileName);
  %> 
  
  
    <header class="header">
    <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #980F5A;">
        <a class="navbar-brand" href="#" style="color: rgb(255, 255, 255); font-family: cursive; font-size: 30px; font-weight: 400; margin-right: 80px; text-shadow: 2px 2px 5px ;">VitaCure</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
      
        <div class="collapse navbar-collapse" id="navbarSupportedContent" >
          <ul class="navbar-nav mr-auto" >
            <li class="nav-item active">
              <a class="nav-link" href="home.html" style="padding-right: 15px;">Home </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="doctor.html" style="padding-right: 15px; padding-left: 15px;">Doctors</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#" style="padding-right: 15px; padding-left: 15px;">Medicines</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#" style="padding-right: 15px; padding-left: 15px;">Lab Tests</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">About Us</a>
            </li>
            
          </ul>
          <form class="form-inline my-2 my-lg-0">    
            <p >
              <button class="btn btn-light" style="margin-right: 5px; border-radius: 15px 50px; background-color: rgb(250, 243, 245); color: rgb(91, 21, 105);"
               type="button" data-toggle="collapse" data-target="#multiCollapseExample2" aria-expanded="false" aria-controls="multiCollapseExample2">Profile</button> </p>
           
          </form>
        </div>
    </nav>
    </header>
    
      <div class="details">
        <div class="collapse multi-collapse" id="multiCollapseExample2">
          <div class="card card-body" style="margin-top: 90px;">
            <a class="nav-link1" href=<%= fileName %> style="color: rgb(95, 41, 71); padding: 10px 30px; border-bottom-style: solid; border-color: rgb(95, 41, 71);"> My Details </a>
            <a class="nav-link1" href="home.jsp" style="color: rgb(95, 41, 71); padding: 10px 30px;"> Logout </a></button>
          </div>
        </div>
      </div>
  
</body>
  
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    
</html>