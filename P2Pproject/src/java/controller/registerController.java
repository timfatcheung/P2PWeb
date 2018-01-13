/**
 *
 * @author cheungtimfat
 */
package controller;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class registerController extends HttpServlet {
    
public void collection(HttpServletRequest request, HttpServletResponse response) throws ServletException, java.io.IOException {

try
{	    
     UserBean user = new UserBean();
     user.setEmail(request.getParameter("username"));
     user.setPassword(request.getParameter("password"));
     user.setPassword2(request.getParameter("password2"));

     user = UserDAO.Resgister(user);
	   		    
     if (user.isValid())
     {
	        
          HttpSession session = request.getSession(true);	    
          session.setAttribute("SessionUser",user); 
          response.sendRedirect("login.jsp"); //if inserted,redirect     		
     }
	        
     else 
          response.sendRedirect("invalidLogin.jsp"); //login failed
} 
		
		
catch (Throwable Exception) 	    
{
     System.out.println(Exception); 
}
       }
	}