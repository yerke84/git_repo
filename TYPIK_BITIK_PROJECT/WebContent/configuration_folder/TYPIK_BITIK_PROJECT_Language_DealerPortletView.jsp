<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="java.io.*, javax.portlet.*"%>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>

<portlet:defineObjects />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Ескерткіш</title>
</head>
<body>
	<%
		PrintWriter pw = renderResponse.getWriter();
		String language = renderRequest.getLocale().toString();
		//
		pw.print("<p>Бұл порталдың тілі: " + language + "</p>");
		//
		String param = request.getParameter("param");
		String swf_file_path = renderResponse.encodeURL(
				renderRequest.getContextPath() + "/typik_bitik_project_folder/swfs/typik.swf?sometext=" + param);
		PortletURL actionURL = renderResponse.createActionURL();
	%>
	<form method="POST" action="<%=actionURL.toString()%>">
		<input type="text" name="sometext"><br /> <input
			type="submit">
	</form>

	<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000"
		codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0"
		width="600" height="130" id="typik" align="middle">
		<param name="allowScriptAccess" value="sameDomain" />
		<param name="movie" value="<%=swf_file_path%>" />
		<param name="menu" value="false" />
		<param name="quality" value="best" />
		<param name="bgcolor" value="#ffffff" />

		<embed src="<%=swf_file_path%>" menu="false" quality="best"
			bgcolor="#ffffff" width="600" height="130" name="typik"
			align="middle" allowScriptAccess="sameDomain"
			type="application/x-shockwave-flash"
			pluginspage="http://www.macromedia.com/go/getflashplayer" />
	</object>
</body>
</html>