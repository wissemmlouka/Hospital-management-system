package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.AppointmentDao;
import com.db.DBConnect;

@WebServlet("/updateStatus")
public class UpdateStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UpdateStatus() {
		super();
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		try {
			int id = Integer.parseInt(req.getParameter("id"));
			int did = Integer.parseInt(req.getParameter("did"));
			String status = req.getParameter("status");

			AppointmentDao dao = new AppointmentDao(DBConnect.getConn());

			HttpSession session = req.getSession();

			if (dao.updateCommentStatus(id, did, status)) {
				session.setAttribute("succMsgStatus", "Status Updated");
				if (req.getParameter("check") != null) {
					res.sendRedirect("admin/patient.jsp?id=" + did);

				} else {
					res.sendRedirect("admin/patient.jsp");
				}
			} else {
				session.setAttribute("errorMsgStatus", "Something wrong on server");
				res.sendRedirect("admin/patient.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
