package com.admin.servlet;

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

@WebServlet("/userCrud")
public class UserCrud extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UserCrud() {
		super();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		Integer idUser = Integer.parseInt(req.getParameter("idUserDelete"));
		try {
			if (idUser != null) {
				UserDao dao = new UserDao(DBConnect.getConn());
				HttpSession session = req.getSession();

				if (dao.deleteUser(idUser)) {
					session.setAttribute("succMsgDeleteUser", "User Deleted Sucessfully..");
					res.sendRedirect("admin/user.jsp");
				} else {
					session.setAttribute("errorMsgDeleteUser", "something wrong on server");
					res.sendRedirect("admin/user.jsp");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();

		}

	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		try {

			String newpass = req.getParameter("newPassword");
			String oldpass = req.getParameter("oldPassword");
			HttpSession session = req.getSession();
			UserDao dao = new UserDao(DBConnect.getConn());

			User oldU = (User) session.getAttribute("userObject");
			if (!oldpass.equalsIgnoreCase(oldU.getPassword())) {
				session.setAttribute("errorMsgChangePass", "Invalid Password");
				res.sendRedirect("user/change_pass.jsp");

			} else {
				System.out.println("id=   " + oldU.getId());
				if (dao.changePassword(oldU.getId(), newpass)) {
					User updatedUser = dao.getUserById(oldU.getId());
					session.setAttribute("succMsgChangePass", "password Updated Sucessfully..");
					session.setAttribute("userObject", updatedUser);

					res.sendRedirect("user/change_pass.jsp");
				} else {

					session.setAttribute("errorMsgChangePass", "Somthing worning !");
					res.sendRedirect("user/change_pass.jsp");
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
