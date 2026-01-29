$(document).ready(function(){
	    $('#datePicker').datepicker({
	    	container:'body',	
	    	format:'d/m/yyyy',
	    	onDraw: function(date) {	    		
	    		$(".datepicker").val(date);
	    	}
	    });
	    
	    $('#ApntDatePicker').datepicker({
	    	container:'body',	
	    	//format:'d/m/yyyy',
	    	onDraw: function(date) {	    		
	    		$(".apntdatepicker").val(date);
	    	}
	    });
	    
	    $('#timePicker').timepicker({
	    	container:'body',	
	    	twelveHour:true,
	    	onSelect:function(hour,minute){	            
	            var printTime = hour + ":"+minute; 	           
	            $(".timepicker").val(printTime);	            
	         }
	    });
	    $('#slotTimePicker').timepicker({
	    	container:'body',	
	    	twelveHour:true,
	    	onSelect:function(hour,minute){	            
	            var printTime = hour + ":"+minute; 	           
	            $(".appointment-time").val(printTime);	            
	         }
	    });
	    
	  });