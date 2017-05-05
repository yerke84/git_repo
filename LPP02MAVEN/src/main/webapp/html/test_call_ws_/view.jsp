<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>
<script src="http://code.jquery.com/jquery-latest.min.js"
	type="text/javascript"></script>
<portlet:defineObjects />
IIN:
<input type="text" id="iin" value="840315301560" />
<br>
<input type="button" id="soap_sync_btn" value="CALL SOAP WS (POST)" />
<br />
<p id="pid"></p><br>
Country:
<input type="text" id="cntry" value="Russia" />
<br>
<input type="button" id="rest_sync_btn" value="CALL REST WS (GET)" />
<br />
<p id="pid2"></p>