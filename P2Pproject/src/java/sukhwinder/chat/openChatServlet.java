package sukhwinder.chat;

import controller.UserBean;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import sukhwinder.chat.*;
import javax.servlet.http.HttpSession;
import controller.*;

/**
@author Sukhwinder Singh
*/
public class openChatServlet extends HttpServlet
{
	private String contextPath = "";
	/** This method just redirects user to a login page.*/
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		contextPath = request.getContextPath();
		response.sendRedirect(contextPath + "/login.jsp");		
	}
	/** Performs some validation and if everything is ok sends user to a page which displays a list of
	* rooms available.
	*/
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		contextPath = request.getContextPath();	
                HttpSession session = request.getSession(true);
                UserBean username;
             username = (UserBean) session.getAttribute("SessionUser");
		if ((username != null))
		{
			try
			{
				ChatRoomList roomlist = (ChatRoomList)getServletContext().getAttribute("chatroomlist");
				
					int timeout = 1800; // 30 minutes
					String t = getServletContext().getInitParameter("sessionTimeout"); // gets Minutes
					if (t != null)
					{
						try
						{
							timeout = Integer.parseInt(t);
							timeout = timeout * 60;
						}
						catch (NumberFormatException nfe)
						{							
						}
					}
					session.setMaxInactiveInterval(timeout);;
					// Because Chatter objects are stored in room.
					// So before user selects any room he is added to a temporary room "StartUp"
					ChatRoom chatRoom = roomlist.getRoom("StartUp"); 
					Chatter chatter = null;
					chatter = new Chatter(username.getUserName(), new java.util.Date().getTime());
					chatRoom.addChatter(chatter);
					response.sendRedirect(contextPath + "/listrooms.jsp");

				
			}
			catch(Exception exception)
			{
				System.out.println("Exception thrown in LoginServlet: " + exception.getMessage());
				exception.printStackTrace();
				response.sendRedirect(contextPath + "/error.jsp");
			}
		}
		else
		{
			response.sendRedirect(contextPath + "/login.jsp?ic=t");
		}
	}
}