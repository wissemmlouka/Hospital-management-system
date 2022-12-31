package com.login_logout;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/logout")
public class Logout extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Logout() {
		super();
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = req.getSession();

		if (session.getAttribute("adminObject") != null) {
			session.removeAttribute("adminObject");
			res.sendRedirect("admin_login.jsp");
		}

		if (session.getAttribute("userObject") != null) {
			session.removeAttribute("userObject");
			res.sendRedirect("user_login.jsp");
		}

		if (session.getAttribute("doctObject") != null) {
			session.removeAttribute("doctObject");
			res.sendRedirect("doctor_login.jsp");
		}
	}

}
