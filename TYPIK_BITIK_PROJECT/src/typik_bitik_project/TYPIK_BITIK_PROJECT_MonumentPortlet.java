package typik_bitik_project;

import java.io.*;
import javax.portlet.*;

public class TYPIK_BITIK_PROJECT_MonumentPortlet extends javax.portlet.GenericPortlet {
	//get oid
	public static final String ACTION_PARAMETER = "OID_ACTION_NAME_PARAM";
	public static final String ACTION_VALUE = "OID_TargetAction";
	public static final String PROPERTY_NAME = "inputOID";
	//doView	
	public void doView(RenderRequest request, RenderResponse response) throws PortletException, IOException {
		// Set the MIME type for the render response
		response.setContentType("text/html");
		// Invoke the JSP to render, replace with the actual jsp name
		PortletRequestDispatcher prd = getPortletContext().getRequestDispatcher(
		"/typik_bitik_project_folder/TYPIK_BITIK_PROJECT_MonumentPortletView.jsp");
		prd.include(request,response);		
	}
	//processAction
	public void processAction(ActionRequest request, ActionResponse response) throws PortletException, java.io.IOException {
		//get oid
		String action_name = request.getParameter(ACTION_PARAMETER);
		if(ACTION_VALUE.equals(action_name)){
			String value = request.getParameter(PROPERTY_NAME);
			//response.setRenderParameter(PROPERTY_NAME, value);
			request.getPortletSession().setAttribute(PROPERTY_NAME, value);
		}
	}
}