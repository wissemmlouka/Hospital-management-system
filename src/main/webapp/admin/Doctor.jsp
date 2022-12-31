<%@page import="com.mysql.cj.Session"%>
<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.entity.Specialist"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.SpecialistDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"  isELIgnored="false"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		<c:redirect url="../admin_login.jsp"></c:redirect>
	</c:if>
	<%@include file="../component/navbar.jsp"%>
	<div class="container-fluid p-3">
		<div class="row">

			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Add Doctor</p>
						<c:if test="${not empty errorMsg}">
							<p class="fs-3 text-center text-danger">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<c:if test="${not empty succMsg}">
							<div class="fs-3 text-center text-success" role="alert">${succMsg}</div>
							<c:remove var="succMsg" scope="session" />
						</c:if>
						<form action="../DoctorCrud" method="post">
							<div class="mb-3">
								<label class="form-label">Full Name</label> <input type="text"
									required name="fullname" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">DOB</label> <input type="date"
									required name="dob" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Qualification</label> <input required
									name="qualification" type="text" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">Specialist</label> <select name="spec"
									required class="form-control">
									<option>--select--</option>

									<%
									SpecialistDao dao = new SpecialistDao(DBConnect.getConn());
									List<Specialist> list = dao.getAllSpecialist();
									for (Specialist s : list) {
									%>
									<option><%=s.getSpecialistName()%></option>
									<%
									}
									%>


								</select>
							</div>

							<div class="mb-3">
								<label class="form-label">Email</label> <input type="text"
									required name="email" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Mob No</label> <input type="text"
									required name="mobno" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Password</label> <input required
									name="password" type="password" class="form-control">
							</div>

							<button type="submit" class="btn btn-primary">Add</button>
						</form>
					</div>
				</div>
			</div>

            <div class="col-md-8">
            
                <div class="card paint-card">
                     <div class="card-body">
                      <p class="fs-3 text-center">Doctor Details</p>
                      	<c:if test="${not empty errorMsgDelete}">
							<p class="fs-3 text-center text-danger">${errorMsgDelete}</p>
							<c:remove var="errorMsgDelete" scope="session" />
						</c:if>
						<c:if test="${not empty succMsgDelete}">
							<div class="fs-3 text-center text-success" role="alert">${succMsgDelete}</div>
							<c:remove var="succMsgDelete" scope="session" />
						</c:if>
                       <table class="table">
                         <thead>
                           <tr>
                           <th scope="col"> Full Name</th>
                           <th scope="col"> BOB</th>
                           <th scope="col">Qualification</th>
                           <th scope="col">Specialist</th>
                           <th scope="col"> Email</th>
                           <th scope="col"> Mob No</th>
                           <th scope="col"> Action</th>
                           </tr>
                         
                         
                         </thead>
                        <tbody>
                      
                        	<%
									DoctorDao ddao = new DoctorDao(DBConnect.getConn());
									List<Doctor> dlist = ddao.getAllDoctor();
									
									for(Doctor d:dlist){
							%>
							<tr>
                        
                                <td><%=d.getFullName()%></td>
                                 <td><%=d.getDob()%></td>
                                  <td><%=d.getQualification() %></td>
                                   <td><%=d.getSpecialist()%></td>
                                    <td><%=d.getEmail()%></td>
                                    <td><%=d.getMobNo()%></td>
                                        
                                     <td style="display: flex;">
                                  
                                   <a  href="edit_doctor.jsp?id=<%=d.getId()%>" class="btn btn-sm btn-primary" >Edit</a>
                                     <a  href="../DoctorCrud?idDoctorDelete=<%=d.getId() %>" class="btn btn-sm btn-danger">Delete</a>
                                
                                     <a class="btn btn-sm btn-primary" href="patient.jsp?id=<%=d.getId()%>">Appointment</a>
                                     </td>
                            </tr>
                       
							 <%} %>
				
                           
                           
                        
                        </tbody>
                       </table>
                     
                     </div>
                
                
                </div>
 
            
            </div>
			
		</div>
	</div>

	
</body>
</html>

























































