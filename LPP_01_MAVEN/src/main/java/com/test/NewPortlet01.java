package com.test;

import java.io.IOException;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.GenericPortlet;
import javax.portlet.PortletException;
import javax.portlet.PortletRequestDispatcher;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;

/**
 * Portlet implementation class NewPortlet01
 */
public class NewPortlet01 extends GenericPortlet {

	protected String view;

	private static Log _log = LogFactoryUtil.getLog(NewPortlet01.class);

	public void init() {
		// view = getInitParameter("view-jsp");
		view = "/src/main/webapp/view.jsp";
	}

	public void processAction(ActionRequest actionRequest, ActionResponse actionResponse)
			throws IOException, PortletException {

		super.processAction(actionRequest, actionResponse);
	}

	public void doView(RenderRequest renderRequest, RenderResponse renderResponse)
			throws IOException, PortletException {

		include(view, renderRequest, renderResponse);
	}

	protected void include(String path, RenderRequest renderRequest, RenderResponse renderResponse)
			throws IOException, PortletException {

		PortletRequestDispatcher portletRequestDispatcher = getPortletContext().getRequestDispatcher(path);

		if (portletRequestDispatcher == null) {
			_log.error(path + " is not a valid include");
		} else {
			portletRequestDispatcher.include(renderRequest, renderResponse);
		}
	}

}
