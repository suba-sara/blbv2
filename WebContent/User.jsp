<jsp:include page="WEB-INF/CommenLayouts/Header.jsp"></jsp:include>
<jsp:include page="WEB-INF/CommenLayouts/NavBar.jsp"></jsp:include>
<jsp:include page="WEB-INF/CommenLayouts/SlideDrower.jsp"></jsp:include>

<%@page import="java.sql.ResultSet"%>
<%@page import="DAO.UserDAO"%>
<%@page import="Domain.User"%>
<%@page import="java.util.List"%>

<div class="content">
        <div class="container-fluid">
          <div class="row">
            <div class="col-md-12">
              <div class="card">
                <div class="card-header card-header-primary">
                  <h4 class="card-title ">Users </h4>
                  <p class="card-category float-right" id="myBtn">  <i class="material-icons">person_add</i></p>
                  
                  <div id="myModal" class="modal">

					  <!-- Modal content -->
					  <div class="modal-content">
					    <span class="close">&times;</span>
					   				
					   		<div class="card">
			                <div class="card-header card-header-primary">
			                  <h4 class="card-title">New User</h4>
			                  <p class="card-category">Complete  profile</p>
			                </div>
			                <div class="card-body">
			                  <form action="NewUserServelet" method="POST">
				                   
				                   <div class="row  ">
				                      <div class="col-md-6 ">
				                        <div class="form-group">
				                          <label class="bmd-label-floating">Name</label>
				                          <input type="text" id="userName" name="name" class="form-control" required>
				                        </div>
				                      </div>
                    				</div>				                   
				                    <div class="row ">
				                      <div class="col-md-6">
				                        <div class="form-group">
				                          <label class="bmd-label-floating">NIC</label>
				                          <input type="text" id="userName" pattern="[0-9]{9}[vxVX]{1}|[0-9]{12}" name="userName" class="form-control" required>
				                        </div>
				                      </div>
                    				</div>
				                    <div class="row ">
				                      <div class="col-md-6">
				                        <div class="form-group">
				                          <label class="bmd-label-floating">Password</label>
				                          <input type="text" pattern=".{6,}" id="password" name ="password" placeholder="Password must contain at least 6 Characters" class="form-control" required>
				                        </div>
				                      </div>
				                    </div>
                    
                    
                    
                    <button type="submit" class="btn btn-primary ">Create</button>
                    <div class="clearfix"></div>
                  </form>
			                </div>
              </div>
					   		
					  </div>
					
					</div>
                </div>
                <div class="card-body">
                  <div class="table-responsive">
                    <table class="table">
                      <thead class=" text-primary">
                        <th>
                          ID
                        </th>
                        <th>
                          Name
                        </th>
                        <th>
                          NIC
                        </th>
                        <th>
                          Password
                        </th>
                        <th>
                          
                        </th>
                      </thead>
                      <tbody>
                      
                     
							
							<%
								try{
								ResultSet resultSet = null;
								UserDAO dao=new UserDAO();
								resultSet =dao.getAllUsers();
								  
								 //System.out.println(resultSet.getInt("id"));
								while(resultSet.next()){
								%>
								<tr>
								<td><%=resultSet.getInt(1) %></td>
								<td><%=resultSet.getString(2) %></td>
								<td><%=resultSet.getString(3) %></td>
								<td><%=resultSet.getString(4) %></td>
								
								</tr>
								<%
								}
								
								} catch (Exception e) {
								e.printStackTrace();
								}
								%>
                      
                        
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
            
          </div>
        </div>
      </div>



<script>
// Get the modal
var modal = document.getElementById("myModal");

// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 
btn.onclick = function() {
  modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
  modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}
</script>


<jsp:include page="WEB-INF/CommenLayouts/Footer.jsp"></jsp:include>
    