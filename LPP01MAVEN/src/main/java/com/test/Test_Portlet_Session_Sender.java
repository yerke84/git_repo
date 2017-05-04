package com.test;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.PortletSession;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.xml.namespace.QName;

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

		// see param settings in portlet xml
		/*
		 * 1) in sender and receiver portlet tag must be this setting: <portlet>
		 ****
		 * <supported-public-render-parameter>RP_LNAME</supported-public-render-
		 * parameter>
		 ****
		 * </portlet>
		 * 
		 * 2) in sender and receiver portlet app tag must be this setting:
		 * <portlet-app>
		 ****
		 * <public-render-parameter> <identifier>RP_LNAME</identifier> <qname
		 * xmlns:x="http://www.liferay.com/public-render-parameters">x:RP_LNAME<
		 * /qname> </public-render-parameter>
		 ****
		 * </portlet-app>
		 * 
		 * 
		 */
		resp.setRenderParameter("RP_LNAME", lname);
		resp.setRenderParameter("RP_FNAME", fname);

		// send event <qname
		// xmlns:e="http://liferay.com/yerke_events">e:data</qname>
		QName qName = new QName("http://liferay.com/yerke_events", "data", "e");
		resp.setEvent(qName, "Hi, " + lname + " " + fname + "!");

		// set cookie
		Cookie cookie = new Cookie("myCookieName", "mycookie");// " + lname + " " + fname + ".");
		cookie.setPath(req.getContextPath());
		cookie.setVersion(0);
		resp.addProperty(cookie);
	}

}
