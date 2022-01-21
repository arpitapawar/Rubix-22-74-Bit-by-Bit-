package Hospital;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;


/**
 * Servlet implementation class Pat_Acct
 */
@MultipartConfig
@WebServlet("/Pat_Acct")
public class Pat_Acct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.print("in pat_acct.java");
		String name=request.getParameter("name");
		String Contact=request.getParameter("contact");
		String gender=request.getParameter("gender");
		String bday=request.getParameter("bday");
		String address=request.getParameter("address");
		String email=request.getParameter("email");
		String hist=request.getParameter("hist");
		Part profile=request.getPart("profile");
		String profile_name=profile.getSubmittedFileName();
		System.out.println(profile_name);
		
		String uploadPath_prof="C:/Users/ARPITA PAWAR/eclipse-workspace/HospitalDemo/Client_doc/"+profile_name;
		System.out.println(uploadPath_prof);

		
		//for profile
		FileOutputStream fos1=new FileOutputStream(uploadPath_prof);
		InputStream is1=profile.getInputStream();
		
		byte[] data1 =new byte[is1.available()];
		is1.read(data1);
		fos1.write(data1);
		fos1.close();
		
		Database obj=new Database();
		obj.pat_details(name,Contact,gender,bday,address,email,hist,profile_name);
		response.sendRedirect("pat_home.html");
	}

}
