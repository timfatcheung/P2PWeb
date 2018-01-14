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

public class loginController extends HttpServlet {
    
public void doPOST(HttpServletRequest request, HttpServletResponse response) throws ServletException, java.io.IOException {

try
{	    
     UserBean user = new UserBean();
     user.setEmail(request.getParameter("username"));
     user.setPassword(request.getParameter("password"));

     user = UserDAO.login(user);
	   		    
     if (user.isValid())
     {
	        
          HttpSession session = request.getSession(true);	    
          session.setAttribute("SessionUser",user); 
          response.sendRedirect("index.jsp"); //if logged-in,redirect     		
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