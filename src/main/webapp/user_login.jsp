<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user login page</title>
<%@include file="../component/allcss.jsp" %>
<style>

.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>


<%@include file="../component/navbar.jsp" %>
    <c:if test="${not empty userObject }">
		<c:redirect url="user/user_appointment.jsp"></c:redirect>
	</c:if>

	<div class="container p-5">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-4 text-center">User Login</p>
							<c:if test="${not empty errorMsgUser }">
							<p class="text-center text-danger fs-3">${errorMsgUser}</p>
							<c:remove var="errorMsgUser" scope="session" />
						</c:if>
				
						<form action="login" method="post">
							<div class="mb-3">
								<label class="form-label">Email address</label> <input required
									name="email" type="email" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">Password</label> <input required
									name="password" type="password" class="form-control">
							</div>
						    <input type="hidden" name="who" value="user">
							
							<button  type="submit" class="btn bg-success text-white col-md-12">Login</button>
						</form>
					<br> Don't have an account? <a href="signup.jsp"
							class="text-decoration-none"> create one</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>