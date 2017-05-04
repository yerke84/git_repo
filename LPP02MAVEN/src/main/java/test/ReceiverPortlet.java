package test;

import javax.portlet.Event;
import javax.portlet.EventRequest;
import javax.portlet.EventResponse;

import com.liferay.util.bridges.mvc.MVCPortlet;

public class ReceiverPortlet extends MVCPortlet {

	public void processEvent(EventRequest req, EventResponse resp) {
		Event ev = req.getEvent();
		String ss = (String) ev.getValue();
		// System.out.println("{Event_Value} = " + ss);
		resp.setRenderParameter("PARAM_FROM_EVENT", ss);
	}

}