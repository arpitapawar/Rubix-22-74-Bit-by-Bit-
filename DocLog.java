package Hospital;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


/**
 * Servlet implementation class DocLog
 */
@WebServlet("/DocLog")
public class DocLog extends HttpServlet {
	private static final long serialVersionUID = 1L;
     public static String email=null;
     public static String pwd=null;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		email=request.getParameter("d_email");
		pwd=request.getParameter("d_password");
		Database obj=new Database();
		HttpSession session=request.getSession();
		if(obj.checkDoc(email,pwd)) {	//to check user has logged in and so we give them the access
		session.setAttribute("email",email);//label and value
		if(obj.checkDocDetailsAvailable(email))
		response.sendRedirect("doc1_home.html");
		else
			response.sendRedirect("doc_acct.html");
		//call another servlet and url is sq
			
		}
		else {
			response.sendRedirect("docLog.html");
		}
		}
	}


