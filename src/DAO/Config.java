package DAO;

import java.sql.*;

public class Config {
	  public static Connection getConnection() {
		  
		  
		  Connection con=null;
		    try {
			  
			  Class.forName("oracle.jdbc.driver.OracleDriver");
			  con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","Mal*1495");
			  
			  
		  }catch(ClassNotFoundException c) {
			  c.printStackTrace();
		  }catch(SQLException s) {
			  s.printStackTrace();
		  }
		  
		  return con;
	  }
		
	
}