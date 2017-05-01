package setting;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class MySqlClass {

	private static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	private static final String DB_URL = "jdbc:mysql://localhost/mysql";
	private static final String USER = "root";
	private static final String PASS = "enigma84";
	private Connection conn;

	public MySqlClass() throws SQLException, ClassNotFoundException {
		Class.forName(JDBC_DRIVER);
		setConn(DriverManager.getConnection(DB_URL, USER, PASS));
	}

	public ResultSet executeQuery(String sql) throws SQLException {
		Statement stmt = getConn().createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		return rs;
	}

	public void executeUpdate(String sql) throws SQLException {
		Statement stmt = getConn().createStatement();
		stmt.executeUpdate(sql);
	}

	public void close() throws SQLException {
		getConn().close();
	}

	public Connection getConn() {
		return conn;
	}

	public void setConn(Connection conn) {
		this.conn = conn;
	}

}