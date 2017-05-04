<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>
<%@ page import="javax.portlet.PortletSession, java.io.PrintWriter"%>

<portlet:defineObjects />
<b>1) Portlet Sessions IPC</b>
<br>
<%
	PortletSession ses = renderRequest.getPortletSession();
	PrintWriter pw = renderResponse.getWriter();
	pw.print(ses.getAttribute("LNAME", PortletSession.APPLICATION_SCOPE) + " "
			+ ses.getAttribute("FNAME", PortletSession.APPLICATION_SCOPE));
	pw.print("<br>");
%>
<b>2) Public Render Parameters IPC</b>
<br>
<%
	pw.print(renderRequest.getParameter("RP_LNAME") + " " + renderRequest.getParameter("RP_FNAME"));
	pw.print("<br>");
%>
<b>3) IPC Events</b>
<br>
<%
	pw.print(renderRequest.getParameter("PARAM_FROM_EVENT"));
	pw.print("<br>");
%>
<b>4) Client Side IPC with AJAX</b>
<br>
<%
	
%>
<b>5) Client Side IPC with Cookies</b>
<br>
<%
	
%>
