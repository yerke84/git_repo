<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" 
import="java.util.ResourceBundle, java.io.*, typik_bitik_project.*, javax.xml.parsers.*, org.w3c.dom.*" session="true" %>
<%@ taglib uri="http://java.sun.com/portlet" prefix="portlet" %>
<portlet:defineObjects/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Ескерткіш</title>
<style type="text/css">
<!--
	.allbody{font-family:Arial; font-size:12px; color:#000000; font-weight:normal; font-style:normal; text-decoration:none;}
	.pdf_count{font-family:Arial; font-size:12px; color:#000000; font-weight:normal; font-style:normal; text-decoration:none; text-align:right;}
	.bigtitle{font-size:14px; font-weight:bold;}
	.caption{font-size:12px; font-weight:bold;}
	.pdf:link{font-family:Arial; font-size:12px; color:#0099CC; font-weight:normal; font-style:normal; text-decoration:underline;}
	.pdf:hover{font-family:Arial; font-size:12px; color:#990000; font-weight:normal; font-style:normal; text-decoration:none;}		
	.pdf:visited{font-family:Arial; font-size:12px; color:#0099CC; font-weight:normal; font-style:normal; text-decoration:underline;}
	.myref:link{font-family:Arial; font-size:11px; color:#0099cc; font-weight:normal; font-style:normal; text-decoration:none;}
	.myref:hover{font-family:Arial; font-size:11px; color:#990000; font-weight:normal; font-style:normal; text-decoration:none;}
	.myref:visited{font-family:Arial; font-size:11px; color:#0099cc; font-weight:normal; font-style:normal; text-decoration:none;}
	.refbody{font-family:Arial; font-size:11px; color:#000000; font-weight:normal; font-style:normal; text-decoration:none;}
	.tothetoplink:link{font-family:Arial; font-size:11px; color:#7F007F; font-weight:normal; font-style:normal; text-decoration:none;}
	.tothetoplink:hover{font-family:Arial; font-size:11px; color:#990000; font-weight:normal; font-style:normal; text-decoration:none;}
	.tothetoplink:visited{font-family:Arial; font-size:11px; color:#7F007F; font-weight:normal; font-style:normal; text-decoration:none;}
	.labelanchor{font-family:Arial; font-size:11px; color:#0099cc; font-weight:normal; font-style:normal; text-decoration:none; text-align:right;}
-->
</style>
</head>
<body>
<%
//.pdf:active{color:#0099CC; text-decoration:underline; font-weight:bold;}
//.pdf:visited{font-family:Arial; font-size:12px; color:#0099CC; font-weight:normal; font-style:normal; text-decoration:underline;}

try{
	//dims
	String ss; String ss2; String ss3; String ss4; String big_str;		
	//get language
	ResourceBundle rb = ResourceBundle.getBundle(
	"typik_bitik_project.nl.TYPIK_BITIK_PROJECT_MonumentPortletResource", request.getLocale());
	String lang_value = rb.getString("LANG") ;
	if(lang_value == null || lang_value.length() == 0){lang_value = "kz";}
	//
	String tops = "жоғарыға оралу";
	if(lang_value.equals("ru")){tops = "вверх";}
	if(lang_value.equals("en")){tops = "upwards";}
	//get writer
	PrintWriter pw = renderResponse.getWriter();	
	//get parameter
	Object oid = renderRequest.getPortletSession().getAttribute(TYPIK_BITIK_PROJECT_MonumentPortlet.PROPERTY_NAME);
	//
	if(oid != null){
		String content_folder = renderRequest.getPortletSession().getPortletContext().getRealPath(
		"/typik_bitik_project_folder/");
		File xml_file = new File(content_folder + "/xmls/Monument/Definition/" + lang_value + "/" + oid.toString() + ".xml");
		if(xml_file.exists()){
			//
			DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
			factory.setIgnoringElementContentWhitespace(true);
			DocumentBuilder builder = factory.newDocumentBuilder();
			Document xml_doc = builder.parse(xml_file);
			xml_doc.normalize();
			//
			pw.print("<font class='allbody'>");
			//
			String node_name = "title";
			ss = xml_doc.getElementsByTagName(node_name).item(0).getFirstChild().getNodeValue().toString();
			pw.print("<p class='bigtitle'>"+ss+"</p>");
			//
			node_name = "time";
			ss = xml_doc.getElementsByTagName(node_name).item(0).getFirstChild().getNodeValue().toString();
			pw.print("<p>"+ss+"</p>");
			//
			node_name = "hronology";
			Node node = xml_doc.getElementsByTagName(node_name).item(0);
			ss = node.getFirstChild().getNodeValue().toString();
			ss2 = node.getAttributes().getNamedItem("caption").getNodeValue().toString();
			pw.print("<p class='caption'>"+ss2+"</p><p>"+ss+"</p>");
			//
			node_name = "history"; node = xml_doc.getElementsByTagName(node_name).item(0);
			ss = node.getFirstChild().getNodeValue().toString();			
			pw.print("<p>"+ss+"</p>");
			//
			node_name = "names";
			node = xml_doc.getElementsByTagName(node_name).item(0);
			ss = node.getFirstChild().getNodeValue().toString();
			ss2 = node.getAttributes().getNamedItem("caption").getNodeValue().toString();
			pw.print("<p class='caption'>"+ss2+"</p><p>"+ss+"</p>");
			//
			node_name = "place";
			node = xml_doc.getElementsByTagName(node_name).item(0);
			ss = node.getFirstChild().getNodeValue().toString();
			ss2 = node.getAttributes().getNamedItem("caption").getNodeValue().toString();
			ss3 = xml_doc.getElementsByTagName("store").item(0).getFirstChild().getNodeValue().toString();
			pw.print("<p class='caption'>"+ss2+"</p><p>"+ss+"<br/>"+ss3+"</p>");
			//
			node_name = "general";
			node = xml_doc.getElementsByTagName(node_name).item(0);
			ss = node.getFirstChild().getNodeValue().toString();
			ss2 = node.getAttributes().getNamedItem("caption").getNodeValue().toString();
			ss3 = xml_doc.getElementsByTagName("description").item(0).getFirstChild().getNodeValue().toString();
			pw.print("<p class='caption'>"+ss2+"</p><p>"+ss+"<br/>"+ss3+"</p>");
			//
			node_name = "size";
			node = xml_doc.getElementsByTagName(node_name).item(0);
			ss = node.getFirstChild().getNodeValue().toString();
			ss2 = node.getAttributes().getNamedItem("caption").getNodeValue().toString();
			pw.print("<p class='caption'>"+ss2+"</p><p>"+ss+"</p>");
			//
			node_name = "investigation";
			node = xml_doc.getElementsByTagName(node_name).item(0);
			ss = node.getFirstChild().getNodeValue().toString();
			ss2 = node.getAttributes().getNamedItem("caption").getNodeValue().toString();
			pw.print("<p class='caption'>"+ss2+"</p><p>"+ss+"</p>");
			//
			node_name = "details";
			node = xml_doc.getElementsByTagName(node_name).item(0);
			ss = node.getFirstChild().getNodeValue().toString();
			ss2 = node.getAttributes().getNamedItem("caption").getNodeValue().toString();
			pw.print("<p class='caption'>"+ss2+"</p><p>"+ss+"</p>");
			//pdfs
			NodeList list = xml_doc.getElementsByTagName("pdf");
			if(!(list.getLength() == 0 || list == null)){
				//caption
				node_name = "pdfs";
				node = xml_doc.getElementsByTagName(node_name).item(0);
				ss2 = node.getAttributes().getNamedItem("caption").getNodeValue().toString();
				pw.print("<p class='caption'>"+ss2+"</p>");
				//
				pw.print("<table align='center' border='0'>");
				for(int k = 0; k < list.getLength(); k++){
					//
					node = list.item(k);
					ss = node.getAttributes().getNamedItem("f_author").getNodeValue().toString();
					ss2 = node.getAttributes().getNamedItem("f_title").getNodeValue().toString();
					ss3 = node.getAttributes().getNamedItem("f_in").getNodeValue().toString();
					ss4 = node.getAttributes().getNamedItem("f_name").getNodeValue().toString();					
					//					
					if(ss.length() > 0){ss = ss + ". ";}
					big_str = ss;
					//
					big_str = big_str + ss2;
					//
					if(ss3.length() > 0 && big_str.length() > 0){ss3 = " // " + ss3;}
					big_str = big_str + ss3;
					//					
					big_str = "<a href='"+renderResponse.encodeURL(
					renderRequest.getContextPath()+"/typik_bitik_project_folder/pdf/"+ss4)+"' class='pdf' target='_blank'>"+
					big_str+"</a><br/>";					
					pw.print("<tr><td align='right'><font class='pdf_count'>"+(k+1)+".</font></td><td width='10'>&nbsp;</td><td>"+big_str+"</td></tr>");
				}			
				pw.print("</table>");				
			}			
			//refs			
			list = xml_doc.getElementsByTagName("ref");
			if(!(list.getLength() == 0 || list == null)){				
				//				
				pw.print("<br/><br/>______________________________<br/>");
				pw.print("<table border='0'>");
				for(int k = 0; k < list.getLength(); k++){
					node = list.item(k);
					//
					ss = node.getFirstChild().getNodeValue().toString();
					ss2 = node.getAttributes().getNamedItem("nm").getNodeValue().toString();
					//
					big_str = "<tr><td align='right' valign='top'><sup><a name='label_"+ss2+"'><font class='labelanchor'>"+ss2+"</font></a></sup></td>"+
					"<td width='10'>&nbsp;</td><td><font class='refbody'>"+ss+
					"</font> <a class='tothetoplink' href='#source_"+ss2+"'>"+tops+"</a></td></tr>";
					//
					pw.print(big_str);
					//
				}
				pw.print("</table>");
			}			
			pw.print("</font>");			
		}//if(xml_file.exists())
	}else{
		pw.print("Жоғарыдағы мәзірден түрлердің бірін таңдаңыз.");//LTL	
	}
}catch(Exception E){}
%>
</body>
</html>