package test;

import java.math.BigDecimal;
import java.sql.ResultSet;
import java.util.Random;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import setting.MySqlClass;

@Path("/ws_test_class")
public class WS_REST_JERSEY_SERVICE_CLASS {

	@GET
	@Path("/get_random")
	public Response getRandom() {
		Random r = new Random();
		int i = r.nextInt(1000);
		return Response.ok(String.valueOf(i)).header("Access-Control-Allow-Origin", "*").build();
	}

	@GET
	@Produces(MediaType.APPLICATION_XML)
	@Path("/delete_dep/{id}")
	public Response deleteDep(@PathParam("id") BigDecimal ID) {

		MySqlClass mysql = null;
		String err = "";
		try {
			mysql = new MySqlClass();
			mysql.executeUpdate("delete from DEPARTMENTS where ID = " + String.valueOf(ID));
		} catch (Exception e) {
			e.printStackTrace();
			err = e.getMessage();
		} finally {
			try {
				mysql.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		if (err.equalsIgnoreCase(""))
			return getDepList();
		else
			return Response.ok("<root><error>" + err + "</error></root>").build();
	}

	@GET
	@Produces(MediaType.APPLICATION_XML)
	@Path("/update_dep/{id}/{name}")
	public Response updateDep(@PathParam("id") BigDecimal ID, @PathParam("name") String Name) {

		MySqlClass mysql = null;
		String err = "";
		try {
			mysql = new MySqlClass();
			mysql.executeUpdate("update DEPARTMENTS set DEP_NAME = '" + Name + "' where ID = " + String.valueOf(ID));
		} catch (Exception e) {
			e.printStackTrace();
			err = e.getMessage();
		} finally {
			try {
				mysql.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		if (err.equalsIgnoreCase(""))
			return getDepList();
		else
			return Response.ok("<root><error>" + err + "</error></root>").build();
	}

	@GET
	@Produces(MediaType.APPLICATION_XML)
	@Path("/create_dep/{id}/{name}")
	public Response createDep(@PathParam("id") BigDecimal ID, @PathParam("name") String Name) {

		MySqlClass mysql = null;
		String err = "";
		try {
			mysql = new MySqlClass();
			mysql.executeUpdate(
					"insert into DEPARTMENTS(ID, DEP_NAME) values (" + String.valueOf(ID) + ", '" + Name + "')");
		} catch (Exception e) {
			e.printStackTrace();
			err = e.getMessage();
		} finally {
			try {
				mysql.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		if (err.equalsIgnoreCase(""))
			return getDepList();
		else
			return Response.ok("<root><error>" + err + "</error></root>").build();
	}

	@GET
	@Produces(MediaType.APPLICATION_XML)
	@Path("/get_dep_list")
	public Response getDepList() {
		StringBuilder sb = new StringBuilder();
		MySqlClass mysql = null;
		try {
			mysql = new MySqlClass();
			ResultSet rs = mysql.executeQuery("SELECT * from DEPARTMENTS");
			sb.append("<root>");
			while (rs.next()) {
				sb.append("<dep>").append("<id>").append(String.valueOf(rs.getBigDecimal("ID"))).append("</id>")
						.append("<name>").append(rs.getString("DEP_NAME")).append("</name>").append("</dep>");
			}
			sb.append("</root>");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				mysql.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return Response.status(200).entity(sb.toString()).build();
	}

}
