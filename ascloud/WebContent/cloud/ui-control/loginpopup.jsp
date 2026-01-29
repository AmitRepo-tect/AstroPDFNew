
<%@page import="com.ojassoft.astrosagecloud.model.ConnectionService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
  <script type="text/javascript">
  $(function(){
   $("#signupSignin").click(function(){
	   //alert("smriti"); 
	   
	   performSigninSignup($("#signinbutton").attr("value"));
   });
   
   $("#signupSignin1").click(function(){
	   
	   var txt = $('#signinwith').text();
	   if(txt == "Sign in with Email")
	   {
		   //alert(1+txt+2);
		   performSigninSignup('signup');
	   }
	   else
	   {
		   //alert(3+txt+4);
	   	   performSigninSignup('login');
	   }
	   
   });
   $("#mainpagetoggle").click(function(){
	   var txt = $('#mainpagetoggle').text();
   		
   		if(txt == "Sign Up")
   		{
   			$("#mainpageheading").html("Sign Up");
   			$("#signinwith").html("Sign up with Email");
   			$("#question").html("Already have an account?");
   			$('#mainpagetoggle').text("Sign In");
   			//$("#signupSignin").attr("id", "signupSignin1");
   		}
   		else 
   		{
   			$("#mainpageheading").html("Sign In");
   			$("#signinwith").html("Sign in with Email");
   			$("#question").html("Don't have UserId?");
   			$('#mainpagetoggle').text("Sign Up");
   			//$("#signupSignin1").attr("id", "signupSignin");
   		}
   });
  });
   
   function performSigninSignup(elmId)
   {
	   //alert(elmId);
	   if(elmId == 'login')
	   {
		   //alert("1111");
		    $("#signinbutton").val("signup");
		   $("#signinbutton").html("Sign Up");
		   $("#signinheading").html("Sign Up");
		   $("#headingtitle").html("Sign Up");
		   $("#question").html("Already have an account?");
		   $("#questionheading").html("Sign In"); 
		   $("#email").attr("placeholder", "Enter Email Id");
		   $("#email").val("");
		   $("#password").val("");
		   $("#uname").val("");
		   $("#forgotUserIdDiv").hide();
		   $("#forgotPwdDiv").hide();
		   $("#errorDiv").html("");
		   $("#errorDiv").hide();
		   $("#nameDiv").show();
	   }

	   else
  		{
  		   //alert("2222");
  		    $("#signinbutton").val("login");
  		   $("#signinbutton").html("Sign In");
  		   $("#signinheading").html("Sign In");
  		   $("#headingtitle").html("Sign In");
  		   $("#question").html("Don't have a User Id?");
  		   $("#questionheading").html("Sign Up"); 
  		 $("#email").attr("placeholder", "Enter Email Id / User Id");
  		$("#email").val("");
		   $("#password").val("");
		   $("#uname").val("");
		   $("#forgotUserIdDiv").show();
		   $("#forgotPwdDiv").show();
		   $("#nameDiv").hide();
  		}
	   
   }
   $(function(){
   $("#signinbutton").click(function(){
	  var isDataValid = validateData();
	  
	  if(isDataValid)
	  {
		  
	  $("#errorDiv").hide();
	    $.ajax({
	        type: "POST",
	        url: "/LoginServlet",
	        crossDomain : true,
	        dataType: 'json',
	        data: { 
	            email: $("#email").val(), 
	            password: $("#password").val(),
	            uname: $("#uname").val(),
	            code: $( this ).val(),
	            savecookie: $("#savecookie").is(':checked')
	            
	        },
	        success: function(result) {
	        	//alert(result.status);
	        	if(result.status == 'success')
	        	{
	        		//alert("1");
	            	//window.location.href = result.msg;
	        		window.location.href = result.msg;
	        	}
	        	else
	        	{
	        		//alert("2");
	        		$("#errorDiv").html(result.msg);
	        		$("#errorDiv").show();
	        	}
	        },
	        error: function(result) {
	        	
	        }
	    });	   
	  }
  });
   });
   
   function validateData()
   {
	   var uname = $("#uname").val();
	   var email = $("#email").val();
	   var passwd = $("#password").val();
	   if($("#uname").is(":visible"))
	   {
		   if (uname == "") {
	           alert('Please enter Name.');
	           document.getElementById('uname').focus();
	           return false;
	       }
	   }
	   if (email == "") {
           alert('Please enter Email / User Id.');
           document.getElementById('email').focus();
           return false;
       }
       if (passwd == "") {
           alert('Please enter Password.')
           document.getElementById('password').focus();
           return false;
       }
       
       return true;
   		
   }
  
</script>  
<div class="modal" id="signin-popup">
    <div class="modal-dialog sign-in">
      <div class="modal-content">
      <a href="javascript:history.back()" class="back"><i class="material-icons">arrow_back</i></a>  
         <button type="button" class="modal-close" data-dismiss="modal"><i class="material-icons">close</i></button>   
         <div class="row signPop"> 
         
         <div class="col l6 s12 sign-left"> 
         <div class="left-bg"></div>
          <div class="side-left"> 
          <h2 class="hide-on-small-only"> Welcome to <span> AstroSage </span> </h2>
          <img src="/images/ganesha-kundli.png" alt="Astrosage Sign In" class="img-fluid h-s" />  
          <img src="/images/gn-ji.png" alt="Astrosage Sign In" class="img-fluid h-s1" />  
          <h2 class="hide-on-med-only"> Welcome to <span> AstroSage </span> </h2>
         
          <div class="text-login hide-on-small-only"> 
          <h4> Why Sign Up?</h4>
          <ul>
			 <li> <span></span>  Get personalized information</li>
			 <li> <span></span>  Save charts (kundli) on cloud</li>
			 <li> <span></span>  Write your notes & comments</li>
			 <li> <span></span>  Anywhere access: mobile & web</li>
			 <li> <span></span>  Access worksheet for analysis</li>
          </ul>
          </div>
          </div>
          
           </div>
           
           <div class="col l6 s12 sign-right side-r"> 
           
           <div class="dhruvlogin"> 
           <h2 id="signinheading"> Sign In </h2>
           <!--  <p class="l-s"> <span id="headingtitle">Sign In </span></p>-->
           
          <form class="form-horizontal" > 
          <div class="form-group form-cn"> 
          <div id="nameDiv" style="display:none">
          <label for="uname" class="label-control"> Name </label>
          <input type="text" name="uname" id="uname" class="btn-radius form-control" placeholder="Enter your Name" />
          </div>
          <label for="email" class="label-control"> Email </label>
          <input type="text" name="email" id="email" class="btn-radius form-control" placeholder="Enter your email id / UserId" />
          <div id="errorDiv" class="red-text" style="display:none"></div>
          <span class="right" id="forgotUserIdDiv"> <a href="https://www.astrosage.com/forgetuserid.asp">  Forgot UserId? </a>  </span>
                    
          </div>
          <div class="form-group clearfix"> 
          <label for="password" class="label-control"> Password</label>
          <input type="password" name="password" id="password" class="btn-radius form-control" placeholder="Enter your password" />
          <span class="right" id="forgotPwdDiv"> <a href="https://www.astrosage.com/forgetpassword.asp">  Forgot Password? </a>  </span>
          </div>
          
          
          <div class="form-group">
          <div class="center"> <button type="button" id="signinbutton" value="login" class="orange-bg btn-radius btn-sign" >Sign In</button> </div>
          </div>
          <div class="hide-on-small-only">
         <div class="br-set form-group"> </div>
          <div class="form-group ">
          <p class="center"> <b> Or Login with:</b>  </p>
          <div class="row">
         <div class="col-lg-12 col-12 btn-adjust"> 
         <a href="<%=ConnectionService.URL_FB_AUTH%>" class="fb-bg btn-radius"> <img src="images/icons/fb.png"> Facebook  </a>   
          <a href="<%=ConnectionService.URL_GOOGLE_AUTH%>" class="gmail-bg btn-radius"> <img src="images/icons/gmail.png"> Gmail  </a>    
          </div>
          
          </div>
          </div>
          </div> 
          
          <div class="form-group">
           <p class="center text-change">
            <span id="question" class="d-inline">Don't have a User Id?</span> <a href="#" class="d-inline" id="signupSignin"> <b>  <span id="questionheading">Sign Up </span></b></a>
            </p>
           </div>

  </form>

          </div>
          <div class="dhruvscreen">
          <h2 id="mainpageheading"> Sign In </h2>
          <div class="row">
         <div class="col l12 s12">
         <div class="form-group">
         <a href="<%=ConnectionService.URL_FB_AUTH%>" class="fb-bg btn-radius btn-style shadow-btn"> <img src="images/icons/fb.png"> Facebook  </a>
         </div>
         </div>
         <div class="col l12 s12">
         <div class="form-group">
         <a href="<%=ConnectionService.URL_GOOGLE_AUTH%>" class="gmail-bg btn-radius btn-style shadow-btn"> <img src="images/icons/gmail.png"> Google  </a>
         </div>
         </div>
          <div class="col l12 s12">
         <div class="form-group">
         
			<a href="#" class="gray-bg btn-radius btn-style white-text btn-manually shadow-btn" id="signupSignin1"> <span id="signinwith" class="white-text sin-b">Sign in with Email</span> </a>
         </div>
         </div>
          <div class="col l12 s12">
         <div class="form-group">
           
            <p class="center text-change">
            <span id="question" class="d-inline">Don't have a User Id?</span> <a href="#" class="d-inline" id="mainpagetoggle"><b>Sign Up</b></a>
            </p>
           </div>
           </div>
         </div>
         <div class="text-login hide-on-med-only"> 
          <h4> Why Sign Up?</h4>
          <ul>
			 <li> <span></span>  Get personalized information</li>
			 <li> <span></span>  Save charts (kundli) on cloud</li>
			 <li> <span></span>  Write your notes & comments</li>
			 <li> <span></span>  Anywhere access: mobile & web</li>
			 <li> <span></span>  Access worksheet for analysis</li>
          </ul>
          </div>
         </div>

           </div>
         </div>
       </div>
       
     </div>
   </div>
   
   <style>
   input::placeholder {
	padding-left:15px; 
  }
  input {
   padding-left: 15px;
  }
  input:not([type]):focus:not([readonly]), input[type="text"]:not(.browser-default):focus:not([readonly]), input[type="password"]:not(.browser-default):focus:not([readonly]), input[type="email"]:not(.browser-default):focus:not([readonly]), input[type="url"]:not(.browser-default):focus:not([readonly]), input[type="time"]:not(.browser-default):focus:not([readonly]), input[type="date"]:not(.browser-default):focus:not([readonly]), input[type="datetime"]:not(.browser-default):focus:not([readonly]), input[type="datetime-local"]:not(.browser-default):focus:not([readonly]), input[type="tel"]:not(.browser-default):focus:not([readonly]), input[type="number"]:not(.browser-default):focus:not([readonly]), input[type="search"]:not(.browser-default):focus:not([readonly]), textarea.materialize-textarea:focus:not([readonly]) {
   border-bottom: 1px solid #ddd !important;
   box-shadow: none !important;
  }
   </style>
   
<script>
       $(document).ready(function () {
           $(".btn-manually").click(function () {
               $(".dhruvlogin").slideDown(300);
               $(".back").addClass("icon_back");
               $(".dhruvscreen").hide();
               $(".dhruvscreen").addClass("form-set");
               $(".sign-right").removeClass("side-r");
               
               
           });
           $(".back").click(function () {
        	   $(".dhruvscreen").removeClass("form-set");
        	   $(".dhruvlogin").hide();
        	   $(".back").removeClass("icon_back");        	   
               $(".dhruvscreen").slideDown();  
               $(".sign-right").addClass("side-r");
                              
               
              
              
           });
       });
   </script>           