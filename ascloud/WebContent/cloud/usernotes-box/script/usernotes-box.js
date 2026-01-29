 $(function() {
 showComments();
/*               
        $("#show-usernotes").click(function() {
            $(".usernotesdiv").animate({ "bottom": "0" }, "fast");
            $("#show-usernotes").animate({ "bottom": "-60" }, "fast");
        });
        $("#close-usernotes").click(function() {
            $("#show-usernotes").animate({ "bottom": "-2" }, "fast");
            $(".usernotesdiv").animate({ "bottom": "-300" }, "fast");
        });
        $("#close-usernotes").click(function() {
            $(".usernotesdiv").hide("fast", function() {

            });
        });
        $("#show-usernotes").click(function() {
            $(".usernotesdiv").show("fast");
        });
        $(function() {
            $("#draggable").draggable();
        });
        $("#cancel-usernotes").click(function() {
        $(".usernotesdiv").hide("fast");
        $("#show-usernotes").animate({ "bottom": "-2" }, "fast");        
        });*/
 
 dragElement(document.getElementById("notesModal"));
 $('#notesModal').modal({
     dismissible: true, 
     ready: function(modal, trigger) {      
       $("body").removeAttr("style");      
     },
     complete: function() {     	
    	 } 
   }
 );
 
    });
    function removeHTML() {
        $('#usertext').html('');
    }
    function showComments() {
    	
    	$.get('control/user-notes.jsp', function(data) {
            if (data == "0")
                $('#usertext').html('<%=GetString("ERROR_IN_UPDATING_COMMENTS_PLEASE_TRY_AGAIN") %>');
            else if (data == "2") {
                //Do nothing, /cloud/usernotes-box/comment.asp handle this 
            }
            else {
                document.getElementById('comments').value = data.trim();
                limitcharById('comments', 'remainchar', 4000);     //counting remaining characters for comment-box        
            }
        });
    }
    
    
    
    
    
  //Make the DIV element draggagle:   
   

    function dragElement(elmnt) {
      var pos1 = 0, pos2 = 0, pos3 = 0, pos4 = 0;
      if (document.getElementById(elmnt.id + "Header")) {
        /* if present, the header is where you move the DIV from:*/
        document.getElementById(elmnt.id + "Header").onmousedown = dragMouseDown;
      } else {
        /* otherwise, move the DIV from anywhere inside the DIV:*/
        elmnt.onmousedown = dragMouseDown;
      }

      function dragMouseDown(e) {
        e = e || window.event;
        e.preventDefault();
        // get the mouse cursor position at startup:
        pos3 = e.clientX;
        pos4 = e.clientY;
        document.onmouseup = closeDragElement;
        // call a function whenever the cursor moves:
        document.onmousemove = elementDrag;
      }

      function elementDrag(e) {
        e = e || window.event;
        e.preventDefault();
        // calculate the new cursor position:
        pos1 = pos3 - e.clientX;
        pos2 = pos4 - e.clientY;
        pos3 = e.clientX;
        pos4 = e.clientY;
        // set the element's new position:
        elmnt.style.top = (elmnt.offsetTop - pos2) + "px";
        elmnt.style.left = (elmnt.offsetLeft - pos1) + "px";
      }

      function closeDragElement() {
        /* stop moving when mouse button is released:*/
        document.onmouseup = null;
        document.onmousemove = null;
      }
    }
