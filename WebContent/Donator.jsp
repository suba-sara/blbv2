<jsp:include page="WEB-INF/CommenLayouts/Header.jsp"></jsp:include>
<jsp:include page="WEB-INF/CommenLayouts/NavBar.jsp"></jsp:include>
<jsp:include page="WEB-INF/CommenLayouts/SlideDrower.jsp"></jsp:include>

<%@page import="java.sql.ResultSet"%>
<%@page import="DAO.DonatorDAO"%>
<%@page import="Domain.Donator"%>
<%@page import="java.util.List"%>

<div class="content">
        <div class="container-fluid">
          <div class="row">
            <div class="col-md-12">
              <div class="card">
                <div class="card-header card-header-primary">
                  <h4 class="card-title ">Donators </h4>
                  
        
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
                          Contact No
                        </th>
                         <th>
                          Address
                        </th>
                        <th>
                          
                        </th>
                      </thead>
                      <tbody>
                      
                     
							
							<%
								try{
								ResultSet resultSet = null;
								DonatorDAO dao=new DonatorDAO();
								resultSet =dao.getAllDonator();
								  
								 //System.out.println(resultSet.getInt("id"));
								while(resultSet.next()){
								%>
								<tr>
								<td><%=resultSet.getInt("id") %></td>
								<td><%=resultSet.getString("name") %></td>
								<td><%=resultSet.getString("nic") %></td>
								<td><%=resultSet.getString("contactNo") %></td>
								<td><%=resultSet.getString("address") %></td>
								<td>
								<form class="navbar-form" style="margin:40px;margin-top:0px;" action="SearchServelet" method="POST">
					                <input type="hidden" value="<%=resultSet.getString("nic") %>" class="form-control" name="nic" >
					                <input type="submit" value="View" class="btn btn-primery">
					               
					            </form>
					            </td>
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






<jsp:include page="WEB-INF/CommenLayouts/Footer.jsp"></jsp:include>
    