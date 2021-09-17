<jsp:include page="WEB-INF/CommenLayouts/Header.jsp"></jsp:include>
<jsp:include page="WEB-INF/CommenLayouts/NavBar.jsp"></jsp:include>
<jsp:include page="WEB-INF/CommenLayouts/SlideDrower.jsp"></jsp:include>
<%@page import="java.sql.ResultSet"%>
<%@page import="DAO.DonationDAO"%>
<%@page import="Domain.Donation"%>
<%@page import="java.util.List"%>


<%
int aPos = 0;		
int aNeg = 0;	
int bPos = 0;		
int bNeg = 0;
int abPos = 0;		
int abNeg = 0;
int oPos = 0;		
int oNeg = 0;

try{
	ResultSet resultSet = null;
	DonationDAO dao=new DonationDAO();
	resultSet =dao.getDonatuionStat();
	  
	 //System.out.println(resultSet.getInt("id"));
	while(resultSet.next()){
		if (resultSet.getString("bloodGroup").equals("A POSITIVE")) aPos=resultSet.getInt("idCount");
		if (resultSet.getString("bloodGroup").equals("A NEGATIVE")) aNeg=resultSet.getInt("idCount");
		
		if (resultSet.getString("bloodGroup").equals("B POSITIVE")) bPos=resultSet.getInt("idCount");
		if (resultSet.getString("bloodGroup").equals("B NEGATIVE")) bNeg=resultSet.getInt("idCount");
		
		if (resultSet.getString("bloodGroup").equals("AB POSITIVE")) abPos=resultSet.getInt("idCount");
		if (resultSet.getString("bloodGroup").equals("AB NEGATIVE")) abNeg=resultSet.getInt("idCount");
		
		if (resultSet.getString("bloodGroup").equals("O POSITIVE")) oPos=resultSet.getInt("idCount");
		if (resultSet.getString("bloodGroup").equals("O NEGATIVE")) oNeg=resultSet.getInt("idCount");
		
			
		
	}
	
	} catch (Exception e) {
	e.printStackTrace();
	}
	%>
	
	
	
<div class="content">
        <div class="container-fluid">

        <div class="row">
            <div class="col-lg-3 col-md-6 col-sm-6">
              <div class="card card-stats">
                <div class="card-header card-header-warning card-header-icon">
                  
                  <p class="card-category">A POSITIVE</p>
                  <h3 class="card-title"><%=aPos %></h3>
                  <p class="card-category">A NEGATIVE</p>
                  <h3 class="card-title"><%=aNeg %></h3>
                </div>
                
              </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-6">
              <div class="card card-stats">
                <div class="card-header card-header-warning card-header-icon">
                  
                  <p class="card-category">B POSITIVE</p>
                  <h3 class="card-title"><%=bPos %></h3>
                  <p class="card-category">B NEGATIVE</p>
                  <h3 class="card-title"><%=bNeg %></h3>
                </div>
              </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-6">
              <div class="card card-stats">
                <div class="card-header card-header-warning card-header-icon">
                  
                  <p class="card-category">AB POSITIVE</p>
                  <h3 class="card-title"><%=abPos %></h3>
                  <p class="card-category">AB NEGATIVE</p>
                  <h3 class="card-title"><%=abNeg %></h3>
                </div>
              </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-6">
              <div class="card card-stats">
                <div class="card-header card-header-warning card-header-icon">
                  
                  <p class="card-category">O POSITIVE</p>
                  <h3 class="card-title"><%=oPos %></h3>
                  <p class="card-category">O NEGATIVE</p>
                  <h3 class="card-title"><%=oNeg %></h3>
                </div>
              </div>
            </div>
          </div>

          <div class="row">
            <div class="col-md-8">
              <div class="card card-chart">
                <div class="card-header card-header-success">
                  <div class="ct-chart" id="dailySalesChart">Blood Bank Status</div>
                </div>
                <div class="card-body">

                <canvas id="myChart" width="200" height="75"></canvas>

                  </div>
                <div class="card-footer">
                  <div class="stats">
                    <i class="material-icons">access_time</i>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md-4">
              <div class="card card-chart">
                <div class="card-header card-header-warning">
                  <div class="ct-chart" id="websiteViewsChart">Blood Bank Status
</div>
                </div>
                <div class="card-body">
                <canvas id="myChart0" width="200" height="170"></canvas>

                </div>
                <div class="card-footer">
                  <div class="stats">
                    <i class="material-icons">access_time</i>
                  </div>
                </div>
              </div>
            </div>
            
          </div>
          
        </div>
      </div>
      
  
      <script>
var ctx = document.getElementById('myChart').getContext('2d');
var myChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: ['A POSITIVE', 'A NEGATIVE', 'B POSITIVE', 'B NEGATIVE', 'AB POSITIVE', 'AB NEGATIVE', 'O POSITIVE', 'O NEGATIVE'],
        datasets: [{
            label: '# of Votes',
            data: [ <%=aPos %>, <%=aNeg %>, <%=bPos %>, <%=bNeg %>, <%=abPos %>, <%=abNeg %>, <%=oPos %>, <%=oNeg %>],
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero: true
                }
            }]
        }
    }
});
</script>

<script>
var ctx = document.getElementById('myChart0').getContext('2d');
var myChart = new Chart(ctx, {
    type: 'pie',
    data: {
    	labels: ['A POSITIVE', 'A NEGATIVE', 'B POSITIVE', 'B NEGATIVE', 'AB POSITIVE', 'AB NEGATIVE', 'O POSITIVE', 'O NEGATIVE'],
        datasets: [{
            label: '# of Votes',
            data: [ <%=aPos %>, <%=aNeg %>, <%=bPos %>, <%=bNeg %>, <%=abPos %>, <%=abNeg %>, <%=oPos %>, <%=oNeg %>],
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero: true
                }
            }]
        }
    }
});
</script>



<jsp:include page="WEB-INF/CommenLayouts/Footer.jsp"></jsp:include>
    