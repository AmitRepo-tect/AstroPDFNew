<div class="row" id="kundli">
<div class="col s12 l2"></div>
	<div class="col s12 l8">
	<div class="card-panel">
            <h2>ENTER BIRTH DETAILS </h2>
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
                          
                        <div class="row">
                          <div class="col s12 m4">
                          	<a id="aTag" class="btn btn-btm waves-effect amber lighten-4 black-text" href="javascript:toggleAndChangeText();"> [&#43;] Advance Setting </a>
                          </div>			
			 		<div class="col s12 m8" align="right">                        
                          <a class="btn waves-effect white black-text well-css" href="javaScript:void(0)" onclick="findlocation('CurrentLocation');"> <strong> Current Location</strong></a>
				          <a class="btn waves-effect white black-text well-css" href="javaScript:void(0)" onclick="findlocation('CurrentTime');"><strong> Now</strong></a>
				    </div>
				    
                        
			 </div>
			 <div id="divToToggle" style="display: none;">
			 <div class="row">
			 
               <div class="col s4">
               <label for="LongDeg"> Longitude </label>
               <input type="text" name="longdeg"
							 autocomplete="off" title="Longitude Degree" id="LongDeg"
							placeholder="LongDegree" />
							
                          
                          </div>
                          
                          <div class="col s4">
                           <label for="userId" style="visibility:hidden">Place * </label>			
                          <input type="text" name="longmin"
							 autocomplete="off" title="Longitude Minute" id="LongMin"
							placeholder="LongMinute" />
                          </div>
                          
                          <div class="col s4">
                           <label for="userId" style="visibility:hidden">Place * </label>			
                          <select name="longew" id="LongEW" class="browser-default">
								<option value="LongEW">LongEW</option>
								<option value="E"
									>E</option>
								<option value="W"
									>W</option>
						</select>
                          </div>
                          
                     
                          
                        
                          <div class="col s4">
                          <label for="LatDeg"> Latitude </label>
				<input type="text" name="latdeg"
					
					autocomplete="off" id="LatDeg" title="Latitude Degree"
					placeholder="LatDegree" />
                          </div>
                          <div class="col s4">
                           <label for="userId" style="visibility:hidden">Place * </label>			
                          <input type="text" name="latmin" autocomplete="off" id="LatMin" placeholder="LatMinute"/>
                          </div>
                          
                          <div class="col s4">
                           <label for="userId" style="visibility:hidden">Place * </label>			
                          <select name="latns" id="LatNS" class="browser-default">
					<option value="LatNS">LatNS</option>
					<option value="N">N</option>
					<option value="S">S</option>
				</select>
                          </div>
                         
                          <div class="col s6">
                          	<label for="timeZone"> Time Zone </label>
				<input type="text" name="timezone" autocomplete="off" id="timeZone" placeholder="Timezone" />				
                          </div>
                          
         <div class="col s6">
            <label for="ayanamsa"> Ayanamsa</label>
               <select name="ayanamsa" id="ayanamsa"class="browser-default">
					<option value="0">N.C.Lahiri</option>
					<option value="1">K. P. New</option>
					<option value="2">K. P. Old</option>
					<option value="3">B.V.Raman</option>
					<option value="4">K. P. Khullar</option>
					<option value="5">Sayan</option>
				</select>
				
                          </div>
                         
                          <div class="col s6">
                          <label for="charting"> Chart Type </label>
				<select name="charting" title="Chart Style" id="charting" class="browser-default">
					<option value="0">North Indian</option>
					<option value="1">South Indian</option>
				</select>
				
                          </div>
                          
                          <div class="col s6">
                          <label for="kphn"> KP Horary Number
								(1-249)</label>
                           <input type="text" name="kphn"
							size="3" value="0" id="kphn" 
							autocomplete="off" title="KP Horary Number" placeholder="kphn" />
							
                          </div>
                      
                          </div>
                            <div class="row">
                          <div class="col s12 right">
                          <a href="javascript:void(0)" class="orange-dark-color" onclick="getgpsAccuracy();">GPS Accuracy</a>
							<input type="hidden" id="accuracy" name="accuracy" /> <input
							type="hidden" id="languageCode" name="languagecode"
							value=0 /> &nbsp; &nbsp;
                          <a href="javascript:void(0)" class="orange-dark-color right" onclick="fillkphn();">Random KP Number
                          </a>
                          </div>
                          </div>
                      </div>
                      <div class="center">
                            <button class="btn colorct darken-4 waves-effect waves-light center well-css" name="methodName" value="newChartDone" type="submit">Done</button>                            
                            <button class="btn colorct darken-4 waves-effect waves-light center well-css" type="submit" name="methodName" value="newChartDoneAndSave">Done And Save</button>
                          </div>    
                       
                        <input type="hidden" name="timezoneid" id="timezoneid" value="null" />
				
				 </form>
		              
     </div>
	</div>
</div>