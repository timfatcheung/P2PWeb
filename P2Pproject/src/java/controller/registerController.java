/**
 *
 * @author cheungtimfat
 */
 
package controller;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class registerController extends HttpServlet {

    @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, java.io.IOException {

try
{	    
     UserBean user = new UserBean();
     user.setUserName(request.getParameter("username"));
     user.setEmail(request.getParameter("email"));
     user.setGender(request.getParameter("gender"));
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
          response.sendRedirect("index.jsp"); //login failed
} 
		
		
catch (Throwable Exception) 	    
{
     System.out.println(Exception); 
}
       }
	}