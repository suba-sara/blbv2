package DAO;

import java.util.List;

import Domain.Donation;
import Domain.Donator;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class DonatorDAO {
	
    Connection con;
	
	public DonatorDAO() {
		// TODO Auto-generated constructor stub
		System.out.print("test");
	}
	
	public List<Donator> checkAvailability(Donator d) {
		//write your code here
		Connection con=null;
		ResultSet rs=null;
		Statement stmt=null;
		List<Donator> list =new ArrayList<>();
		System.out.println(d.getNic());
		try {
			
			con = Config.getConnection();
			if(con != null) {
				System.out.println("Connection not NUll in User Dao");
			}
			stmt= con.createStatement();
			String query="select * from donator WHERE nic='"+d.getNic()+"'";
			System.out.println(query);
			rs=stmt.executeQuery(query);
			
			while(rs.next()) {
				Donator u =new Donator(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getInt(8),rs.getString(9));
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
	
	public List<Donator> checkAvailability(String nic) {
		//write your code here
		Connection con=null;
		ResultSet rs=null;
		Statement stmt=null;
		List<Donator> list =new ArrayList<>();
		
		try {
			
			con = Config.getConnection();
			if(con != null) {
				System.out.println("Connection not NUll in User Dao");
			}
			stmt= con.createStatement();
			String query="select * from donator WHERE nic='"+nic+"'";
			System.out.println(query);
			rs=stmt.executeQuery(query);
			
			while(rs.next()) {
				Donator u =new Donator(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getInt(8),rs.getString(9));
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
	
public void newDonator(Donator d) {
		
		Connection con = null;
		PreparedStatement pmt = null;
		System.out.print("name");
		System.out.println(d.getName());
		try {

			
			
			
			con = Config.getConnection();
			System.out.println("Connected ...");
			String query = "insert into donator (name, nic, address, gender, dob, bloodGroup, contactNo) values('"+ d.getName()+"','"+ d.getNic()+"','"+ d.getAddress()+"','"+ d.getGender()+"',TO_DATE('"+ d.getDob()+"', 'yyyy-MM-dd'),'"+ d.getBloodGroup()+"','"+ d.getContactNo()+"')";
			pmt=con.prepareStatement(query);
//			pmt.setString(1,  d.getName());
//			pmt.setString(2,  d.getNic());
//			pmt.setString(3,  d.getAddress());
//			pmt.setString(4,  d.getGender());
//			pmt.setString(5,  d.getDob());
//			pmt.setString(6,  d.getBloodGroup());
//			pmt.setInt(7,  d.getContactNo());
//		
			
			
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


public ResultSet getAllDonator() throws SQLException{
    
	Connection con=null;
	ResultSet rs=null;
	Statement stmt = null;
	
  
    try{
    	
    	con = Config.getConnection();
		
		  System.out.println(" Executing query ");
		  String query = "SELECT * FROM donator";
		  
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

public void UpdateDonator(Donator d) {
	
	Connection con = null;
	PreparedStatement pmt = null;
	System.out.print("name");
	try {

		
		con = Config.getConnection();
		System.out.println("Connected ...");
		String query = "UPDATE donator SET address='"+ d.getAddress()+"',gender='"+ d.getGender()+"',dob=TO_DATE('"+ d.getDob()+"', 'yyyy-MM-dd'),bloodGroup='"+ d.getBloodGroup()+"',contactNo='"+ d.getContactNo()+"',status='"+ d.getStatus()+"' WHERE id='"+ d.getId()+"'";
		pmt=con.prepareStatement(query);
//		pmt.setString(1,  d.getName());
//		pmt.setString(2,  d.getNic());
//		pmt.setString(3,  d.getAddress());
//		pmt.setString(4,  d.getGender());
//		pmt.setString(5,  d.getDob());
//		pmt.setString(6,  d.getBloodGroup());
//		pmt.setInt(7,  d.getContactNo());
//	
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
	

}
