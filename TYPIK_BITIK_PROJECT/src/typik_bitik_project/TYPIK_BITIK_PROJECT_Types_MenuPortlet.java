package typik_bitik_project;

import java.io.*;
import javax.portlet.*;

public class TYPIK_BITIK_PROJECT_Types_MenuPortlet extends javax.portlet.GenericPortlet {
	//
	public static final String ACTION_PARAMETER = "ACTION_NAME_PARAM";
	public static final String ACTION_VALUE = "SourceAction";
	public static final String PROPERTY_NAME = "outputProperty";
	//doView	
	public void doView(RenderRequest request, RenderResponse response) throws PortletException, IOException {
		// Set the MIME type for the render response
		response.setContentType("text/html");
		// Invoke the JSP to render, replace with the actual jsp name
		PortletRequestDispatcher prd = getPortletContext().getRequestDispatcher(
		"/typik_bitik_project_folder/TYPIK_BITIK_PROJECT_Types_MenuPortletView.jsp");
		prd.include(request,response);		
	}
	//processAction
	public void processAction(ActionRequest request, ActionResponse response) throws PortletException, java.io.IOException {
		//
		String action_name = request.getParameter(ACTION_PARAMETER);
		if(ACTION_VALUE.equals(action_name)){
			String value = request.getParameter(PROPERTY_NAME);			
			request.setAttribute(PROPERTY_NAME, value);
		}
	}
}