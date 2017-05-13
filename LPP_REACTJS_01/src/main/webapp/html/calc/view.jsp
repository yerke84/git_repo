<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>
<%@ page import="java.util.Random"%>
<%
	Random rand = new Random();
	int vrsn = rand.nextInt(1000) + 1;
%>
<portlet:defineObjects />
<div id="main_div"></div>
<script
	src="<%=request.getContextPath()%>/js/main_by_babel.js?v=<%=vrsn%>"
	type="text/babel"></script>