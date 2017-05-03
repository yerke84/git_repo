<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>

<portlet:defineObjects />

<b>Page One</b>
<br>
<portlet:renderURL var="varName1">
	<portlet:param name="mvcPath"
		value="/html/test_portlet_renderurl/view2.jsp" />
		<!-- mvcPath константа -->
</portlet:renderURL>
<a href="<%=varName1%>">To page 2</a>