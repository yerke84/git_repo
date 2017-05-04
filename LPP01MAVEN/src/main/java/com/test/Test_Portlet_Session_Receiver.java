package com.test;

import javax.portlet.Event;
import javax.portlet.EventRequest;
import javax.portlet.EventResponse;
//import javax.portlet.ProcessEvent;

import com.liferay.util.bridges.mvc.MVCPortlet;

/**
 * Portlet implementation class Test_Portlet_Session_Receiver
 */
public class Test_Portlet_Session_Receiver extends MVCPortlet {

	// @ProcessEvent(qname = "{http://liferay.com/yerke_events}data")
	// public void getEvent(EventRequest req, EventResponse resp) {
	public void processEvent(EventRequest req, EventResponse resp) {
		Event ev = req.getEvent();
		String ss = (String) ev.getValue();
		System.out.println("{Event_Value} = " + ss);
		resp.setRenderParameter("PARAM_FROM_EVENT", ss);
	}

}