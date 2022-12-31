package com.doctor.servlet;

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

@WebServlet("/doctUpdateProfile")
public class DoctUpdateProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DoctUpdateProfile() {
		super();
	}

	@SuppressWarnings("null")
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		try {

			String fullName = req.getParameter("name");
			String email = req.getParameter("email");
			String mobno = req.getParameter("mob");
			String newpass = req.getParameter("newPassword");
			String oldpass = req.getParameter("oldPassword");
			int id = Integer.parseInt(req.getParameter("id"));
			DoctorDao dao = new DoctorDao(DBConnect.getConn());
			HttpSession session = req.getSession();

			Doctor oldD = (Doctor) session.getAttribute("doctObject");

			Doctor d = null;
			if (oldpass.equalsIgnoreCase(oldD.getPassword())) {
				if (newpass != null && !newpass.equalsIgnoreCase("")) {
					d = new Doctor(id, fullName, oldD.getDob(), oldD.getQualification(), oldD.getSpecialist(), email,
							mobno, newpass);
				} else {
					d = new Doctor(id, fullName, oldD.getDob(), oldD.getQualification(), oldD.getSpecialist(), email,
							mobno, oldD.getPassword());

				}
			}
			if (dao.updateDoctor(d)) {
				Doctor updateDoctor = dao.getDoctorById(id);
				session.setAttribute("succMsgUpdateD", "Doctor Updated Sucessfully..");
				session.setAttribute("doctObject", updateDoctor);

				res.sendRedirect("doctor/edit_profile.jsp");
			} else {
				if (!oldpass.equalsIgnoreCase(oldD.getPassword())) {
					session.setAttribute("errorMsgUpdateD", "Invalid Password");

				} else {
					session.setAttribute("errorMsgUpdateD", "Somthing worning !");
				}
				res.sendRedirect("doctor/edit_profile.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
