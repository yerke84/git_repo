package test;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import data.DepartmentClass;
import data.PersonClass;
import setting.MySqlClass;

public class TestClass {

	public DepartmentClass getDepartment(String dName, int dId) {

		// department
		DepartmentClass dc = new DepartmentClass();
		dc.depName = dName;
		dc.depId = dId;

		// manager
		dc.manager = createPerson("Yerke", "Kuryshbayev");

		// employee
		List<PersonClass> list = new ArrayList<PersonClass>();
		MySqlClass mysql = null;
		try {
			mysql = new MySqlClass();
			ResultSet rs = mysql.executeQuery("SELECT * FROM  EMPLOYEES");
			while (rs.next()) {
				list.add(createPerson(rs.getString("fname"), rs.getString("lname")));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				mysql.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		dc.employee = list.toArray(new PersonClass[list.size()]);

		// return
		return dc;
	}

	private PersonClass createPerson(String f, String l) {
		PersonClass p = new PersonClass();
		p.fName = f;
		p.lName = l;
		return p;
	}
}