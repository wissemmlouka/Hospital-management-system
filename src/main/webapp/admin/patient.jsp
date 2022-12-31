<%@page import="com.dao.UserDao"%>
<%@page import="com.entity.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.AppointmentDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="../component/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<c:if test="${empty adminObject }">
		<c:redirect url="../doctor_login.jsp"></c:redirect>
	</c:if>


	<%@include file="../component/navbar.jsp"%>
	<div class="container p-3">
		<div class="row">

			<div class="col-md-12">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Patient Details</p>
						<c:if test="${not empty errorMsgStatus}">
			<p class="fs-3 text-center text-danger">${errorMsgStatus}</p>
			<c:remove var="errorMsgStatus" scope="session" />
		</c:if>
		<c:if test="${not empty succMsgStatus}">
			<div class="fs-3 text-center text-success" role="alert">${succMsgStatus}</div>
			<c:remove var="succMsgStatus" scope="session" />
		</c:if>
						<table class="table">
							<thead>
								<tr>
								    <th scope="col">User</th>
									<th scope="col">Full Name</th>
									<th scope="col">Gender</th>
									<th scope="col">Age</th>
									<th scope="col">Appointment Date</th>
									<th scope="col">Email</th>
									<th scope="col">Mob No</th>
									<th scope="col">Diseases</th>
									<th scope="col">Status</th>
								</tr>
							</thead>
							<tbody>
								<%
								String id="";
								AppointmentDao dao = new AppointmentDao(DBConnect.getConn());
								UserDao dao1 = new UserDao(DBConnect.getConn());

								List<Appointment> list=null;
								if(request.getParameter("id")!=null){
									 id=request.getParameter("id");
									 list = dao.getAllAppointmentByDoctorLogin(Integer.parseInt(id));
								}
								else{
							     list = dao.getAllAppointment();
								}
								for (Appointment ap : list) {
								%>
								<tr>
									<td><%=dao1.getUserById(ap.getUserId()).getFullName()%></td>
								
									<th><%=ap.getFullName()%></th>
									<td><%=ap.getGender()%></td>
									<td><%=ap.getAge()%></td>
									<td><%=ap.getAppoinDate()%></td>
									<td><%=ap.getEmail()%></td>
									<td><%=ap.getPhNo()%></td>
									<td><%=ap.getDiseases()%></td>
									<td>
									<form action="updateStatus.jsp">
									<input type="hidden" name="name" value="<%=ap.getFullName()%>">
									<input type="hidden" name="age" value="<%=ap.getAge()%>">
									<input type="hidden" name="mob" value="<%=ap.getPhNo()%>">
									<input type="hidden" name="dis" value="<%=ap.getDiseases()%>">
								    <input type="hidden" name="id" value="<%=ap.getId()%>">
								        <input type="hidden" name="iddoc" value="<%=ap.getDoctorId()%>">
								        <%if(request.getParameter("id")!=null){ %>	
								         <input type="hidden" name="check" value="yes">
								        
								        <%} %>	
									<button type="submit" class="btn btn-success btn-sm"><%=ap.getStatus()%></button>
									</form>
										
										
									</td>
								</tr>
								<%
								}
								%>



							</tbody>
						</table>

					</div>
				</div>
			</div>

		</div>
	</div>



</body>
</html>