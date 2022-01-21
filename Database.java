package Hospital;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;	

public class Database {
public Connection Con() throws Exception {
		
		String url="jdbc:mysql://localhost:3306/Hospital";
		String uname="root";
		String pass="Arp123@";
				
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con=DriverManager.getConnection(url,uname,pass);
	
		return con;
	}

public void addDoc(String name, String email, String pwd) {
	Connection c = null;
	try {
		c = Con();
	} catch (Exception e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}

	try {
		String query="insert into DocSign values(?,?,?)";
		PreparedStatement ps=c.prepareStatement(query);
		ps.setString(1,name);
		ps.setString(2,email);
		ps.setString(3,pwd);
		int count=ps.executeUpdate();
		System.out.println(count + "row/s affected");
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
}

public boolean checkDoc(String email, String pwd) {
	// TODO Auto-generated method stub
	Connection c=null;
	
		try {
			c = Con();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
          String query="select *from DocSign where email=? and password=?";
          try {
			PreparedStatement ps=c.prepareStatement(query);
			ps.setString(1,email);  
			ps.setString(2,pwd);  
			ResultSet rs=ps.executeQuery(); 
			if(rs.next()) { // if there is a record return true,rs.next also checks if there is any resultset
				return true;
			}
	}catch(Exception e) {
		e.printStackTrace();
	}
	
	return false;	
}

public void addPat(String name, String email, String pwd) {
	// TODO Auto-generated method stub
	Connection c = null;
	try {
		c = Con();
	} catch (Exception e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}

	try {
		String query="insert into PatSign values(?,?,?)";
		PreparedStatement ps=c.prepareStatement(query);
		ps.setString(1,name);
		ps.setString(2,email);
		ps.setString(3,pwd);
		int count=ps.executeUpdate();
		System.out.println(count + "row/s affected");
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	
	
}
	
}

public boolean checkPat(String email, String pwd) {
	Connection c=null;
	
	try {
		c = Con();
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
      String query="select *from PatSign where email=? and password=?";
      try {
		PreparedStatement ps=c.prepareStatement(query);
		ps.setString(1,email);  
		ps.setString(2,pwd);  
		ResultSet rs=ps.executeQuery();
		
		if(rs.next()) { // if there is a record return true,rs.next also checks if there is any resultset
			return true;
		}
       }catch(Exception e) {
	    e.printStackTrace();
         }

     return false;	
    }


public ResultSet getDoc(String specailization) {
	Connection c=null;
	
	try {
		c = Con();
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	System.out.println("in getdoc");
      String query="select *from doc_details  where specialization=?";
      try {
		PreparedStatement ps=c.prepareStatement(query);
		ps.setString(1,specailization);  
		ResultSet rs=ps.executeQuery();
			return rs;
			
		
       }catch(Exception e) {
	    e.printStackTrace();
         }

     return null;	
    }


public void doc_details(String name, String specialization, String qualification, String qual_file_name,
		String exp, String contact, String gender, String[] timeslot, String profile_name, String email) {
	// TODO Auto-generated method stub
Connection c=null;
	
	try {
		c = Con();
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	System.out.println("in getdoc");
      String query="insert into doc_details values(?,?,?,?,?,?,?,?,?,?)";
      try {
		PreparedStatement ps=c.prepareStatement(query);
		ps.setString(1,name);  
		ps.setString(2,specialization); 
		ps.setString(3,qualification); 
		ps.setString(4,qual_file_name); 
		ps.setString(5,exp); 
		ps.setString(6,contact); 
		ps.setString(7,gender); 
		String time=null;
		for(int j= 0; j<timeslot.length; j++)
	        { if(j==0)
			  time=timeslot[j]+",";
	        else time=time+timeslot[j]+",";
	        }
		System.out.println("time"+time);
		ps.setString(8,time); 
		ps.setString(9,profile_name); 
		ps.setString(10,email); 
		int count=ps.executeUpdate();	
		
       }catch(Exception e) {
	    e.printStackTrace();
         }

}

public boolean checkDocDetailsAvailable(String email) {
Connection c=null;
	
	try {
		c = Con();
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	System.out.println("in checkdocDetails");
      String query="select *from doc_details  where email=?";
      try {
		PreparedStatement ps=c.prepareStatement(query);
		ps.setString(1,email);  
		ResultSet rs=ps.executeQuery();
		if(rs.next()) { // if there is a record return true,rs.next also checks if there is any resultset
			return true;
		}
       }catch(Exception e) {
	    e.printStackTrace();
         }
	// TODO Auto-generated method stub
	return false;
}

public void pat_details(String name, String contact, String gender, String bday, String address, String email,
		String hist, String profile_name) {
Connection c=null;
	
	try {
		c = Con();
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	System.out.println("in patdetails");
      String query="insert into pat_details values(?,?,?,?,?,?,?,?)";
      try {
		PreparedStatement ps=c.prepareStatement(query);
		ps.setString(1,name);  
		ps.setString(2,contact); 
		ps.setString(3,gender); 
		ps.setString(4,bday); 
		ps.setString(5,address);
		ps.setString(6,email);
		ps.setString(7,hist);  
		ps.setString(8,profile_name); 
		int count=ps.executeUpdate();
		System.out.print("patient added to database");
		
       }catch(Exception e) {
	    e.printStackTrace();
         }
	// TODO Auto-generated method stub
	
}

public boolean checkPatDetailsAvailable(String email) {
	// TODO Auto-generated method stub
Connection c=null;
	
	try {
		c = Con();
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	System.out.println("in checkpatDetails");
      String query="select *from pat_details  where email=?";
      try {
		PreparedStatement ps=c.prepareStatement(query);
		ps.setString(1,email);  
		ResultSet rs=ps.executeQuery();
		if(rs.next()) { // if there is a record return true,rs.next also checks if there is any resultset
			System.out.print(rs.getString(1)); 
			return true;
		}
       }catch(Exception e) {
    	   System.out.print("in else");
	    e.printStackTrace();
         }
	return false;
}

public void appointment(String name, String contact, String health_issue, String date, String doc_name,
		String slot) {
	// TODO Auto-generated method stub
Connection c=null;
	
	try {
		c = Con();
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	System.out.println("in patdetails");
      String query="insert into appointment values(?,?,?,?,?,?)";
      try {
		PreparedStatement ps=c.prepareStatement(query);
		ps.setString(1,name);  
		ps.setString(2,contact); 
		ps.setString(3,health_issue); 
		ps.setString(4,date); 
		ps.setString(5,doc_name);
		ps.setString(6,slot);
		
		int count=ps.executeUpdate();	
		
       }catch(Exception e) {
	    e.printStackTrace();
         }
}
public boolean checkAppointmentExists(String date,String slot) {
	// TODO Auto-generated method stub
Connection c=null;
	
	try {
		c = Con();
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	System.out.println("in checkAppointment");
      String query="select *from appointment where appoint_date=? and slot=?";
      try {
		PreparedStatement ps=c.prepareStatement(query);
		ps.setString(1,date);  
		ps.setString(2,slot);  
		ResultSet rs=ps.executeQuery();
		if(rs.next()) { // if there is a record return true,rs.next also checks if there is any resultset
			System.out.print(rs.getString(1)); return true;
		}
       }catch(Exception e) {
    	   System.out.print("in else");
	    e.printStackTrace();
         }
	return false;
}

public ResultSet checkPat(String email) {
	// TODO Auto-generated method stub
Connection c=null;
	
	try {
		c = Con();
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	System.out.println("in checkPatDoc");
	String query=null;
	PreparedStatement ps;
	ResultSet rs;
	 try {
	  query="select *from pat_details  where email=?";
		ps=c.prepareStatement(query);
		ps.setString(1,email);  
		rs=ps.executeQuery();
		return rs;
		
	
	 }catch(Exception e) {
    	   System.out.print("in else");
	    e.printStackTrace();
         }
	return null;
}
public ResultSet checkDoc(String email) {
	// TODO Auto-generated method stub
Connection c=null;
	
	try {
		c = Con();
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	System.out.println("in checkPatDoc");
	String query=null;
	PreparedStatement ps;
	ResultSet rs;
	 try {
	  query="select *from doc_details  where email=?";
		ps=c.prepareStatement(query);
		ps.setString(1,email);  
		rs=ps.executeQuery();
		return rs;
		
	
	 }catch(Exception e) {
    	   System.out.print("in else");
	    e.printStackTrace();
         }
	return null;
}
public ResultSet checkAppointForPatient(String name) {
	// TODO Auto-generated method stub
Connection c=null;
	
	try {
		c = Con();
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	System.out.println("in checkPatDoc");
	String query=null;
	PreparedStatement ps;
	ResultSet rs;
	 try {
	  query="select *from appointment where pat_name=?";
		ps=c.prepareStatement(query);
		ps.setString(1,name);  
		rs=ps.executeQuery();
		return rs;
		
	
	 }catch(Exception e) {
    	   System.out.print("in else");
	    e.printStackTrace();
         }
	return null;
}
public ResultSet checkAppointForDoc(String name) {
	// TODO Auto-generated method stub
Connection c=null;
	
	try {
		c = Con();
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	System.out.println("in checkPatDoc");
	String query=null;
	PreparedStatement ps;
	ResultSet rs;
	 try {
	  query="select pat_details.name, pat_details.contact, pat_details.gender, pat_details.hist, appointment.health_issue, appointment.appoint_date, appointment.slot from pat_details inner join appointment on appointment.pat_name=pat_details.name where doc_name=?";
		ps=c.prepareStatement(query);
		ps.setString(1,name);  
		rs=ps.executeQuery();
		return rs;
		
	
	 }catch(Exception e) {
    	   System.out.print("in else");
	    e.printStackTrace();
         }
	return null;
}


}


