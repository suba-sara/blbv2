package DAO;

import java.util.List;
import Domain.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class UserDAO {
	
    Connection con;
	
	public UserDAO() {
		// TODO Auto-generated constructor stub
		System.out.print("test");
	}
	
	public List<User> authUser(String userName ,String pass) {
		//write your code here
		Connection con=null;
		ResultSet rs=null;
		Statement stmt=null;
		List<User> list =new ArrayList<>();
		
		try {
			
			con = Config.getConnection();
			if(con != null) {
				System.out.println("Connection not NUll in User Dao");
			}
			stmt= con.createStatement();
			String query="select * from admin WHERE nic='"+userName+"' AND password='" +pass+ "'";
			
			rs=stmt.executeQuery(query);
			
			while(rs.next()) {
				User u =new User(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5));
				list.add(u);
			}

		}//try
		
		catch(SQLException se) {se.printStackTrace();}
		
		finally {
			
			try {
				if(stmt!=null)
	                 stmt.close();
	               if(rs!=null)
	                 rs.close();
	               if(con!=null) { 
	                con.close();
	               }else {
	            	   System.out.println("Connection NUll in User Dao");
	               }
					
			}catch(SQLException se) {se.printStackTrace();}
			
			
		}
		
		return list;
	}
	
public void newUser(User u) {
		
		Connection con = null;
		PreparedStatement pmt = null;
		
		try {
			
			
			con = Config.getConnection();
			System.out.println("Connected ...");
			String query = "insert into admin(name, nic, password) values(?,?,?)";
			pmt=con.prepareStatement(query);
			pmt.setString(1,  u.getName());
			pmt.setString(2,  u.getNic());
			pmt.setString(3,  u.getPassword());
			
			System.out.println("Query Generated ... ");
			System.out.println(query);
			System.out.println("Executing Query");
			int n = pmt.executeUpdate();
			System.out.println("Query Executing Compleated ");
		} catch(SQLException  e) {
			System.out.println("Query Executing Error ");
			e.printStackTrace();
			
		} finally {
			try {
				if(pmt != null) {
					pmt.close();
				} if(con!=null) {
					con.close();
				}
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
	}

public ResultSet getAllUsers() throws SQLException{
    
	Connection con=null;
	ResultSet rs=null;
	Statement stmt = null;
	
  
    try{
    	
    	con = Config.getConnection();
		
		  System.out.println(" Executing query ");
		  String query = "SELECT * FROM admin";
		  
		  System.out.println(query);
		  
		  System.out.println(" On Process ");
		  
		  stmt= con.createStatement();
		  rs = stmt.executeQuery(query);

		  System.out.println(rs);
		  return rs;
    } catch(SQLException ex){
        System.out.println(" Error Reading ");
     
        return rs; 
    }       
}
	

}
