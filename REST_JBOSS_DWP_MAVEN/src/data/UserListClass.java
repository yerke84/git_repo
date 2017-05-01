package data;

import java.util.List;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name = "root")
public class UserListClass {

	@XmlElement(name = "listName")
	public String ss;

	@XmlElement(name = "item")
	public List<UserClass> user;

}
