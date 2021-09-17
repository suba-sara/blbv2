package Servelet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.UserDAO;
import Domain.User;


@WebServlet("/NewUserServelet")
public class NewUserServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String userName=request.getParameter("userName");
        String password=request.getParameter("password");
        String name=request.getParameter("name");
	
		UserDAO dao=new UserDAO();
		User user = new User(name,userName,password);
		dao.newUser(user);
//	
		
//		
//		if (userName.equals("admin")&& password.equals("nimda")) response.sendRedirect("adminDashboard.jsp");
//		else if (list.isEmpty()) response.sendRedirect("index.jsp");
//		else
			response.sendRedirect("User.jsp");
		}

	

}
