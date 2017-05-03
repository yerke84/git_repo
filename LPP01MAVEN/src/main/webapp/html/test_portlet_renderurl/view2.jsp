<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>

<portlet:defineObjects />

<b>Page Two</b>
<br>
<portlet:renderURL var="varName2">
	<portlet:param name="jspPage"
		value="/html/test_portlet_renderurl/view.jsp" />
	<!-- jspPage константа -->
</portlet:renderURL>
<a href="${varName2}">To page 1</a>