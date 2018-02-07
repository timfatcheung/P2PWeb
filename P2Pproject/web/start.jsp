
<%@ page errorPage="error.jsp" import="java.util.Set,java.util.Iterator,java.util.Map,sukhwinder.chat.*" import="controller.UserBean"%>
<%
	String roomname = request.getParameter("rn");
	UserBean User = (UserBean) (session.getAttribute("SessionUser"));
	ChatRoomList roomlist = (ChatRoomList) application.getAttribute("chatroomlist");
	if (User.getUserName() == null)
	{
               System.out.println(User.getUserName());
		response.sendRedirect("login.jsp");
	}
	else if (roomname == null)
	{
		response.sendRedirect("listrooms.jsp");
	}
	else
	{
		ChatRoom chatRoom = roomlist.getRoom(roomname);
		if (chatRoom == null)
		{
			out.write("<font color=\"red\" size=\"+1\">Room " + roomname + " not found</font>");
			out.close();
			return;
		}
		ChatRoom chatRoomOld = roomlist.getRoomOfChatter(User.getUserName());
		if (chatRoomOld != null && chatRoom != null)
		{
			Chatter chatter = chatRoomOld.getChatter(User.getUserName());
			
			if (!chatRoomOld.getName().equals(chatRoom.getName()))
			{
				chatRoomOld.removeChatter(User.getUserName());
				chatRoom.addChatter(chatter);
				if (!chatRoomOld.getName().equalsIgnoreCase("StartUp"))
				{
					chatRoomOld.addMessage(new Message("system", User.getUserName() + " has left and joined " + 	chatRoom.getName() + ".", new java.util.Date().getTime()));
				}
				chatRoom.addMessage(new Message("system", User.getUserName() + " has joined.", new java.util.Date().getTime()));
				chatter.setEnteredInRoomAt(new java.util.Date().getTime());

			}

			if (session.getAttribute("SessionUser") == null)
			{
				session.setAttribute("SessionUser", User.getUserName());
			}
			response.sendRedirect("chat.jsp");
		}
		else
		{
			out.write("<span class=\"error\">Some error occured");
		}
	}	
%>