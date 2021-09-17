package Servelet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.DonatorDAO;
import Domain.Donator;


@WebServlet("/SearchServelet")
public class SearchServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String nic=request.getParameter("nic");
		
		DonatorDAO dao=new DonatorDAO();
		List<Donator> list=dao.checkAvailability(nic);
//		Scanner sc=new Scanner(System.in);
		System.out.printf("%-15s%-15s%-15s%-15s\n","Name","Mobile","Username","Password");
		System.out.println(list.size());
		
		if(list.size()==0) {
			
			 HttpSession session = request.getSession();
			session.setAttribute("donatorName","");
            session.setAttribute("donatorId", "");
            session.setAttribute("donatorNIC", "");
            session.setAttribute("donatorAddress", "");
            session.setAttribute("donatorStatus","");
            session.setAttribute("donatorGender", "");
            session.setAttribute("donatorDob", "");
            session.setAttribute("donatorBloodGroup", "");
            session.setAttribute("donatorContactNo","");
            session.setAttribute("donatorNew", "true");
		
	}
		
		for(Donator u:list) {
			System.out.println(u.getName());
			 HttpSession session = request.getSession();
			session.setAttribute("donatorName", u.getName());
            session.setAttribute("donatorId", Integer.toString(u.getId()));
            session.setAttribute("donatorNIC", u.getNic());
            session.setAttribute("donatorAddress", u.getAddress());
            session.setAttribute("donatorStatus", u.getStatus());
            session.setAttribute("donatorGender", u.getGender());
            session.setAttribute("donatorDob", u.getDob());
            session.setAttribute("donatorBloodGroup", u.getBloodGroup());
            session.setAttribute("donatorContactNo", Integer.toString(u.getContactNo()));
            session.setAttribute("donatorNew", "false");
//            
		
	}
		
		 response.sendRedirect("searchResult.jsp");
	}

}
