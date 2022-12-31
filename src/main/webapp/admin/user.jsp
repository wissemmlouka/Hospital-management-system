<%@page import="com.entity.User"%>
<%@page import="com.dao.UserDao"%>
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


            <div class="col-md-8">
            
                <div class="card paint-card">
                     <div class="card-body">
                      <p class="fs-3 text-center">User Details</p>
                      	<c:if test="${not empty errorMsgDeleteUser}">
							<p class="fs-3 text-center text-danger">${errorMsgDeleteUser}</p>
							<c:remove var="errorMsgDeleteUser" scope="session" />
						</c:if>
						<c:if test="${not empty succMsgDeleteUser}">
							<div class="fs-3 text-center text-success" role="alert">${succMsgDeleteUser}</div>
							<c:remove var="succMsgDeleteUser" scope="session" />
						</c:if>
                       <table class="table">
                         <thead>
                           <tr>
                           <th scope="col"> Full Name</th>
                           <th scope="col"> Email</th>

                           <th scope="col"> Action</th>
                           </tr>
                         
                         
                         </thead>
                        <tbody>
                      
                        	<%
									UserDao dao = new UserDao(DBConnect.getConn());
									List<User> list = dao.getAllUsers();
									
									for(User d:list){
							%>
							<tr>
                        
                                <td><%=d.getFullName()%></td>
                                 <td><%=d.getEmail()%></td>
                               
                                        
                                     <td style="display: flex;">
                                  
                                     <a  href="../userCrud?idUserDelete=<%=d.getId() %>" class="btn btn-sm btn-danger">Delete</a>
                                
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

























































