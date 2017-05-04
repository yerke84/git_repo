<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>
<%@ page
	import="javax.portlet.PortletSession, java.io.PrintWriter, javax.servlet.http.Cookie, java.net.URLDecoder "%>
<script type="text/javascript">
	Liferay.on('MY_AJAX_EVENT', function(event) {
		if (event.userData.error == null) {
			//--alert(event.userData.Text + "|" + event.userData.Time);
			document.getElementById('pid2').innerHTML = event.userData.Time;
			document.getElementById('iid2').value = event.userData.Text;
		}
	});
</script>

<portlet:defineObjects />
<b>1) Portlet Sessions IPC</b>
<br>
<%
	PortletSession ses = renderRequest.getPortletSession();
	PrintWriter pw = renderResponse.getWriter();
	pw.print("!!! Each WAR has own session, this is WAR # 2 !!!");
	pw.print("<br>");
%>
<b>2) Public Render Parameters IPC</b>
<br>
<%
	pw.print("!!! Each WAR has own render parameters, this is WAR # 2 !!!");
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
<p id="pid2"></p>
<input type="text" id="iid2" />
<br>
<b>5) Client Side IPC with Cookies</b>
<br>
<%
	Cookie[] cookies = renderRequest.getCookies();
	if (cookies != null) {
		for (int i = 0; i < cookies.length; i++) {
			String cn = cookies[i].getName();
			String cv = cookies[i].getValue();
			if (cn.equalsIgnoreCase("myCookieName")) {
				pw.print(URLDecoder.decode(cv, "UTF-8"));
			}

		}
	}
%>
