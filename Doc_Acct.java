package Hospital;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;


/**
 * Servlet implementation class Doc_Acct
 */
@MultipartConfig
@WebServlet("/Doc_Acct")
public class Doc_Acct extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.print("in doc_acct.java");
		String name=request.getParameter("name");
		String specialization=request.getParameter("specialization");
		String qualification=request.getParameter("qualification");
		Part qual_file=request.getPart("qual_file");
		String qual_file_name=qual_file.getSubmittedFileName();
		System.out.println(qual_file_name);
		String exp=request.getParameter("exp");
		String Contact=request.getParameter("contact");
		String gender=request.getParameter("gender");
		String[] timeslot=request.getParameterValues("timeslot");
		Part profile=request.getPart("profile");
		String profile_name=profile.getSubmittedFileName();
		System.out.println(profile_name);
		String email=request.getParameter("email");
		for ( int i =0; i < timeslot.length; i ++ ) {
			System.out.println("Value : " + i + " is : " + timeslot[i]);
			}
		System.out.println(timeslot);
		
		String uploadPath_qual="C:/Users/ARPITA PAWAR/eclipse-workspace/HospitalDemo/src/main/webapp/Client_doc/"+qual_file_name;
		System.out.println(uploadPath_qual);
		String uploadPath_prof="C:/Users/ARPITA PAWAR/eclipse-workspace/HospitalDemo/src/main/webapp/Client_doc/"+profile_name;
		System.out.println(uploadPath_prof);
		
		//for qualification
		FileOutputStream fos=new FileOutputStream(uploadPath_qual);
		InputStream is=qual_file.getInputStream();
		byte[] data =new byte[is.available()];
		is.read(data);
		fos.write(data);
		fos.close();
		
		//for profile
		FileOutputStream fos1=new FileOutputStream(uploadPath_prof);
		InputStream is1=profile.getInputStream();
		
		byte[] data1 =new byte[is1.available()];
		is1.read(data1);
		fos1.write(data1);
		fos1.close();
		
		Database obj=new Database();
		obj.doc_details(name,specialization,qualification,qual_file_name,exp,Contact,gender,timeslot,profile_name,email);
		
		response.sendRedirect("doc1_home.html");
	}
	

}
