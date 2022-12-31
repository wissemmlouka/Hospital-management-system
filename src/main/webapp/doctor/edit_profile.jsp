<%@page import="com.entity.Specialist"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.SpecialistDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Profile</title>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
<%@include file="../component/allcss.jsp"%>
</head>
<body>
	<c:if test="${empty doctObject }">
		<c:redirect url="../doctor_login.jsp"></c:redirect>
	</c:if>


	<%@include file="../component/navbar.jsp"%>

	<div class="container p-4">
		<div class="row">
			<div class="col-md-4">
				<div class="card paint-card">
					<p class="text-center fs-3">Update Profile</p>
					<c:if test="${not empty succMsgUpdateD }">
						<p class="text-center text-success fs-3">${succMsgUpdateD}</p>
						<c:remove var="succMsgUpdateD" scope="session" />
					</c:if>

					<c:if test="${not empty errorMsgUpdateD }">
						<p class="text-center text-danger fs-5">${errorMsgUpdateD}</p>
						<c:remove var="errorMsgUpdateD" scope="session" />
					</c:if>
					<div class="card-body">
						<form action="../doctUpdateProfile" method="post">
						<div class="mb-3">
								<label>Name</label> <input type="text" value="${doctObject.fullName }" required
									name="name" class="form-control" >
							</div>
							<div class="mb-3">
								<label>Email</label> <input type="text" value="${doctObject.email }" required
									name="email" class="form-control" >
							</div>
							<div class="mb-3">
								<label>Mobile number</label> <input type="text" value="${doctObject.mobNo }" required
									name="mob" class="form-control" >
							</div>
							<div class="mb-3">
								<label>Enter New Password</label> <input type="text"
									name="newPassword" class="form-control" >
							</div>

							<div class="mb-3">
								<label>Enter Old Password</label> <input type="text"
									name="oldPassword" class="form-control" required>
							</div>
							<input type="hidden" value="${doctObject.id }" name="id">
							<button class="btn btn-success col-md-12">Update</button>
						</form>
					</div>
				</div>
			</div>

		</div>
	</div>


</body>
</html>
