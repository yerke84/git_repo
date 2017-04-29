package typik_bitik_project;

import java.io.*;
import javax.portlet.*;

public class TYPIK_BITIK_PROJECT_Language_DealerPortlet extends javax.portlet.GenericPortlet {
	//doView	
	public void doView(RenderRequest request, RenderResponse response) throws PortletException, IOException {
		// Set the MIME type for the render response
		response.setContentType("text/html");
		// Invoke the JSP to render, replace with the actual jsp name
		PortletRequestDispatcher prd = getPortletContext().getRequestDispatcher("/configuration_folder/TYPIK_BITIK_PROJECT_Language_DealerPortletView.jsp");
		prd.include(request,response);		
	}
	//processAction
	public void processAction(ActionRequest request, ActionResponse response) throws PortletException, java.io.IOException {
		String str = request.getParameter("sometext");
		response.setRenderParameter("param", str);
	}
}