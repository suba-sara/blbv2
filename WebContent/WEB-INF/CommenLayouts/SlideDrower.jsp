<%
//allow access only if session exists
String userName = "";

if(session.getAttribute("userName") == null){
	response.sendRedirect("index.jsp");
}else {userName = (String) session.getAttribute("userName");}

String userId = null;
if(session.getAttribute("userId") == null){
	response.sendRedirect("index.jsp");
}else {userId = (String) session.getAttribute("userId");} 
%>

<div class="sidebar" data-color="purple" data-background-color="white">
      <div class="logo">
        <a href="http://www.creative-tim.com" class="simple-text logo-normal">
         Welcome 
        </a>
        <a href="http://www.creative-tim.com" class="simple-text logo-normal">
         <%=userName %>
        </a>
      </div>
     
      <div class="sidebar-wrapper">
        <ul class="nav">
       <!--   <li class="nav-item active  ">
            <a class="nav-link" href="dashboard.jsp">
              <i class="material-icons">dashboard</i>
              <p>Dashboard</p>
            </a>
          </li> -->
          <%
		      	String role = null;
				if(session.getAttribute("role") == null){
					role = "login";
				}else {role = (String) session.getAttribute("role");} 
				if (role.equals("admin")){
					%>
					
					 <li class="nav-item active  ">
            <a class="nav-link" href="dashboard.jsp">
              <i class="material-icons">dashboard</i>
              <p>Dashboard</p>
            </a>
          </li>
					
					<li class="nav-item active">
			            <a class="nav-link" href="User.jsp">
			              <i class="material-icons">person</i>
			              <p>User</p>
			            </a>
			          </li>
			          <li class="nav-item active  ">
				            <a class="nav-link" href="Donator.jsp">
				              <i class="material-icons">people</i>
				              <p>Donator</p>
				            </a>
				          </li>
				          <li class="nav-item active  ">
				            <a class="nav-link" href="DonationHistory.jsp">
				              <i class="material-icons">history</i>
				              <p>DonationHistory</p>
				            </a>
				          </li>
				          
				          <li class="nav-item active  ">
				            <a class="nav-link" href="LogOutServlet">
				              <i class="material-icons">login</i>
				              <p>Log Out</p>
				            </a>
				          </li>	
									
									<%
									
									
				}
				else if (role.equals("user")){
					%>
					
					 <li class="nav-item active  ">
            <a class="nav-link" href="dashboard.jsp">
              <i class="material-icons">dashboard</i>
              <p>Dashboard</p>
            </a>
          </li>
					
					<li class="nav-item active  ">
				            <a class="nav-link" href="search.jsp">
				              <i class="material-icons">opacity</i>
				              <p>Donation</p>
				            </a>
				          </li>	
				          <li class="nav-item active  ">
				            <a class="nav-link" href="LogOutServlet">
				              <i class="material-icons">login</i>
				              <p>Log Out</p>
				            </a>
				          </li>	
									<%
									
									
				}
		%>
          
          
          <!-- your sidebar here -->
        </ul>
      </div>
    </div>
    <div class="main-panel">