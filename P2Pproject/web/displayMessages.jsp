
<%@ page isErrorPage="false" errorPage="error.jsp" import="java.util.Set,java.util.Iterator,java.util.Map,java.util.Date,java.text.DateFormat,sukhwinder.chat.*"  import="controller.UserBean"%>
<%
	String roonName = null;
	UserBean User = (UserBean) (session.getAttribute("SessionUser"));
	ChatRoomList roomList = null;
	ChatRoom chatRoom = null;
	Chatter chatter = null;
	Message[] messages = null;

	if (User.getUserName() != null)
	{
            System.out.println(User.getUserName() + "1");
		try
		{
			roomList = (ChatRoomList) application.getAttribute("chatroomlist");
			roonName = roomList.getRoomOfChatter(User.getUserName()).getName();
			if (roonName != null && roonName != "")
			{
				chatRoom = roomList.getRoom(roonName);
				chatter = chatRoom.getChatter(User.getUserName());
				if (chatRoom != null)
				{
					long enteredAt = chatter.getEnteredInRoomAt();
					if (enteredAt != -1)
					{
						messages = chatRoom.getMessages(enteredAt);					
					}
					else
					{
						messages = chatRoom.getMessages(chatter.getLoginTime());
					}

				}
				else
				{
					out.write("<b>Room " + roonName + " not found</b>");
					out.close();
				}
			}
		}
		catch(Exception e)
		{
			System.out.println("Exception: "+ e.getMessage());
			throw new ServletException("Unable to get handle to ServletContext");
		}	
	
%>
<HTML>
<HEAD>
<!--<meta http-equiv="refresh" content="10">-->
<link rel="stylesheet" type="text/css" href="chat.css">
<%
	int refreshAfter = 1000; // 10 seconds
	String t = application.getInitParameter("refreshAfter"); // gets seconds
	if (t != null)
	{
		try
		{
			refreshAfter = Integer.parseInt(t);
			refreshAfter = refreshAfter * 1000; // convert to mili seconds
		}
		catch (NumberFormatException nfe)
		{							
		}
	}
%>
<script language="JavaScript" type="text/javascript">
<!--
function reload()
{
	window.location.reload();
}

setInterval('reload()', <%=refreshAfter%>);

function winopen(path)
{
	chatterinfo = window.open(path,"chatterwin","scrollbars=no,resizable=yes, width=400, height=300, location=no, toolbar=no, status=no");
	chatterinfo.focus();
}
//-->
</script>
</HEAD>
<BODY onLoad="window.location.hash='#current'" bgcolor="#FFFFFF">

<table width="100%" border="0">
<tr>
<td width="70%" valign="top">
<table>
<tr>
<td>
<h3> you are in room <b><%=roonName%></b></h3>
<%
	
	if(messages != null && messages.length > 0)
	{
		for (int i = 0; i < messages.length; i++)
		{
			Message message = (Message)messages[i];
			String chatterName = message.getChatterName();
			String strmsg = message.getMessage();
			long time = message.getTimeStamp();
			Date date = new Date(time);
                        String username = session.getAttribute("SessionUser").toString();

			if (chatterName.equalsIgnoreCase(username))
			{
				out.write("<font face=\"Arial\" size=\"2\" color=\"blue\"><b>" + chatterName + " ("+ DateFormat.getTimeInstance().format(date)+ ")&gt;</b></font> " + strmsg+"<br>\n");
			}
			else if (chatterName.equalsIgnoreCase("system"))
			{
				out.write("<span class=\"error\">" + strmsg+"</span><br>\n");
			}
			else
			{
				out.write("<font face=\"Arial\" size=\"2\"><b>"+chatterName + " ("+ DateFormat.getTimeInstance().format(date)+ ")&gt;</b></font> " + strmsg + "<br>\n");
			}			
		}
		out.write("<a name=\"current\"></a>");
	}
	else
	{
		out.write("<font color=\"red\" face=\"Arial\" size=\"2\">There are currently no messages in this room</font>");
	}
	out.write("<a name=\"current\"></a>");
	%>
</td>
</tr>
</table>
	</td>
	<td width="30%" valign="top">
	<table width="100%" border="1" cellpadding="2" cellspacing="0">
		<tr>
			<td>
			<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#2C259C">
		<tr>
			<td>
	<span class="white"><%=chatRoom.getNoOfChatters()%> people in this room</span><br>
	</td>
	</tr>
	</table>
	<%
	Chatter[] chatters = chatRoom.getChattersArray();
	for(int i = 0; i < chatters.length; i++)
	{
		if (chatters[i].getName().equals(session.getAttribute("SessionUser")))
		{
	%>
	<font face="Arial" size="2" color="blue"><%=chatters[i].getName() + " <br>"%></font> 
	<%
		}
		else
		{
			out.write("<font face=\"Arial\" size=\"2\"><a href=\"javascript:winopen('viewinfo.jsp?chatterName="+chatters[i].getName() + "')\" title=\"View information about "+chatters[i].getName()+"\">"+ chatters[i].getName()+"</a> </font><br>");
		}
	}

}
else
{
	response.sendRedirect("registration.jsp");
}
%>
		</td>
	</tr>
</table>
</td>
</tr>
</table>
</BODY>
</HTML>