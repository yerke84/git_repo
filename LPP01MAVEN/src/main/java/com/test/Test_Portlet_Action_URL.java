package com.test;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.PortletMode;
import javax.portlet.PortletModeException;

import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.util.bridges.mvc.MVCPortlet;

/**
 * Portlet implementation class Test_Portlet_Action_URL
 */
public class Test_Portlet_Action_URL extends MVCPortlet {

	public void swName(ActionRequest req, ActionResponse resp) throws PortletModeException {

		String param = ParamUtil.getString(req, "mode", "~");
		System.out.println(param);

		if (param.equalsIgnoreCase("edit"))
			resp.setPortletMode(PortletMode.EDIT);
		if (param.equalsIgnoreCase("view"))
			resp.setPortletMode(PortletMode.VIEW);

	}

}
