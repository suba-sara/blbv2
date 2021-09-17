<%@page import="java.text.SimpleDateFormat"%>
<jsp:include page="WEB-INF/CommenLayouts/Header.jsp"></jsp:include>
<jsp:include page="WEB-INF/CommenLayouts/NavBar.jsp"></jsp:include>
<jsp:include page="WEB-INF/CommenLayouts/SlideDrower.jsp"></jsp:include>
<%@page import="java.sql.ResultSet"%>
<%@page import="DAO.DonationDAO"%>
<%@page import="Domain.Donation"%>
<%@page import="java.util.List"%>
<%

SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
//allow access only if session exists
String donatorId = null;
String donatorName = null;
String donatorNIC = null;
String donatorAddress = null;
String donatorStatus = null;
String donatorBloodGroup = null;
String donatorDob = null;
String donatorGender = null;
String donatorContactNo = null;
String donatorNew = null;
String userId = null;

if(session.getAttribute("donatorId").equals("")){
	donatorId = "";
}else donatorId = (String) session.getAttribute("donatorId");

if(session.getAttribute("donatorName").equals("")){
	donatorName = "";
}else donatorName = (String) session.getAttribute("donatorName");

if(session.getAttribute("donatorNIC").equals("")){
	donatorNIC = "";
}else donatorNIC = (String) session.getAttribute("donatorNIC");

if(session.getAttribute("donatorAddress").equals("")){
	donatorAddress = "";
}else donatorAddress = (String) session.getAttribute("donatorAddress");

if(session.getAttribute("donatorStatus").equals("")){
	donatorStatus = "";
}else donatorStatus = (String) session.getAttribute("donatorStatus");

if(session.getAttribute("donatorBloodGroup").equals("")){
	donatorBloodGroup = "";
}else donatorBloodGroup = (String) session.getAttribute("donatorBloodGroup");

if(session.getAttribute("donatorDob").equals("")){
	donatorDob = "";
}else donatorDob = (sdf.format(sdf.parse((String) session.getAttribute("donatorDob"))));

if(session.getAttribute("donatorGender").equals("")){
	donatorGender = "";
}else donatorGender = (String) session.getAttribute("donatorGender");

if(session.getAttribute("donatorContactNo").equals("")){
	donatorContactNo = "";
}else donatorContactNo = (String) session.getAttribute("donatorContactNo");

if(session.getAttribute("donatorNew").equals("")){
	donatorNew = "";
}else donatorNew = (String) session.getAttribute("donatorNew");

if(session.getAttribute("userId").equals("")){
	userId = "";
}else userId = (String) session.getAttribute("userId");
%>


<div class="content">
        <div class="container-fluid">
        

        <form class="navbar-form" style="margin:40px;margin-top:0px;" action="SearchServelet" method="POST">
              <div class="input-group no-border">
                <input type="text" value="" class="form-control" name="nic" placeholder="Search...">
                <input type="submit" value="Search" class="btn btn-white btn-round btn-just-icon">
                  <i class="material-icons">search</i>
                  <div class="ripple-container"></div>
                </button>
              </div>
            </form>
            
            
            
            <div class="row">
            <div class="col-lg-6 col-md-12">
              <div class="card">
                <div class="card-header card-header-warning">
                  <h4 class="card-title"><%=donatorName %></h4>
                  <p class="card-category">NIC : <%=donatorNIC %></p>
                  
                  
                  
                </div>
              
                
                <div class="card-body">
                
                      
                  <form action="UpdateDonatorServelet" method="POST">
                  
                    <input type="hidden" value="<%=donatorId %>" name= "donatorId" class="form-control">
                    
                    <input type="hidden" value="<%=donatorNIC %>" name= "nic" class="form-control">
                    <input type="hidden" value="<%=donatorName %>" name= "name" class="form-control">
                    
                    <div class="row">
                      <div class="col-md-12">
                        <div class="form-group">
                          <label class="bmd-label-floating"> Address</label>
                          <input type="text" value="<%=donatorAddress %>" name= "address"  class="form-control">
                        </div>
                      </div>
                    </div>

                    <div class="row">
                      <div class="col-md-6">
                        <div class="form-group">
                          <label class="bmd-label-floating"> Gender</label>
                          <input type="text" value="<%=donatorGender %>" name= "gender"  class="form-control">
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-md-6">
                        <div class="form-group">
                          <label class="bmd-label-floating"> Blood Group</label>
                          <input type="text" value="<%=donatorBloodGroup %>" name= "bloodGroup" class="form-control">
                         
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-md-6">
                        <div class="form-group">
                          <label class="bmd-label-floating">DOB</label>
                          <input type="text" value="<%=donatorDob %>" name= "dob" class="form-control">
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-md-6">
                        <div class="form-group">
                          <label class="bmd-label-floating">Contact No</label>
                          <input type="text" value="<%=donatorContactNo %>" name= "contactNo" pattern=".{10,}" class="form-control">
                        </div>
                      </div>
                      
                    </div>
                    
                    <div class="row ">
	                      <div class="col-md-6">
	                        <div class="form-group">
	                          <label class="bmd-label-floating">Status</label>
	                          <select class="form-control" name ="donatorStatus" id="sel1">
	                          <option value="<%=donatorStatus %>"><%=donatorStatus %></option>
                             <option value="APPROVED">APPROVED</option>
                             <option value="REJECTED">REJECTED</option>
                                                     
                           </select>
	                        </div>
	                      </div>
                 	</div>
                    
                    <button type="submit" class="btn btn-primary pull-right">Update Profile</button>
                    <div class="clearfix"></div>
                  </form>
              <br>
              </div>
                
                
                
                
                
                
                
                
                
                
                
                
                
              </div>
            </div>
            <div class="col-lg-6 col-md-12">
              <div class="card">
                <div class="card-header card-header-warning">
                  <h4 class="card-title">Donation Information</h4>
                 
                </div>
                
                <div class="card-body">
                  <form action="NewDonationServelet" method="POST">
                     <input type="hidden" value="<%=donatorId %>" name= "donator" class="form-control">
                     <input type="hidden" value="<%=userId %>"  name= "user" class="form-control">
                     <input type="hidden" value="<%=donatorBloodGroup %>"  name= "donatorBloodGroup" class="form-control">
                    <div class="row">
                      <div class="col-md-6">
                        <div class="form-group">
                          <label class="bmd-label-floating"> Donation No</label>
                          <input type="text" name= "donationId" class="form-control" required>
                          
                        </div>
                      </div>
                    </div>

                    <div class="row">
                      <div class="col-md-6">
                        <div class="form-group">
                          <label class="bmd-label-floating"> Location</label>
                          <input type="text" name= "location" class="form-control" required>
                        </div>
                      </div>
                    </div>
                    
                    
                    
                    </div>
                    
                    <button type="submit" class="btn btn-primary pull-right">Add</button>
                    <div class="clearfix"></div>
                  </form>
              <div class="card">
                <div class="card-header card-header-warning">
                  <h4 class="card-title">Donation History</h4>
                  
                  
                  
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
			                  <form action="NewDonatorServelet" method="POST">
				                   
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
				                          <input type="text" id="userName" pattern="[0-9]{9}[vxVX]{1}|[0-9]{12}" name="nic" class="form-control" required>
				                        </div>
				                      </div>
                    				</div>
				                    <div class="row ">
				                      <div class="col-md-6">
				                        <div class="form-group">
				                          <label class="bmd-label-floating">Gender</label>
				                          
				                           <div class="form-group">
				                            <select class="form-control" name ="gender" id="sel1" required>
				                              <option value="MALE">MALE</option>
				                              <option value="FEMALE">FEMALE</option>
				                                                      
				                            </select>
				                          </div>
				                          
				                          <div class="row ">
				                      <div class="col-md-6">
				                        <div class="form-group">
				                         <div class="form-group">
				                            <select class="form-control" name ="bloodGroup" id="sel1" required>
				                              <option value="A POSITIVE">A POSITIVE</option>
				                              <option value="A NEGATIVE">A NEGATIVE</option>
				                              <option value="B POSITIVE">B POSITIVE</option>
				                              <option value="B NEGATIVE">B NEGATIVE</option>
				                              <option value="AB POSITIVE">AB POSITIVE</option>
				                              <option value="AB NEGATIVE">AB NEGATIVE</option>
				                              <option value="O POSITIVE">O POSITIVE</option>
				                              <option value="O NEGATIVE">O NEGATIVE</option>
				                             
				                                                      
				                            </select>
				                          </div>
				                        </div>
				                      </div>
                    				</div>
				                          
				                          <div class="row ">
						                      <div class="col-md-12">
						                        <div class="form-group">
						                          <label class="bmd-label-floating">Address</label>
						                          <input type="text" id="userName" name="address" class="form-control" required>
						                        </div>
						                      </div>
		                    				</div>
		                    				
		                    				<div class="row ">
						                      <div class="col-md-6">
						                        <div class="form-group">
						                          <label class="bmd-label-floating">ContactNo</label>
						                          <input type="text" id="userName"  pattern=".{10}" name="contactNo" class="form-control" required>
						                        </div>
						                      </div>
		                    				</div>
				                          
				                          <div class="row ">
						                      <div class="col-md-6">
						                        <div class="form-group">
						                          <label class="bmd-label-floating">DOB</label>
						                          <input type="date" id="userName" name="dob" class="form-control" required>
						                        </div>
						                      </div>
		                    				</div>
		                    				
		                    				 
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
                  <div class="card-body table-responsive">
                  <table class="table table-hover">
                    <thead class="text-warning">
                      
                      <th>DonationId</th>
                      <th>Location </th>
                      <th>Date</th>
                      
                    </thead>
                    <tbody>
                      <%
								try{
								ResultSet resultSet = null;
								DonationDAO dao=new DonationDAO();
								resultSet =dao.getDonatorHistory(donatorId);
								
								String donerDate=null;
								//System.out.println(resultSet.getInt("id"));
								while(resultSet.next()){
									if(resultSet.getString("timeStamp") == null){
									   donerDate = "";
									}else donerDate = (sdf.format(sdf.parse(resultSet.getString("timeStamp"))));
								%>
								<tr>
								
								<td><%=resultSet.getString("donationId") %></td>
								<td><%=resultSet.getString("location") %></td>
								<td><%=donerDate %></td>
								
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
			      
			      <script>
			// Get the modal
			var modal = document.getElementById("myModal");
			
			// Get the button that opens the modal
			
			// Get the <span> element that closes the modal
			var span = document.getElementsByClassName("close")[0];
			
			// When the user clicks the button, open the modal 
			if (<%=donatorNew %>)
			  modal.style.display = "block";
			
			
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
    