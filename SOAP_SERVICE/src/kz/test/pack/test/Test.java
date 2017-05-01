package kz.test.pack.test;

import java.util.ArrayList;
import java.util.List;

import kz.test.pack.data.Address;
import kz.test.pack.data.User;
import kz.test.pack.data.UserAddresses;

public class Test {

	public User testMethod(String argname) {

		Address ad1 = new Address();
		ad1.city = "Almaty";
		ad1.street = "AA";
		ad1.house = 20;

		Address ad2 = new Address();
		ad2.city = "Astana";
		ad2.street = "BB";
		ad2.house = 777;

		//
		List<Address> addressList = new ArrayList<Address>();
		addressList.add(ad1);
		addressList.add(ad2);

		//
		UserAddresses userAddresses = new UserAddresses();
		userAddresses.address = addressList.toArray(new Address[addressList.size()]);

		//
		User user = new User();
		user.name = argname;
		user.userAddresses = userAddresses;
		return user;

	}

}