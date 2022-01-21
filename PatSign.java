package Hospital;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class PatSign
 */
@WebServlet("/PatSign")
public class PatSign extends HttpServlet {
	private static final long serialVersionUID = 1L;

  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name=request.getParameter("p_name");
		String email=request.getParameter("p_email");
		String pwd=request.getParameter("p_pwd");
		Database obj=new Database();
		obj.addPat(name,email,pwd);
		
		response.sendRedirect("patLog.html");
	}

}
