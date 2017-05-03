<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>
<%@ page import="java.util.ResourceBundle"%>
<%
	ResourceBundle rb = ResourceBundle.getBundle("content.Language");
%>
<portlet:defineObjects />
<b><%=rb.getString("edit_mode")%></b>