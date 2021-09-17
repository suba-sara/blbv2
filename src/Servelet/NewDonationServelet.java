package Servelet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.DonationDAO;
import Domain.Donation;


@WebServlet("/NewDonationServelet")
public class NewDonationServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String location=request.getParameter("location");
        int donator=Integer.parseInt(request.getParameter("donator"));
        int user=Integer.parseInt(request.getParameter("user"));
        String donationId=request.getParameter("donationId");
        String donatorBloodGroup=request.getParameter("donatorBloodGroup");
	
		DonationDAO dao=new DonationDAO();
		Donation  donation = new Donation(donationId,location,donator,user,donatorBloodGroup);
		dao.newDonation(donation);
//	
		
//		
//		if (userName.equals("admin")&& password.equals("nimda")) response.sendRedirect("adminDashboard.jsp");
//		else if (list.isEmpty()) response.sendRedirect("index.jsp");
//		else
			response.sendRedirect("searchResult.jsp");
	}

}
