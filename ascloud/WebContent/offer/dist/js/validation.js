function formValidation() {

    if (document.getElementById('name').value == "") {
        alert('Please enter a value for the name field.');
        document.getElementById('name').focus();
        return (false);
    }

    if (document.getElementById('day').value == "") {
        alert('Please enter a value for the day field.');
        document.getElementById('day').focus();
        return (false);
    }
    else {
        if (isNaN(document.getElementById('day').value)) {
            alert('Please enter only digit characters in the day field.');
            document.getElementById('day').focus();
            return (false);
        } else {
            if (document.getElementById('day').value < 1 || document.getElementById('day').value > 31) {
                alert('The value for day should be between 1 and 31.');
                document.getElementById('day').focus();
                return (false);
            }
        }
    }

    if (document.getElementById('month').value == "") {
        alert('Please enter a value for the month field.');
        document.getElementById('month').focus();
        return (false);
    }
    else {
        if (isNaN(document.getElementById('month').value)) {
            alert('Please enter only digit characters in the month field');
            document.getElementById('month').focus();
            return (false);
        }
        else {
            if (document.getElementById('month').value < 1 || document.getElementById('month').value > 12) {
                alert('The value for month should be between 1 and 12.');
                document.getElementById('month').focus();
                return (false);
            }
        }
    }

    if (document.getElementById('year').value == "") {
        alert('Please enter a value for the year field.');
        document.getElementById('year').focus();
        return (false);
    }
    else {
        if (isNaN(document.getElementById('year').value)) {
            alert('Please enter only digit characters in the year field.');
            document.getElementById('year').focus();
            return (false);
        }
        else {
            if (document.getElementById('year').value < 1 || document.getElementById('year').value > 9999) {
                alert('The value for day should be between 1 and 9999');
                document.getElementById('year').focus();
                return (false);
            }
        }
    }

    if (document.getElementById('hrs').value == "") {
        alert('Please enter a value for the hour field');
        document.getElementById('hrs').focus();
        return (false);
    }
    else {
        if (isNaN(document.getElementById('hrs').value)) {
            alert('Please enter only digit characters in the hour field');
            document.getElementById('hrs').focus();
            return (false);
        } else {
            if (document.getElementById('hrs').value < 0 || document.getElementById('hrs').value > 23) {
                alert('The value for hour should be between 0 and 23.');
                document.getElementById('hrs').focus();
                return (false);
            }
        }
    }

    if (document.getElementById('min').value == "") {
        alert('Please enter a value for the minute field.');
        document.getElementById('min').focus();
        return (false);
    }
    else {
        if (isNaN(document.getElementById('min').value)) {
            alert('Please enter only digit characters in the minute field.');
            document.getElementById('min').focus();
            return (false);
        }
        else {
            if (document.getElementById('min').value < 0 || document.getElementById('min').value > 59) {
                alert('The value for minute should be between 0 and 59.');
                document.getElementById('min').focus();
                return (false);
            }
        }
    }
    if (document.getElementById('ampm').value == "") {
        alert('Please enter a value for the second field.');
        document.getElementById('ampm').focus();
        return (false);
    }
    
    if (document.getElementById('place').value == "") {
        alert('Please enter place.');
        document.getElementById('place').focus();
        return (false);
    }
   
    if (document.getElementById('place').value.length < 3) {
        alert('Please enter at 3 starting characters of place.');
        document.getElementById('place').focus();
        return (false);
    }
  
   
    else {
        //document.forms["getHoroForm"].action = "/offer/big-horo-result.asp";        
    }
    return (true);
}

$(function () {
    $('#getHoro').click(function () {     
        $('#getHoroForm').submit();
    });
});