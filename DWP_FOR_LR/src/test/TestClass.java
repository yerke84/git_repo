package test;

import java.util.Random;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

@Path("/test_rest_class")
public class TestClass {

	@GET
	@Path("/get_random")
	@Produces(MediaType.APPLICATION_XML)
	// @Produces(MediaType.TEXT_PLAIN + ";charset=utf-8")
	public String getRandom() {
		Random r = new Random();
		int i = r.nextInt(1000000);
		return "<root><v>" + String.valueOf(i) + "</v></root>";
	}

}