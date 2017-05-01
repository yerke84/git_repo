package data;

import javax.xml.bind.annotation.XmlElement;

public class UserClass {

	@XmlElement(name = "lname")
	public String lastName;

	@XmlElement(name = "fname")
	public String firstName;

}
