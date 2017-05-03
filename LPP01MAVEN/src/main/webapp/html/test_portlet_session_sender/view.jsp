<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>

<portlet:defineObjects />

<portlet:actionURL name="myAction" var="myVar">
</portlet:actionURL>

<b>Session:</b>
<form action="<%=myVar%>" method="POST">
	Last Name: <input type="text" name="lname" /><br>
	First Name: <input type="text" name="fname" /><br>
	<input type="submit" name="sb" value="Send" />
</form>