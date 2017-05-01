package data;

/*
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
*/
//@XmlAccessorType(XmlAccessType.FIELD)
//@XmlRootElement

public class DepartmentClass {

	// @XmlElement
	public String depName;

	// @XmlElement
	public int depId;

	// @XmlElement
	public PersonClass manager;

	// @XmlElement
	public PersonClass[] employee;

}