package Servelet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import DAO.UserDAO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.List;
import java.util.Scanner;
import Domain.User;

import DAO.UserDAO;


@WebServlet("/AuthServelet")
public class AuthServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);
		String userName=request.getParameter("userName");
        String password=request.getParameter("password");
		System.out.print(userName);
		System.out.print(password);
		UserDAO dao=new UserDAO();
		List<User> list=dao.authUser(userName,password);
//		Scanner sc=new Scanner(System.in);
		System.out.printf("%-15s%-15s%-15s%-15s\n","Name","Mobile","Username","Password");
		System.out.println(list);
		
		for(User u:list) {
			System.out.println(u.getName());
			 HttpSession session = request.getSession();
			session.setAttribute("userName", u.getName());
            session.setAttribute("userId", Integer.toString(u.getId()));
            session.setAttribute("role", "user");
		
	}
		if (userName.equals("admin")&& password.equals("admin")) {
			HttpSession session = request.getSession();
			session.setAttribute("userName", "Admin");
            session.setAttribute("userId","0");
			session.setAttribute("role", "admin");
			response.sendRedirect("dashboard.jsp");
		}
		else if (list.isEmpty()) response.sendRedirect("index.jsp");
		else  response.sendRedirect("dashboard.jsp");
		}

}
