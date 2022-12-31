package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDao;
import com.db.DBConnect;
import com.entity.User;

@WebServlet("/register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		try {
			String fullname = req.getParameter("fullname");
			String email = req.getParameter("email");
			String password = req.getParameter("password");
			User user = new User(fullname, email, password);
			UserDao dao = new UserDao(DBConnect.getConn());
			HttpSession session = req.getSession();
			boolean f = dao.register(user);

			if (f) {
				session.setAttribute("successMsg", "register successfully");
				res.sendRedirect("signup.jsp");

			} else {
				session.setAttribute("errorMsg", "register wrong");
				res.sendRedirect("signup.jsp");
			}
		} catch (Exception e) {
			System.out.println("error: " + e.getMessage());
			// e.printStackTrace();
		}
	}

}
