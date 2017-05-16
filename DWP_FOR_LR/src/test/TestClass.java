package test;

import java.util.Random;

import javax.ws.rs.GET;
import javax.ws.rs.Path;

@Path("/test_rest_class")
public class TestClass {

	@GET
	@Path("/get_random")
	public String getRandom() {
		Random r = new Random();
		int i = r.nextInt(1000);
		return String.valueOf(i);
	}

}