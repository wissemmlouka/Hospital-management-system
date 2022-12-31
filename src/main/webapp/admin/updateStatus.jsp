<%@page import="com.db.DBConnect"%>
<%@page import="com.entity.Appointment"%>
<%@page import="com.dao.AppointmentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Status</title>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}

.backImg {
	background: linear-gradient(rgba(0, 0, 0, .4), rgba(0, 0, 0, .4)),
		url("../img/hospital.jpg");
	height: 20vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}
</style>
<%@include file="../component/allcss.jsp"%>
</head>
<body>

<c:if test="${empty adminObject }">
		<c:redirect url="../admin_login.jsp"></c:redirect>
	</c:if>

	<%@include file="../component/navbar.jsp"%>
	<div class="container-fulid backImg p-5">
		<p class="text-center fs-2 text-white"></p>
	</div>
	<div class="container p-3">
		<div class="row">

			<div class="col-md-6 offset-md-3">
				<div class="card paint-card">
					<div class="card-body">
						<p class="text-center fs-4">Patient Update Status</p>

						<form class="row" action="../updateStatus" method="post">
							<div class="col-md-6">
								<label>Patient Name</label> <input type="text" readonly
									value="<%=request.getParameter("name")%>" class="form-control">
							</div>

							<div class="col-md-6">
								<label>Age</label> <input type="text" value="<%=request.getParameter("age")%>"
									readonly class="form-control">
							</div>


							<div class="col-md-6">
								<br> <label>Mob No</label> <input type="text" readonly
									value="<%=request.getParameter("mob")%>" class="form-control">
							</div>

							<div class="col-md-6">
								<br> <label>Diseases</label> <input type="text" readonly
									value="<%=request.getParameter("dis")%>" class="form-control">
							</div>

							<div class="col-md-12">
								<br> <label>Status</label>
								<input type="text" required name="status" class="form-control" >
							</div>

							<input type="hidden" name="id" value="<%=request.getParameter("id")%>">
							 <input
								type="hidden" name="did" value="<%=request.getParameter("iddoc")%>">
                               <%if(request.getParameter("check")!=null){ %>
                               <input type="hidden" name="check" value="yes">
                               
                               <%} %>
							<button class=" mt-3 btn btn-primary col-md-6 offset-md-3">Submit</button>

						</form>

					</div>
				</div>
			</div>
		</div>
	</div>



</body>
</html>