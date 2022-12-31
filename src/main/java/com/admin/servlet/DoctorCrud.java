package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.DoctorDao;
import com.db.DBConnect;
import com.entity.Doctor;

@WebServlet("/DoctorCrud")
public class DoctorCrud extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@SuppressWarnings("unused")
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		try {
			DoctorDao dao = new DoctorDao(DBConnect.getConn());
			HttpSession session = req.getSession();

			String fullName = req.getParameter("fullname");
			String dob = req.getParameter("dob");
			String qualification = req.getParameter("qualification");

			String spec = req.getParameter("spec");

			String email = req.getParameter("email");
			String mobno = req.getParameter("mobno");
			String password = req.getParameter("password");

			if (req.getParameter("idDoctorUpdate") != null) {
				Integer idDoctor = Integer.parseInt(req.getParameter("idDoctorUpdate"));
				Doctor d = new Doctor(idDoctor, fullName, dob, qualification, spec, email, mobno, password);

				if (dao.updateDoctor(d)) {
					session.setAttribute("succMsg", "Doctor Update Sucessfully..");
					res.sendRedirect("admin/edit_doctor.jsp?id=" + idDoctor);
				} else {
					session.setAttribute("errorMsg", "something wrong on server");
					res.sendRedirect("admin/edit_doctor.jsp?id=" + idDoctor);
				}
			} else {

				Doctor d = new Doctor(fullName, dob, qualification, spec, email, mobno, password);

				if (dao.registerDoctor(d)) {
					session.setAttribute("succMsg", "Doctor Added Sucessfully..");
					res.sendRedirect("admin/Doctor.jsp");
				} else {
					session.setAttribute("errorMsg", "something wrong on server");
					res.sendRedirect("admin/Doctor.jsp");
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		Integer idDictor = Integer.parseInt(req.getParameter("idDoctorDelete"));
		try {
			if (idDictor != null) {
				DoctorDao dao = new DoctorDao(DBConnect.getConn());
				HttpSession session = req.getSession();

				if (dao.deleteDoctor(idDictor)) {
					session.setAttribute("succMsgDelete", "Doctor Delete Sucessfully..");
					res.sendRedirect("admin/Doctor.jsp");
				} else {
					session.setAttribute("errorMsgDelete", "something wrong on server");
					res.sendRedirect("admin/Doctor.jsp");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();

		}

	}
}