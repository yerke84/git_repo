<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>
<%@ page import="javax.portlet.PortletSession, java.io.PrintWriter"%>

<portlet:defineObjects />
<b>Application Scope Session:</b>
<br>
<%
	PortletSession ses = renderRequest.getPortletSession();
	PrintWriter pw = renderResponse.getWriter();
	pw.print(ses.getAttribute("LNAME", PortletSession.APPLICATION_SCOPE) + " "
			+ ses.getAttribute("FNAME", PortletSession.APPLICATION_SCOPE));
	pw.print("<br>");
%>
<b>Public Render Parameter:</b>
<br>
<%
	pw.print(renderRequest.getParameter("RP_LNAME") + " " + renderRequest.getParameter("RP_FNAME"));
	pw.print("<br>");
%>