package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseUtil {
	public static Connection getConnection() {
		try {
			String dbURL = "jdbc:mysql://db-who-is-my-pet.chhwpuwsmntx.ap-northeast-2.rds.amazonaws.com/mydb";
			String dbID = "admin";
			String dbPassword = "sun6910!Pet";
			//Class.forName("com.mysql.jdbc.Driver");
			return DriverManager.getConnection(dbURL, dbID, dbPassword);
		}catch (Exception e){
			e.printStackTrace();
		}
		return null; 
	}
}
