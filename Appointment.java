package Hospital;

import java.io.IOException;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class Appointment
 */
@WebServlet("/Appointment")
public class Appointment extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.print("hey");
		String name=request.getParameter("name");
		String contact=request.getParameter("contact");
		String health_issue=request.getParameter("health_issue");
		String date=request.getParameter("date");
		String doc_name=request.getParameter("doc_name");
		System.out.println("in appoint.java"+doc_name);
		String slot=request.getParameter("slot");
		System.out.println(date);
		System.out.println(slot);
		Database obj=new Database();

		if(obj.checkAppointmentExists(date,slot)) //to check user has logged in and so we give them the access
			response.sendRedirect("appointment1.jsp");
		else {
		obj.appointment(name,contact,health_issue,date,doc_name,slot);
		response.sendRedirect("pat_home.html");}
		
		
		
	}

}
