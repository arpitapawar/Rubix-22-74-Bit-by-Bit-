package Hospital;

import java.io.IOException;
import java.sql.ResultSet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class ConsultForm
 */
@WebServlet("/ConsultForm")
public class ConsultForm extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static String specialization=null;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.print("hey");
		specialization=request.getParameter("consult");
		System.out.print(specialization);
		System.out.println(request.getSession().getAttribute("email"));
		if(request.getSession().getAttribute("email")==null){
			//if user has not logged in uname(username is the label) will be null
			response.sendRedirect("docLog.html");
		}
		else {
		Database obj=new Database();
		ResultSet rs=obj.getDoc(specialization);
		System.out.println("hey1");
		response.sendRedirect("appointment.jsp");
		}		
		
	}

}
