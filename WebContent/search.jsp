<jsp:include page="WEB-INF/CommenLayouts/Header.jsp"></jsp:include>
<jsp:include page="WEB-INF/CommenLayouts/NavBar.jsp"></jsp:include>
<jsp:include page="WEB-INF/CommenLayouts/SlideDrower.jsp"></jsp:include>

<div class="content">
        <div class="container-fluid">

        <form class="navbar-form" style="margin:40px;margin-top:0px;" action="SearchServelet" method="POST">
              <div class="input-group no-border">
                <input type="text" value="" class="form-control" name="nic"  placeholder="Search...">
                <input type="submit" value="Search" class="btn btn-white btn-round btn-just-icon">
                  <i class="material-icons">search</i>
                  <div class="ripple-container"></div>
                </button>
              </div>
            </form>
          </div>
        </div>
      </div>



<jsp:include page="WEB-INF/CommenLayouts/Footer.jsp"></jsp:include>
    