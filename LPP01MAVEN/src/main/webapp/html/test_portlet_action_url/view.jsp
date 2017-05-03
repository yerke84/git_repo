<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>

<portlet:defineObjects />

This is the
<b>Test Portlet Action Url</b>
portlet in
<b>View mode</b>
.
<br>
<portlet:actionURL name="swName" var="swAct">
	<portlet:param name="mode" value="edit" />
</portlet:actionURL>
<a href="<%=swAct%>">To Edit Mode</a>
