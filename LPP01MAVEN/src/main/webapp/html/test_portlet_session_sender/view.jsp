<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>
<script src="http://code.jquery.com/jquery-latest.min.js"
	type="text/javascript"></script>
<portlet:defineObjects />

<portlet:actionURL name="myAction" var="myVar">
</portlet:actionURL>

<form action="<%=myVar%>" method="POST">
	Last Name: <input type="text" name="lname" /><br> First Name: <input
		type="text" name="fname" /><br> <input type="submit" name="sb"
		value="Send" />
</form>
<p>
	<b>For Client Side IPC with AJAX</b>
</p>
<form>
	Some text: <input type="text" id="mytext" /><br> <input
		type="button" id="my_AJAX_btn" value="OK" />
</form>