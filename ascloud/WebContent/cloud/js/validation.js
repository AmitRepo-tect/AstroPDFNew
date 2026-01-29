
function myValidation() {    
    if (!CheckName('firstname')) { 
     return false;
    }
    if (document.getElementById("email").value == "") {
        alert("Please enter email address.");
        document.getElementById("email").focus();
        return (false);
    }

    if (echeck(document.getElementById("email").value) == false) {
        document.getElementById("email").focus();
        return (false);
    }
    
    if (!CheckPhone('phone')) {
     return false;
    }
    if ( document.getElementById('suggestion').value == "") {
        alert("Please enter \"message\".");
        document.getElementById("suggestion").focus();
        return (false);
    }
    return (true);
}

function CheckName(id) {
    if (document.getElementById(id).value == "") {
        alert("Please enter a value for the \"Name\" field.");
        document.getElementById(id).focus();
        return (false);
    }    
        return true;
}

function CheckPhone(id) {
    if (document.getElementById(id).value == "") {
        alert("Please enter \"Phone\".");
        document.getElementById(id).focus();
        return (false);
    }
    else {
        if (isNaN(document.getElementById(id).value)) {
            alert("Special characters and alphabets are not allowed in Phone No., Phone number should be numeric.");
            document.getElementById(id).focus();
            return (false);
        }

    }
    return true;
} 
 function Validation() {
        var tmp = "True";

        if (document.getElementById("txtEmail").value == "") {
            alert("Please enter email address.");
            document.getElementById("txtEmail").focus();
            return (false);
        }

        if (echeck(document.getElementById("txtEmail").value) == false) {
            document.getElementById("txtEmail").focus();
            return (false);
        }
    }

    function checkValidation() {

        if (document.getElementById('yourname').value == "") {
            alert("Please enter Your Name.")
            document.getElementById('yourname').focus();
            return (false);
        }
        
        if (document.getElementById('youremail').value == "") {
            alert("Please enter Your Email Address.")
            document.getElementById('youremail').focus();
            return (false);
        }
        
        if (echeck(document.getElementById("youremail").value) == false) {
            document.getElementById("youremail").focus();
            return (false);
        }

        if (document.getElementById('friendname').value == ""){
            alert("Please enter Name of your friend.")
            document.getElementById('friendname').focus();
            return (false);
        }

        if (document.getElementById('friendemail').value == ""){
            alert("Please enter Email address of your friend.")
            document.getElementById('friendemail').focus();
            return (false);
        }

        if (echeck(document.getElementById("friendemail").value) == false) {
            document.getElementById("friendemail").focus();
            return (false);
        } 
        return true;
    
    }   

   function echeck(str) {
        var at = "@"
        var dot = "."
        var lat = str.indexOf(at)
        var lstr = str.length
        var ldot = str.indexOf(dot)

        if (str.indexOf(at) == -1) {
            alert("Please enter valid email address.");
            return (false);
        }

        if (str.indexOf(at) == -1 || str.indexOf(at) == 0 || str.indexOf(at) == lstr) {
            alert("Please enter valid email address.");
            return (false);
        }

        if (str.indexOf(dot) == -1 || str.indexOf(dot) == 0 || str.indexOf(dot) == lstr) {
            alert("Please enter valid email address.");
            return (false);
        }

        if (str.indexOf(at, (lat + 1)) != -1) {
            alert("Please enter valid email address.");
            return (false);
        }

        if (str.substring(lat - 1, lat) == dot || str.substring(lat + 1, lat + 2) == dot) {
            alert("Please enter valid email address.");
            return (false);
        }

        if (str.indexOf(dot, (lat + 2)) == -1) {
            alert("Please enter valid email address.");
            return (false);
        }

        if (str.indexOf(" ") != -1) {
            alert("Please enter valid email address.");
            return (false);
        }

        return true
    }

function openFileOption() {
    document.getElementById("file2").click();
}
