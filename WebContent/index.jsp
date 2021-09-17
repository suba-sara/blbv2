<jsp:include page="WEB-INF/CommenLayouts/Header.jsp"></jsp:include>
<jsp:include page="WEB-INF/CommenLayouts/NavBar.jsp"></jsp:include>
<jsp:include page="WEB-INF/CommenLayouts/SlideDrower.jsp"></jsp:include>

<div class="content">
        <div class="container-fluid">


        <div class="card">
                <div class="card-header card-header-primary">
                  <h1 class="col text-center" >Welcome</h1> <br>

                  <img class="col text-center" style="margin-left:200px;margin-right:100px; width:500px;" src="http://www.nbts.health.gov.lk/images/logo.png">

                  <h3 class="col text-center">Blood Bank Online System</h3>

                  
                </div>
                <div class="card-body col text-center">
                  <form action="AuthServelet" method="POST">
                   
                    <div class="row col text-center">
                      <div class="col-md-6 col text-center">
                        <div class="form-group">
                          <label class="bmd-label-floating">NIC</label>
                          <input type="text" id="userName" name="userName" class="form-control" required>
                        </div>
                      </div>
                      
                    </div>
                    <div class="row ">
                      <div class="col-md-6">
                        <div class="form-group">
                          <label class="bmd-label-floating">Password</label>
                          <input type="password" id="password" name ="password" class="form-control" required>
                        </div>
                      </div>
                      
                    </div>
                    
                    
                    
                    <button type="submit" class="btn btn-primary ">Login</button>
                    <div class="clearfix"></div>
                  </form>
                </div>
              </div>


          
        </div>
      </div>
      







<jsp:include page="WEB-INF/CommenLayouts/Footer.jsp"></jsp:include>
    