var name;

function Validation(theForm) {
    alert(two.name1.value);

    if (theForm.name1.value == "")
    {
        alert("Please enter a value for the \"Name\" field.");
        theForm.name1.focus();
        return (false);
    }

    if(theForm.day1.selectedIndex == 0)
    {
        alert("Please select the day.");
        theForm.day1.focus();
        return (false);
    }

    if(theForm.month1.selectedIndex == 0)
    {
        alert("Please select the month.");
        theForm.month1.focus();
        return (false);
    }

    if (theForm.year1.value == "")
    {
        alert("Please enter year.");
        theForm.year1.focus();
        return (false);
    } 

    var checkOK = "0123456789-!";
    var checkStr = theForm.year1.value;
    var allValid = true;
    var decPoints = 0;
    var allNum = "";
    
    for (i = 0;  i < checkStr.length;  i++)
    {
        ch = checkStr.charAt(i);
        for (j = 0;  j < checkOK.length;  j++)
        
        if (ch == checkOK.charAt(j))
            break;
        
        if (j == checkOK.length)
        {
            allValid = false;
            break;
        }
        
        if (ch != ",")
            allNum += ch;
    }

    if (!allValid)
    {
        alert("Please enter only digit characters in the Year field.");
        theForm.year1.focus();
        return (false);
    }
    
    if (!isIntegerNumber(theForm.year1.value) || theForm.year1.value < 1 || theForm.year1.value > 9999)
    {
        alert("The value for \"Year\" should be between 1 and 9999.");
        theForm.year1.focus();
        return (false);
    }

    if(theForm.hrs1.selectedIndex == 0)
    {
        alert("Please select the hrs.");
        theForm.hrs1.focus();
        return (false);
    }

    if(theForm.min1.selectedIndex == 0)
    {
        alert("Please select the min.");
        theForm.min1.focus();
        return (false);
    }

    if(theForm.sec1.selectedIndex == 0)
    {
        alert("Please select the sec.");
        theForm.sec1.focus();
        return (false);
    }

    if (theForm.dst1.value == "") {
        alert("Please enter DST.");
        theForm.dst1.focus();
        return (false);
    }

    if ((!isIntegerNumber(theForm.dst1.value) || theForm.dst1.value < -5 || theForm.dst1.value > 5)) {
        alert("The value for \"DST\" should be between -5 and 5.");
        theForm.dst1.focus();
        return (false);
    }

    if(theForm.place1.value == "")
    {
        alert("Please enter Place.");
        theForm.place1.focus();
        return (false);
    }
    
    if(theForm.place1.value.length < 3)
    {
        alert("Enter at least three first characters of city name.");
        theForm.place1.focus();
        return (false);
    }
    
    if ((!isIntegerNumber(theForm.LongDeg1.value) || theForm.LongDeg1.value < 0 || theForm.LongDeg1.value >= 180))
    {
        alert("The value for \"Longitude Degree\" should be between 0 and 179.");
        theForm.LongDeg1.focus();
        return (false);
    }

    if ((!isIntegerNumber(theForm.LongMin1.value) || theForm.LongMin1.value < 0 || theForm.LongMin1.value >= 60))
    {
        alert("The value for \"Longitude Minute\" should be between 0 and 59.");
        theForm.LongMin1.focus();
        return (false);
    }
    
    if ((!isIntegerNumber(theForm.LatDeg1.value) || theForm.LatDeg1.value < 0 || theForm.LatDeg1.value >= 90))
    {
        alert("The value for \"Latitude Degree\" should be between 0 and 89.");
        theForm.LatDeg1.focus();
        return (false);
    }

    if ((!isIntegerNumber(theForm.LatMin1.value) || theForm.LatMin1.value < 0 || theForm.LatMin1.value >= 60))
    {
        alert("The value for \"Latitude Minute\" should be between 0 and 59.");
        theForm.LatMin1.focus();
        return (false);
    }

    if(theForm.timeZone1.value == "")
    {
        alert("Please enter Time Zone.");
        theForm.timeZone1.focus();
        return (false);
    }

    if (!isRealNumber(theForm.timeZone1.value) || theForm.timeZone1.value < -12.0 || theForm.timeZone1.value > 13.0)
    {
        alert("The value for \"Time Zone\" should be between -12.00 and 13.00.");
        theForm.timeZone1.focus();
        return (false);
    }
    
    return (true);
}


function isIntegerNumber(NumberToTest) 
{
    var IsFound = /^-?\d+$/.test(NumberToTest);
    return (IsFound);
}

function isRealNumber(NumberToTest) 
{
    var IsFound = /^(\+|-)?[0-9][0-9]*(\.[0-9]*)?$/.test(NumberToTest);
    return (IsFound);
}

