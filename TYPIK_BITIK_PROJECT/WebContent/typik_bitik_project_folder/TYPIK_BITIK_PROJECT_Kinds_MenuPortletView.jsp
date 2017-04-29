<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" 
import="java.util.ResourceBundle, typik_bitik_project.*, java.io.*, javax.xml.parsers.*, org.w3c.dom.*, javax.portlet.*" session="true" %>
<%@ taglib uri="http://java.sun.com/portlet" prefix="portlet" %>
<portlet:defineObjects/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Ескерткіш</title>
<style type="text/css">
<!--
	.mylink:link{font-family:Arial; font-size:12px; color:#055E32; font-weight:normal; text-decoration:underline;}
	.mylink:hover{font-family:Arial; font-size:12px; color:#990000; font-weight:normal; text-decoration:none;}	
	.mylink:active{font-family:Arial; font-size:12px; color:#055E32; font-weight:bold; text-decoration:underline;}	
-->
</style>
</head>
<body>
<%
try{
	//get language
	ResourceBundle rb = ResourceBundle.getBundle(
	"typik_bitik_project.nl.TYPIK_BITIK_PROJECT_Kinds_MenuPortletResource", request.getLocale());
	String lang_value = rb.getString("LANG") ;
	if(lang_value == null || lang_value.length() == 0){lang_value = "kz";}
	//get writer
	PrintWriter pw = renderResponse.getWriter();	
	//get parameter
	Object kind = renderRequest.getPortletSession().getAttribute(TYPIK_BITIK_PROJECT_Kinds_MenuPortlet.PROPERTY_NAME);	
	//
	if(kind != null){
		String content_folder = renderRequest.getPortletSession().getPortletContext().getRealPath(
		"/typik_bitik_project_folder/");
		File xml_file = new File(content_folder + "/xmls/kinds_"+kind+".xml");
		if(xml_file.exists()){
			//
			DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
			factory.setIgnoringElementContentWhitespace(true);
			DocumentBuilder builder = factory.newDocumentBuilder();
			Document xml_doc = builder.parse(xml_file);
			xml_doc.normalize();
			//
			NodeList list = xml_doc.getElementsByTagName("kind");
			for(int k = 0; k < list.getLength(); k++){
				Node node = list.item(k);
				//
				String tx = node.getAttributes().getNamedItem(lang_value).getNodeValue().toString();//text
				String oid = node.getAttributes().getNamedItem("oid").getNodeValue().toString();//o ID
				oid = kind + "_" + oid;				
				//
				PortletURL this_portlet_action_url = renderResponse.createActionURL();
				this_portlet_action_url.setParameter(TYPIK_BITIK_PROJECT_Kinds_MenuPortlet.OID_ACTION_PARAMETER, TYPIK_BITIK_PROJECT_Kinds_MenuPortlet.OID_ACTION_VALUE);
				this_portlet_action_url.setParameter(TYPIK_BITIK_PROJECT_Kinds_MenuPortlet.OID_PROPERTY_NAME, oid);
				//
				String ss = "<a href='" + this_portlet_action_url.toString() + "' class='mylink'>" + tx + "</a><br/>";
				pw.print(ss);
			}		
		}
	}else{
		pw.print("Жоғарыдағы мәзірден түрлердің бірін таңдаңыз.");//LTL
	}
}catch(Exception E){}
%>
</body>
</html>