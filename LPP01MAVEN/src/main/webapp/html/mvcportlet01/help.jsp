<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>
<%@ page import="java.util.ResourceBundle"%>
<%
	ResourceBundle rb = ResourceBundle.getBundle("content.Language");
%>
<portlet:defineObjects />
<b><%=rb.getString("help_mode")%></b>
<br>
<portlet:actionURL name="switchMode" var="switchAction">
</portlet:actionURL>
<form action="<%=switchAction%>" method="POST">
	<input type="radio" name="modeType" value="VIEW"><%=rb.getString("to_view_mode")%><br>
	<input type="radio" name="modeType" value="EDIT"><%=rb.getString("to_edit_mode")%><br>
	<input type="submit" name="Submit" value="OK" />
</form>