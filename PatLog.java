package Hospital;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


/**
 * Servlet implementation class PatLog
 */
@WebServlet("/PatLog")
public class PatLog extends HttpServlet {
	public static String email=null;
	public static String pwd=null;
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("hey in patlog.java");
		email=request.getParameter("p_email");
		pwd=request.getParameter("p_pwd");
		System.out.println(email);
		System.out.println(pwd);
		HttpSession session=request.getSession();
		Database obj=new Database();
		if(obj.checkPat(email,pwd)) {	//to check user has logged in and so we give them the access
		session.setAttribute("email",email);//label and value
		if(obj.checkPatDetailsAvailable(email)) {
		//response.sendRedirect("pat_home.html");
		response.sendRedirect("pat_home.html");}
		else {
		response.sendRedirect("pat_acct.html");}
		//call another servlet and url is sq
		}
		else {
			System.out.print("else");
			response.sendRedirect("patLog.html");}

}
}
