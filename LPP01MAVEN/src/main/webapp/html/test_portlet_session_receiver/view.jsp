<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>
<%@ page
	import="javax.portlet.PortletSession, java.io.PrintWriter, javax.servlet.http.Cookie "%>
<script type="text/javascript">
	Liferay.on('MY_AJAX_EVENT', function(event) {
		if (event.userData.error == null) {
			//alert(event.userData.Text + "|" + event.userData.Time);
			document.getElementById('pid').innerHTML = event.userData.Time;
			document.getElementById('iid').value = event.userData.Text;
		}
	});
</script>

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
<p id="pid"></p>
<input type="text" id="iid" />
<br>
<b>5) Client Side IPC with Cookies</b>
<br>
<%
	Cookie[] cookies = renderRequest.getCookies();
	if (cookies != null) {
		for (int i = 0; i < cookies.length; i++) {
			String cn = cookies[i].getName();
			String cv = cookies[i].getValue();
			//pw.print(cn + "=" + cv + "<br>");
			/*
			if (cn.equalsIgnoreCase("myCookieName")) {
				pw.print(cv);
			}
			*/
		}
	}
%>
