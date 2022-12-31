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
	<%@include file="../component/navbar.jsp"%>

	<c:if test="${ empty userObject }">
		<c:redirect url="../user_login.jsp"></c:redirect>
	</c:if>

	<div  class="container p-4">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card paint-card">
					<p class="text-center fs-3">Change Password</p>
					<c:if test="${not empty succMsgChangePass }">
						<p class="text-center text-success fs-3">${succMsgChangePass}</p>
						<c:remove var="succMsgChangePass" scope="session" />
					</c:if>

					<c:if test="${not empty errorMsgChangePass }">
						<p class="text-center text-danger fs-5">${errorMsgChangePass}</p>
						<c:remove var="errorMsgChangePass" scope="session" />
					</c:if>
					<div  class="card-body">
						<form action="../userCrud" method="post">
					
							<div class="mb-3">
								<label>Enter New Password</label> <input type="password"
									name="newPassword" class="form-control" required>
							</div>

							<div class="mb-3">
								<label>Enter Old Password</label> <input type="password"
									name="oldPassword" class="form-control" required>
							</div>
							<div style="display: flex; width: 100%">
							
							<button style="margin-left: 1rem" class="btn btn-success ">Change
								</button>
									<a style="margin-left: 11rem" href="user_appointment.jsp" class="btn btn-danger ">Cancel
								</a>
							</div>
						
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>