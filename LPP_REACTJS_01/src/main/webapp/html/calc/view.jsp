<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>

<%@ page import="java.util.Random"%>

<%
	/* для предотвращения кэширования подключенного js файла, актуально при разработке, на проде можно убрать */
	Random rand = new Random();
	int vrsn = rand.nextInt(1000) + 1;
%>

<portlet:defineObjects />

<!-- основной див, куда выводится результат реакт скрипта -->
<div id="main_div"></div>

<!-- сам реакт скрипт в виде "text/babel".
	 можно было бы подключить данный скрипт в файле liferay-portlet.xml
	 с помощью тега <footer-portlet-javascript>, но данный тег не позволяет
	 указать тип скрипта - "text/babel"
 -->
<script
	src="<%=request.getContextPath()%>/js/calc.js?v=<%=vrsn%>"
	type="text/babel"></script>