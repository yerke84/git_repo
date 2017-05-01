package kz.test.pack;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.json.JSONObject;

import com.google.gson.Gson;

import data.UserClass;
import data.UserListClass;

@Path("/testclass")

public class TestClass {

	@GET
	@Path("/get_message_no_type/{lastname}/{firstname}")
	// call like this:
	// http://localhost:8080/REST_JBOSS_DWP_MAVEN/rest/testclass/get_message_no_type/1/2
	public Response printMessage(@PathParam("lastname") String lname, @PathParam("firstname") String fname) {
		String ret = "Салем, " + lname + " " + fname + "!";
		return Response.status(200).entity(ret).build();
	}

	@GET
	@Path("/get_message_plain_txt")
	@Produces(MediaType.TEXT_PLAIN + ";charset=utf-8")
	// call like this:
	// http://localhost:8080/REST_JBOSS_DWP_MAVEN/rest/testclass/get_message_plain_txt?m=8&n=1
	public String getPlainText(@QueryParam("m") String mm, @QueryParam("n") String nn) {
		return "Хай, " + mm + " " + nn;
	}

	@GET
	@Path("/get_xml_from_class")
	@Produces(MediaType.APPLICATION_XML + ";charset=utf-8")
	public Response getUsers() {

		UserListClass ul = ULC();
		return Response.ok(ul).build();

	}

	@GET
	@Path("/get_json_from_class")
	@Produces(MediaType.APPLICATION_JSON + ";charset=utf-8")
	public Response getJSON() {

		UserListClass ul = ULC();
		Gson gson = new Gson();
		return Response.ok(gson.toJson(ul)).build();

	}

	@GET
	@Path("/verify")
	@Produces(MediaType.TEXT_PLAIN)
	public Response verifying(InputStream is) {
		String ret = "REST Service running..";
		return Response.status(200).entity(ret).build();
	}

	@POST
	@Path("/test_post_consume_json")
	@Consumes(MediaType.APPLICATION_JSON)

	public Response testPostConsumeJSON(InputStream is) {
		StringBuilder sb = new StringBuilder();
		InputStreamReader isr = new InputStreamReader(is);
		BufferedReader br = new BufferedReader(isr);
		String line = null;
		try {
			while ((line = br.readLine()) != null) {
				sb.append(line);
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return Response.status(200).entity(sb.toString()).build();
	}

	@GET
	@Path("/convert_C_to_F/{cel}")
	@Produces(MediaType.APPLICATION_XML)
	public String convert_C_to_F(@PathParam("cel") Double c) {
		Double f = ((c * 9) / 5) + 32;
		String ret = "<root><c>" + c + "</c><f>" + f + "</f></root>";
		return ret;
	}

	@GET
	@Path("/convert_F_to_C/{f}")
	@Produces(MediaType.APPLICATION_JSON)
	public Response convert_F_to_C(@PathParam("f") Double ff) {

		Double cc = (ff - 32) * 5 / 9;
		JSONObject json = new JSONObject();
		json.put("VALUE C", cc);
		json.put("VALUE F", ff);

		return Response.ok(json.toString()).build();
	}

	//
	private UserListClass ULC() {

		UserClass u1 = new UserClass();
		u1.firstName = "Еркебулан";
		u1.lastName = "Курышбаев";

		UserClass u2 = new UserClass();
		u2.firstName = "Джон";
		u2.lastName = "Смит";

		List<UserClass> list = new ArrayList<UserClass>();
		list.add(u1);
		list.add(u2);

		UserListClass ul = new UserListClass();
		ul.user = list;
		ul.ss = "ZZXX";
		return ul;
	}

}
