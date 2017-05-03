<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>
<%@ page import="javax.portlet.PortletSession, java.io.PrintWriter"%>

<portlet:defineObjects />
<b>Session (between portlets in one WAR):</b><br>
<%
	PortletSession ses = renderRequest.getPortletSession();
	PrintWriter pw = renderResponse.getWriter();
	pw.println(ses.getAttribute("LNAME", PortletSession.APPLICATION_SCOPE));
	pw.println(ses.getAttribute("FNAME", PortletSession.APPLICATION_SCOPE));
%>