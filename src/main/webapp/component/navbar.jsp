<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<nav class="navbar navbar-expand-lg navbar-dark bg-success">
	<div class="container-fluid">
	<c:if test="${empty userObject && empty doctObject &&  empty adminObject}">
		<a class="navbar-brand" href="index.jsp"><i
			class="fas fa-clinic-medical"></i> Cabinti</a>
	</c:if>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
		
		<c:if test="${not empty adminObject }">



	<ul class="navbar-nav me-auto mb-2 mb-lg-0">

				<li class="nav-item"><a class="nav-link active" href="index.jsp">HOME</a></li>
				<li class="nav-item"><a class="nav-link active" href="Doctor.jsp">DOCTOR</a></li>
				<li class="nav-item"><a class="nav-link active" href="patient.jsp">PATIENT</a></li>
				<li class="nav-item"><a class="nav-link active" href="user.jsp">USER</a></li>


			</ul>

			<form class="d-flex">
				<div class="dropdown">
					<button class="btn btn-success dropdown-toggle" type="button"
						id="dropdownMenuButton1" data-bs-toggle="dropdown"
						aria-expanded="false">Admin</button>
					<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
						<li><a class="dropdown-item" href="../logout">Logout</a></li>
					</ul>
				</div>
			</form>




</c:if>
<c:if test="${ empty adminObject }">
			<ul class="navbar-nav ms-auto mb-2 mb-lg-0">

				<c:if test="${empty userObject && empty doctObject }">
					<li id="admin"   class="nav-item"><a  class="nav-link active"
						aria-current="page" href="admin_login.jsp"><i
							class="fas fa-sign-in-alt"></i> ADMIN</a></li>

					<li id="doctor" class="nav-item"><a  class="nav-link active"
						aria-current="page" href="doctor_login.jsp">DOCTOR</a></li>
				
					<li id="user"  class="nav-item"><a class="nav-link active"
						aria-current="page" href="user_login.jsp">USER</a></li>

				</c:if>


				<c:if test="${not empty userObject }">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="../user/user_appointment.jsp">APPOINTMENT</a></li>

					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="../user/view_appointment.jsp">VIEW APPOINTMENT</a></li>

					<div class="dropdown">
						<button class="btn btn-success dropdown-toggle" type="button"
							id="dropdownMenuButton1" data-bs-toggle="dropdown"
							aria-expanded="false">
							<i class="fa-solid fa-circle-user"></i> ${userObject.fullName }
						</button>
						<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
							<li><a class="dropdown-item" href="../user/change_pass.jsp">Change Password</a></li>
							<li><a class="dropdown-item" href="../logout">Logout</a></li>
							
						</ul>
					</div>


					

				</c:if>



<c:if test="${not empty doctObject }">

				<li class="nav-item"><a class="nav-link" href="index.jsp">HOME</a></li>
				<li class="nav-item"><a class="nav-link" href="patient.jsp">PATIENT</a></li>
	

			<form class="d-flex">
				<div class="dropdown">
					<button class="btn btn-success dropdown-toggle" type="button"
						id="dropdownMenuButton1" data-bs-toggle="dropdown"
						aria-expanded="false">
						<i class="fas fa-user-circle"></i> ${doctObject.fullName }
					</button>
					<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
						<li><a class="dropdown-item" href="edit_profile.jsp">Edit
								Profile</a></li>
						<li><a class="dropdown-item" href="../logout">Logout</a></li>
					</ul>
			
                </div>
                </form>


	</c:if>









			</ul>
			
			
</c:if>
		</div>
	</div>
</nav>

