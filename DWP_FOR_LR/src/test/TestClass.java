package test;

import java.util.Random;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.core.Response;

@Path("/test_rest_class")
public class TestClass {

	@GET
	@Path("/get_random")
	public Response getRandom() {
		Random r = new Random();
		int i = r.nextInt(1000);
		return Response.ok(String.valueOf(i)).header("Access-Control-Allow-Origin", "*").build();
	}

}