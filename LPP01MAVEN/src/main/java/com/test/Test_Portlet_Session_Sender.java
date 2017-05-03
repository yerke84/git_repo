package com.test;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.PortletSession;
import javax.servlet.http.HttpServletRequest;

import com.liferay.portal.util.PortalUtil;
import com.liferay.util.bridges.mvc.MVCPortlet;

/**
 * Portlet implementation class Test_Portlet_Session_Sender
 */
public class Test_Portlet_Session_Sender extends MVCPortlet {

	public void myAction(ActionRequest req, ActionResponse resp) {

		HttpServletRequest httpReq = PortalUtil.getOriginalServletRequest(PortalUtil.getHttpServletRequest(req));
		String lname = httpReq.getParameter("lname");
		String fname = httpReq.getParameter("fname");

		// System.out.println("SENDER = " + lname + " / " + fname);

		PortletSession ps = req.getPortletSession();
		ps.setAttribute("LNAME", lname, PortletSession.APPLICATION_SCOPE);
		ps.setAttribute("FNAME", fname, PortletSession.APPLICATION_SCOPE);
	}

}
