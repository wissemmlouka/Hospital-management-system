package com.login_logout;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.DoctorDao;
import com.dao.UserDao;
import com.db.DBConnect;
import com.entity.Doctor;
import com.entity.User;

@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Login() {
		super();
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String who = req.getParameter("who");

		String email = req.getParameter("email");
		String password = req.getParameter("password");
		try {

			if (who.equalsIgnoreCase("admin")) {

				if (email.equalsIgnoreCase("admin@gmail.com") && password.equalsIgnoreCase("admin")) {
					session.setAttribute("adminObject", new User());
					res.sendRedirect("admin/index.jsp");
				} else {
					session.setAttribute("errorMsgAdmin", "invalid email or password");
					res.sendRedirect("admin_login.jsp");

				}

				return;
			}
			if (who.equalsIgnoreCase("doctor")) {

				DoctorDao dao = new DoctorDao(DBConnect.getConn());
				Doctor doctor = dao.login(email, password);

				if (doctor != null) {
					session.setAttribute("doctObject", doctor);
					res.sendRedirect("doctor/index.jsp");
				} else {
					session.setAttribute("errorMsgDoctor", "invalid email & password");
					res.sendRedirect("doctor_login.jsp");
				}

				return;
			}

			if (who.equalsIgnoreCase("user")) {

				UserDao dao = new UserDao(DBConnect.getConn());
				User user = dao.login(email, password);

				if (user != null) {
					session.setAttribute("userObject", user);
					res.sendRedirect("user/user_appointment.jsp");
				} else {
					session.setAttribute("errorMsgUser", "invalid email & password");
					res.sendRedirect("user_login.jsp");
				}

				return;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
