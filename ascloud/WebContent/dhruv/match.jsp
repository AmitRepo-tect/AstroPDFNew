<div class="row" id="match">
<div class="col s2"></div>
	<div class="col s12 l4">
	<div class="card-panel">
            <h2>ENTER BOY DETAILS</h2>
            <a href="" class="btn btn-small right amber black-text">OPEN CHART</a>
     
      <form class="das-form mrt-30" name="newchart" id="UserLoginForm" action="newchart-session.asp" method="post" onsubmit="return formValidation();">
                      <div class="row">
                        <div class="col s6">
                        <label for="Name">Name </label>
                          <input type="text" placeholder="Name" name="name" id="Name" /> 
                          
                        </div>
                        
                        <div class="col s6">
                         <label for="sex">Gender </label>
                          <select name="sex" id="sex" class="browser-default">                            
                            <option value="male" selected>Male</option>
                            <option value="female">Female </option>
                          </select>
                         
                        </div>
                    
                        <div class="col s4">
                           <label for="date">Day</label>
			              <input type="text" placeholder="Day" name="day" id="Day" title="Day" value="14" />
			             
			              </div> 
			              <div class="col s4">
			               <label for="date">Month</label>
			              <input type="text" placeholder="Month" name="month" id="Month" title="Month" value="1" />
			             
			              </div>
			              <div class="col s4">
			               <label for="date">Year</label>
						  <input type="text" placeholder="Year" name="year" id="Year" title="Year" value="2020" />
                         
                        </div>
                        
                    
                      <div class="col s4">
                       <label for="Hrs">Hour</label>
                          <input type="text" placeholder="Hour" name="hrs" id="Hrs" title="Hour" value="15" />
                         
                          </div>
                          <div class="col s4">
                           <label for="Min">Minute</label>
			              <input type="text" placeholder="Minute" name="min" id="Min" title="Minute" value="10" />
			             
			              </div>
			              <div class="col s4">
			              <label for="Sec">Second</label>
			              <input type="text" placeholder="Second" name="sec" id="Sec" title="Second" value="30" />
			              
                          </div>
                       
                          <div class="col s12">
                          <label for="place">Place  (Min. 3 characters)</label>  
                          <input type="text" placeholder="Place" name="place" value="" id="place" maxlength="50" />
                                                  
                          <span id="dstval" class="red-text"></span>
                          </div>
                          </div>
                          
                       
				 </form>
				           
      
		 
		              
     </div>
	</div>
	
	<div class="col s12 l4">
	<div class="card-panel">
            <h2>ENTER GIRL DETAILS</h2>
            <a href="" class="btn btn-small right amber black-text">OPEN CHART</a>
     
      <form class="das-form mrt-30" name="newchart" id="UserLoginForm" action="newchart-session.asp" method="post" onsubmit="return formValidation();">
                      <div class="row">
                        <div class="col s6">
                        <label for="Name">Name </label>
                          <input type="text" placeholder="Name" name="name" id="Name" /> 
                          
                        </div>
                        
                        <div class="col s6">
                         <label for="sex">Gender </label>
                          <select name="sex" id="sex" class="browser-default">                            
                            <option value="male" selected>Male</option>
                            <option value="female">Female </option>
                          </select>
                         
                        </div>
                    
                        <div class="col s4">
                           <label for="date">Day</label>
			              <input type="text" placeholder="Day" name="day" id="Day" title="Day" value="14" />
			             
			              </div> 
			              <div class="col s4">
			               <label for="date">Month</label>
			              <input type="text" placeholder="Month" name="month" id="Month" title="Month" value="1" />
			             
			              </div>
			              <div class="col s4">
			               <label for="date">Year</label>
						  <input type="text" placeholder="Year" name="year" id="Year" title="Year" value="2020" />
                         
                        </div>
                    
                      <div class="col s4">
                       <label for="Hrs">Hour</label>
                          <input type="text" placeholder="Hour" name="hrs" id="Hrs" title="Hour" value="15" />
                         
                          </div>
                          <div class="col s4">
                           <label for="Min">Minute</label>
			              <input type="text" placeholder="Minute" name="min" id="Min" title="Minute" value="10" />
			             
			              </div>
			              <div class="col s4">
			              <label for="Sec">Second</label>
			              <input type="text" placeholder="Second" name="sec" id="Sec" title="Second" value="30" />
			              
                          </div>
                     
                          <div class="col s12">
                          <label for="place">Place  (Min. 3 characters)</label>  
                          <input type="text" placeholder="Place" name="place" value="" id="place" maxlength="50" />
                                                  
                          <span id="dstval" class="red-text"></span>
                          </div>
                          </div>
                          
				
				 </form>
				           
      
		 
		              
     </div>
	</div>
	<div class="col s12">
	  
                      <div class="center">
                            <button class="btn colorct darken-4 waves-effect waves-light center well-css btn-lg" name="methodName" value="newChartDone" type="submit">MATCH NOW</button>                            
                           
                          </div>   
                          </div> 
</div>