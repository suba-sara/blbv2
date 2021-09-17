package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import Domain.Donation;

public class DonationDAO {
	
	public DonationDAO() {
		// TODO Auto-generated constructor stub
		
	}
	
public void newDonation(Donation d) {
		
		Connection con = null;
		PreparedStatement pmt = null;
		System.out.print("name");
		try {

			con = Config.getConnection();
			System.out.println("Connected ...");
			String query = "insert into donation (donationId, location,  donator, admin, bloodGroup) values('"+ d.getDonationId()+"','"+ d.getLocation()+"','"+ d.getDonator()+"','"+ d.getUser()+"','"+ d.getDonatorBloodGroup()+"')";
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



public ResultSet getDonatorHistory(String id) throws SQLException{
    
	Connection con=null;
	ResultSet rs=null;
	Statement stmt = null;
	
  
    try{
    	
    	con = Config.getConnection();
		
		  System.out.println(" Executing query ");
		  String query = "SELECT * FROM donation WHERE donator='"+id+"' order by timeStamp desc";
		  
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
	
public ResultSet getDonatorHistory( ) throws SQLException{
    
	Connection con=null;
	ResultSet rs=null;
	Statement stmt = null;
	
  
    try{
    	
    	con = Config.getConnection();
		
		  System.out.println(" Executing query ");
		  String query = "SELECT * FROM donationHistory";
		  
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
	

public ResultSet getDonatuionStat( ) throws SQLException{

Connection con=null;
ResultSet rs=null;
Statement stmt = null;


try{
	
	con = Config.getConnection();
	
	  System.out.println(" Executing query ");
	  String query = "SELECT * FROM stats";
	  
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
