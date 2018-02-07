
<%@ page session="true" import="sukhwinder.chat.ChatRoomList, sukhwinder.chat.ChatRoom" import="controller.UserBean"  errorPage="error.jsp"%>
<%
	UserBean User = (UserBean) (session.getAttribute("SessionUser"));
	if (User.getUserName() != null && (User.getUserName().length() > 0))
	{
		ChatRoomList roomList = (ChatRoomList) application.getAttribute("chatroomlist");
		ChatRoom room = roomList.getRoomOfChatter(User.getUserName());
		String roomname = room.getName();
%>
	
<HTML>
<HEAD>
<TITLE><%=User.getUserName()%> (<%=roomname%>) </TITLE>

</HEAD>
<FRAMESET rows="80%,20%">
<FRAME SRC="displayMessages.jsp#current" name="MessageWin">
<FRAME SRC="sendMessage.jsp" name="TypeWin">
</FRAMESET>
<NOFRAMES>
<H2>This chat rquires a browser with frames support</h2>
</NOFRAMES>
</HTML>
<%
}
else
{
	response.sendRedirect("registration.jsp");
}
%>