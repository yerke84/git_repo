package com.test;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.PortletMode;
import javax.portlet.PortletModeException;
import javax.servlet.http.HttpServletRequest;

import com.liferay.portal.util.PortalUtil;
import com.liferay.util.bridges.mvc.MVCPortlet;

/**
 * Portlet implementation class MVCPortlet01
 */
public class MVCPortlet01 extends MVCPortlet {

	public void switchMode(ActionRequest req, ActionResponse resp) throws PortletModeException {

		HttpServletRequest httpReq = PortalUtil.getOriginalServletRequest(PortalUtil.getHttpServletRequest(req));
		String modeType = httpReq.getParameter("modeType");
		modeType = modeType != null ? modeType : "VIEW";

		/*
		 * String ss = ParamUtil.getString(req, "modeType", "");
		 * System.out.println("modeType = " + ss);
		 */

		if (modeType.equalsIgnoreCase("EDIT"))
			resp.setPortletMode(PortletMode.EDIT);
		else if (modeType.equalsIgnoreCase("HELP"))
			resp.setPortletMode(PortletMode.HELP);
		else
			resp.setPortletMode(PortletMode.VIEW);
	}

}
