<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" 
import="java.util.ResourceBundle, java.io.*, javax.xml.parsers.*, org.w3c.dom.*, javax.portlet.*, typik_bitik_project.*" session="true" %>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>
<portlet:defineObjects/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Ескерткіш</title>
<style type="text/css">
<!--
	.mylink:link{font-family:Arial; font-size:12px; color:#055E32; font-weight:normal; text-decoration:underline;}
	.mylink:hover{font-family:Arial; font-size:14px; color:#990000; font-weight:normal; text-decoration:none;}	
	.mylink:active{font-family:Arial; font-size:12px; color:#055E32; font-weight:bold; text-decoration:underline;}	
-->
</style>
</head>
<body>
<%
try{
	//get language
	ResourceBundle rb = ResourceBundle.getBundle(
	"typik_bitik_project.nl.TYPIK_BITIK_PROJECT_Types_MenuPortletResource", request.getLocale());
	String lang_value = rb.getString("LANG") ;
	if(lang_value == null || lang_value.length() == 0){lang_value = "kz";}
	//get writer
	PrintWriter pw = renderResponse.getWriter();
	//get path and file	
	String content_folder = renderRequest.getPortletSession().getPortletContext().getRealPath(
	"/typik_bitik_project_folder/");
	File xml_file = new File(content_folder + "/xmls/types.xml");
	//pw.print("<br>"+xml_file.getAbsolutePath()+"<br>");
	if(xml_file.exists()){
		//
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		factory.setIgnoringElementContentWhitespace(true);
		DocumentBuilder builder = factory.newDocumentBuilder();
		Document xml_doc = builder.parse(xml_file);
		xml_doc.normalize();
		//
		NodeList list = xml_doc.getElementsByTagName("type");
		for(int k = 0; k < list.getLength(); k++){
			//
			Node type = list.item(k);
			//
			String fn = type.getAttributes().getNamedItem("en").getNodeValue().toString();//file name
			String tx = type.getAttributes().getNamedItem(lang_value).getNodeValue().toString();//text
			//
			PortletURL this_portlet_action_url = renderResponse.createActionURL();			
			this_portlet_action_url.setParameter(TYPIK_BITIK_PROJECT_Types_MenuPortlet.ACTION_PARAMETER, TYPIK_BITIK_PROJECT_Types_MenuPortlet.ACTION_VALUE);
			this_portlet_action_url.setParameter(TYPIK_BITIK_PROJECT_Types_MenuPortlet.PROPERTY_NAME, fn);
			//
			String ss = "<a href='" + this_portlet_action_url.toString() + "' class='mylink'>" + tx + "</a><br/>";
			pw.print(ss);
		}		
	}
}catch(Exception E){}
%>
</body>
</html>