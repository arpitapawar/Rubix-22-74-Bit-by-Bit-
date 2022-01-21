package Hospital;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DocSign
 */

public class DocSign extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name=request.getParameter("d_name");
		String email=request.getParameter("d_email");
		String pwd=request.getParameter("d_password");
		Database obj=new Database();
		obj.addDoc(name,email,pwd);
		
		response.sendRedirect("docLog.html");
	}

}
