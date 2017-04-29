package typik_bitik_project;

import java.io.*;
import javax.portlet.*;

public class TYPIK_BITIK_PROJECT_Kinds_MenuPortlet extends javax.portlet.GenericPortlet {
	//get kind like "Altai"
	public static final String ACTION_PARAMETER = "ACTION_NAME_PARAM";
	public static final String ACTION_VALUE = "TargetAction";
	public static final String PROPERTY_NAME = "inputProperty";
	//send monument OID like "Altai_45"
	public static final String OID_ACTION_PARAMETER = "ACTION_NAME_PARAM_OID";
	public static final String OID_ACTION_VALUE = "SourceAction_OID";
	public static final String OID_PROPERTY_NAME = "outputOID";	
	//doView	
	public void doView(RenderRequest request, RenderResponse response) throws PortletException, IOException {
		// Set the MIME type for the render response
		response.setContentType("text/html");
		// Invoke the JSP to render, replace with the actual jsp name
		PortletRequestDispatcher prd = getPortletContext().getRequestDispatcher(
		"/typik_bitik_project_folder/TYPIK_BITIK_PROJECT_Kinds_MenuPortletView.jsp");
		prd.include(request,response);		
	}
	//processAction
	public void processAction(ActionRequest request, ActionResponse response) throws PortletException, java.io.IOException {
		//get kind like "Altai"
		String action_name = request.getParameter(ACTION_PARAMETER);
		if(ACTION_VALUE.equals(action_name)){
			String value = request.getParameter(PROPERTY_NAME);
			//response.setRenderParameter(PROPERTY_NAME, value);
			request.getPortletSession().setAttribute(PROPERTY_NAME, value);
		}
		//send monument OID like "Altai_45"
		String an2 = request.getParameter(OID_ACTION_PARAMETER);
		if(OID_ACTION_VALUE.equals(an2)){
			String v2 = request.getParameter(OID_PROPERTY_NAME);
			request.setAttribute(OID_PROPERTY_NAME, v2);			
		}		
	}
}