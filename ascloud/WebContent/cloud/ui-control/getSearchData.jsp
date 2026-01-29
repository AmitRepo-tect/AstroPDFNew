<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script>	
	$(document).ready(function () {		
		$("input.find-keyword").autocomplete(
			"/cloud/ui-control/search.jsp",{
				delay: 0,
				minChars: 1,
				matchSubset: 1,
				matchContains: 1,
				cacheLength: 10,
				onItemSelect: anotherItem,
				autoFill: false
		    });	
		
		});

		
		function anotherItem(li){			
			//alert("REACHED ANOTHER : "+li.extra[1]);			
			getEvents("SearchBox",li.extra[1]);
			window.location.href = li.extra[0];
		}		
  
		
		$(".sb-icon-close").click(function(){				
			$('#sb-search').hide(100);
			$('#sb-search-d').hide(100);
			$(".ac_results").css("position", "absolute");
		});
		
		$(".sb-icon-search-d").click(function(){
			$('#sb-search-d').show(100);	
			$(".sb-search-input").focus();
			$(".ac_results").css("position", "fixed");
		});
		$(".sb-icon-search").click(function(){
			$('#sb-search').show(100);	
			$(".sb-search-input").focus();
			$(".ac_results").css("position", "fixed");
		});
		
		
  </script>
  

 

     
  