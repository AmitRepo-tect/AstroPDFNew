<%
'************************************'Validation fOr the Boy**************************************
    
    If request("name1") = "" Then
        Response.Redirect("matchmaking-error.asp?msg=Please enter value for the name field of the boy.")
        Response.end
    End If
    
    If dayboy = "" Then
        Response.Redirect("matchmaking-error.asp?msg=Please enter value for the day field of the boy.")
        Response.end
    End If
    
    If Not(IsNumeric(dayboy)) then
        Response.Redirect("matchmaking-error.asp?msg=Please enter only digit characters in the day field of the boy.")
        Response.end
    End If
    
    If dayboy < 1 Or dayboy > 31 Then
       Response.Redirect("matchmaking-error.asp?msg=Please enter day value between 1 to 31 of the boy.")
       Response.end
    End If
    
    If monthboy = "" Then
        Response.Redirect("matchmaking-error.asp?msg=Please enter value for month field of the boy.")
        Response.end
    End If
    
    If Not(IsNumeric(monthboy)) Then
        Response.Redirect("matchmaking-error.asp?msg=Please enter only digit characters in the month field of the boy.")
        Response.end
    End If
    
    If monthboy < 1 Or monthboy > 12 Then
       Response.Redirect("matchmaking-error.asp?msg=Please enter month value between 1 to 12 of the boy.")
       Response.end
    End If

    If yearboy = "" Then
        Response.Redirect("matchmaking-error.asp?msg=Please enter value for the year field of the boy.")
        Response.end
    End If

    If Not(IsNumeric(yearboy)) Then
        Response.Redirect("matchmaking-error.asp?msg=Please enter only digit characters in the year field of the boy.")
        Response.end
    End If
    
    If yearboy < 1 And yearboy > 9999 Then
        Response.Redirect("matchmaking-error.asp?msg=Please enter year value between 1 to 9999 of the boy.")
        Response.end
    End If
    
    If hrsboy = "" Then
        Response.Redirect("matchmaking-error.asp?msg=Please enter value for the hours field of the boy.")
        Response.end
    End If
    
    If Not(IsNumeric(hrs1)) Then
        Response.Redirect("matchmaking-error.asp?msg=Please enter only digit characters in the hours field of the boy.")
        Response.end
    End If
    
    If hrsboy < 0 Or hrsboy > 24 Then
       Response.Redirect("matchmaking-error.asp?msg=Please enter the hours value between 0 to 23 of the boy.")
       Response.end
    End If
    
    If minboy = "" Then
        Response.Redirect("matchmaking-error.asp?msg=Please enter value for the minute field of the boy.")
        Response.end
    End If
    
    If Not(IsNumeric(minboy)) Then
        Response.Redirect("matchmaking-error.asp?msg=Please enter only digit characters in minute field of the boy.")
        Response.end
    End If
    
    If minboy < 0 Or minboy > 60 Then
       Response.Redirect("matchmaking-error.asp?msg=Please enter minute value between 0 to 59 of the boy.")
       Response.end
    End If
    
    If secboy = "" Then
        Response.Redirect("matchmaking-error.asp?msg=Please enter value for the second field of the boy.")
        Response.end
    End If
    
    If Not(IsNumeric(secboy)) Then
        Response.Redirect("matchmaking-error.asp?msg=Please enter only digit characters in second field of the boy.")
        Response.end
    End If
    
    If secboy < 0 Or secboy > 60 Then
       Response.Redirect("matchmaking-error.asp?msg=Please enter second value between 0 to 60 of the boy.")
       Response.end
    End If
    
    If placeboy = "" Then
        Response.Redirect("matchmaking-error.asp?msg=Please enter place of the boy.")
        Response.end
    End If
    
    If dstboy = "" Then
       Response.Redirect("matchmaking-error.asp?msg=Please enter dst of the boy.")
       Response.end
    End If
    
    If Not(IsNumeric(dstboy)) Then
        Response.Redirect("matchmaking-error.asp?msg=Please enter digit in dst field of the boy.")
        Response.end
    End If

    If Cdbl(dstboy) < -5 Or Cdbl(dstboy) > 5 Then
       Response.Redirect("matchmaking-error.asp?msg=Please enter value for dst between -5 to 5 of the boy.")
       Response.end
    End If
    
    If LongDegboy = "" Then
       Response.Redirect("matchmaking-error.asp?msg=Please enter value for longitude degree of the boy.")
       Response.end
    End If
    
    If Not(IsNumeric(LongDegboy)) Then
        Response.Redirect("matchmaking-error.asp?msg=Please enter only digit characters in longitude degree of the boy.")
        Response.end
    End If

    If LongDegboy < 0 Or LongDegboy >= 180 Then
       Response.Redirect("matchmaking-error.asp?msg=Please enter longitude degree of the boy between 0 to 179.")
       Response.end
    End If
    
    If LongMinboy = "" Then
       Response.Redirect("matchmaking-error.asp?msg=Please enter longitude minute of the boy.")
       Response.end
    End If

    If Not(IsNumeric(LongMinboy)) Then
        Response.Redirect("matchmaking-error.asp?msg=Please enter digit characters in longitude minute of the boy.")
        Response.end
    End If

    If LongMinboy < 0 Or LongMinboy >= 60 Then
       Response.Redirect("matchmaking-error.asp?msg=Please enter longitude minute of the boy between 0 to 59.")
       Response.end
    End If
    
    If LongEWboy = "" Then
       Response.Redirect("matchmaking-error.asp?msg=Please enter longitude second of the boy.")
       Response.end
    End If

    If LongEWboy <> "E" And LongEWboy <> "W" Then
       Response.Redirect("matchmaking-error.asp?msg=Please enter longitude direction of the boy either E Or W.")
       Response.end
    End If
    
    If LatDegboy = "" Then
       Response.Redirect("matchmaking-error.asp?msg=Please enter latitude degree of the boy.")
       Response.end
    End If
    
    If Not(IsNumeric(LatDegboy)) Then
        Response.Redirect("matchmaking-error.asp?msg=Please enter digit characters in latitude degree of the boy.")
        Response.end
    End If

    If LatDegboy < 0 Or LatDegboy >= 90 Then
       Response.Redirect("matchmaking-error.asp?msg=Please enter latitude degree of the boy between 0 to 89.")
       Response.end
    End If
    
    If LatMinboy = "" Then
       Response.Redirect("matchmaking-error.asp?msg=Please enter latitude minute of the boy.")
       Response.end
    End If

    If Not(IsNumeric(LatMinboy)) Then
        Response.Redirect("matchmaking-error.asp?msg=Please enter digit characters in latitude minute of the boy.")
        Response.end
    End If

    If LatMinboy < 0 Or LatMinboy >= 60 Then
       Response.Redirect("matchmaking-error.asp?msg=Please enter latitude minute of the boy between 0 to 59.")
       Response.end
    End If
    
    If LatNSboy = "" Then
       Response.Redirect("matchmaking-error.asp?msg=Please enter latitude second of the boy.")
       Response.end
    End If

    If LatNSboy <> "N" and LatNSboy <> "S" Then
       Response.Redirect("matchmaking-error.asp?msg=Please enter latitude direction of the boy either N Or S.")
       Response.end
    End If

    If timeZoneboy = "" Then
       Response.Redirect("matchmaking-error.asp?msg=Please enter value for time zone of the boy.")
       Response.end
    End If

    If Not(IsNumeric(timeZoneboy)) Then
        Response.Redirect("matchmaking-error.asp?msg=Please enter digit characters in time zone of the boy.")
        Response.end
    End If

    If Cdbl(timeZoneboy) < -12.0 Or Cdbl(timeZoneboy) > 17.0 Then
       Response.Redirect("matchmaking-error.asp?msg=Please enter time zone of the boy between -12.0 to 14.0")
       Response.end
    End If
    
'************************************'End validation fOr the Boy**************************************
    
'************************************'Validation fOr the Girl**************************************
    
    If request("name2") = "" Then
        Response.Redirect("matchmaking-error.asp?msg=Please enter value for the name field of the girl.")
        Response.end
    End If
    
    If daygirl = "" Then
        Response.Redirect("matchmaking-error.asp?msg=Please enter value for the day field of the girl.")
        Response.end
    End If
    
    If Not(IsNumeric(daygirl)) Then
        Response.Redirect("matchmaking-error.asp?msg=Please enter only digit characters in the day field of the girl.")
        Response.end
    End If
    
    If daygirl < 1 Or daygirl > 31 Then
       Response.Redirect("matchmaking-error.asp?msg=Please enter day value between 1 to 31 of the girl.")
       Response.end
    End If
    
    If monthgirl = "" Then
        Response.Redirect("matchmaking-error.asp?msg=Please enter value for month field of the girl.")
        Response.end
    End If
    
    If Not(IsNumeric(monthgirl)) Then
        Response.Redirect("matchmaking-error.asp?msg=Please enter only digit characters in the month field of the girl.")
        Response.end
    End If
    
    If monthgirl < 1 Or monthgirl > 12 Then
       Response.Redirect("matchmaking-error.asp?msg=Please enter month value between 1 to 12 of the girl.")
       Response.end
    End If

    If yeargirl = "" Then
        Response.Redirect("matchmaking-error.asp?msg=Please enter value for the year field of the girl.")
        Response.end
    End If

    If Not(IsNumeric(yeargirl)) Then
        Response.Redirect("matchmaking-error.asp?msg=Please enter only digit characters in the year field of the girl.")
        Response.end
    End If
    
    If yeargirl < 1 And yeargirl > 9999 Then
        Response.Redirect("matchmaking-error.asp?msg=Please enter year value between 1 to 9999 of the girl.")
        Response.end
    End If
    
    If hrsgirl = "" Then
        Response.Redirect("matchmaking-error.asp?msg=Please enter value for the hours field of the girl.")
        Response.end
    End If
    
    If Not(IsNumeric(hrsgirl)) Then
        Response.Redirect("matchmaking-error.asp?msg=Please enter only digit characters in the hours field of the girl.")
        Response.end
    End If
    
    If hrsgirl < 0 Or hrsgirl > 24 Then
       Response.Redirect("matchmaking-error.asp?msg=Please enter the hours value between 0 to 23 of the girl.")
       Response.end
    End If
    
    If mingirl = "" Then
        Response.Redirect("matchmaking-error.asp?msg=Please enter value for the minute field of the girl.")
        Response.end
    End If
    
    If Not(IsNumeric(mingirl)) Then
        Response.Redirect("matchmaking-error.asp?msg=Please enter only digit characters in minute field of the girl.")
        Response.end
    End If
    
    If mingirl < 0 Or mingirl > 60 Then
       Response.Redirect("matchmaking-error.asp?msg=Please enter minute value between 0 to 59 of the girl.")
       Response.end
    End If
    
    If secgirl = "" Then
        Response.Redirect("matchmaking-error.asp?msg=Please enter value for the second field of the girl.")
        Response.end
    End If
    
    If Not(IsNumeric(secgirl)) Then
        Response.Redirect("matchmaking-error.asp?msg=Please enter only digit characters in second field of the girl.")
        Response.end
    End If
    
    If secgirl < 0 Or secgirl > 60 Then
       Response.Redirect("matchmaking-error.asp?msg=Please enter second value between 0 to 60 of the girl.")
       Response.end
    End If
    
    If placegirl = "" Then
        Response.Redirect("matchmaking-error.asp?msg=Please enter place of the girl.")
        Response.end
    End If
    
    If dstgirl = "" Then
       Response.Redirect("matchmaking-error.asp?msg=Please enter dst of the girl.")
       Response.end
    End If
    
    If Not(IsNumeric(dstgirl)) Then
        Response.Redirect("matchmaking-error.asp?msg=Please enter digit in dst field of the girl.")
        Response.end
    End If

    If Cdbl(dstgirl) < -5 Or Cdbl(dstgirl) > 5 Then
       Response.Redirect("matchmaking-error.asp?msg=Please enter value for dst between -5 to 5 of the girl.")
       Response.end
    End If
    
    If LongDeggirl = "" Then
       Response.Redirect("matchmaking-error.asp?msg=Please enter value for longitude degree of the girl.")
       Response.end
    End If
    
    If Not(IsNumeric(LongDeggirl)) Then
        Response.Redirect("matchmaking-error.asp?msg=Please enter only digit characters in longitude degree of the girl.")
        Response.end
    End If

    If LongDeggirl < 0 Or LongDeggirl >= 180 Then
       Response.Redirect("matchmaking-error.asp?msg=Please enter longitude degree of the girl between 0 to 179.")
       Response.end
    End If
    
    If LongMingirl = "" Then
       Response.Redirect("matchmaking-error.asp?msg=Please enter longitude minute of the girl.")
       Response.end
    End If

    If Not(IsNumeric(LongMingirl)) Then
        Response.Redirect("matchmaking-error.asp?msg=Please enter digit characters in longitude minute of the girl.")
        Response.end
    End If

    If LongMingirl < 0 Or LongMingirl >= 60 Then
       Response.Redirect("matchmaking-error.asp?msg=Please enter longitude minute of the girl between 0 to 59.")
       Response.end
    End If
    
    If LongEWgirl = "" Then
       Response.Redirect("matchmaking-error.asp?msg=Please enter longitude second of the girl.")
       Response.end
    End If

    If LongEWgirl <> "E" And LongEWgirl <> "W" Then
       Response.Redirect("matchmaking-error.asp?msg=Please enter longitude direction of the girl either E Or W.")
       Response.end
    End If
    
    If LatDeggirl = "" Then
       Response.Redirect("matchmaking-error.asp?msg=Please enter latitude degree of the girl.")
       Response.end
    End If
    
    If Not(IsNumeric(LatDeggirl)) Then
        Response.Redirect("matchmaking-error.asp?msg=Please enter digit characters in latitude degree of the girl.")
        Response.end
    End If

    If LatDeggirl < 0 Or LatDeggirl >= 90 Then
       Response.Redirect("matchmaking-error.asp?msg=Please enter latitude degree of the girl between 0 to 89.")
       Response.end
    End If
    
    If LatMingirl = "" Then
       Response.Redirect("matchmaking-error.asp?msg=Please enter latitude minute of the girl.")
       Response.end
    End If

    If not(IsNumeric(LatMingirl)) Then
        Response.Redirect("matchmaking-error.asp?msg=Please entert digit characters in latitude minute of the girl.")
        Response.end
    End If

    If LatMingirl < 0 Or LatMingirl >= 60 Then
       Response.Redirect("matchmaking-error.asp?msg=Please enter latitude minute of the girl between 0 to 59.")
       Response.end
    End If
    
    If LatNSgirl = "" Then
       Response.Redirect("matchmaking-error.asp?msg=Please enter latitude direction of the girl.")
       Response.end
    End If

    If LatNSgirl <> "N" And LatNSgirl <> "S" Then
       Response.Redirect("matchmaking-error.asp?msg=Please enter latitude direction of the girl either N Or S.")
       Response.end
    End If

    If timeZonegirl = "" Then
       Response.Redirect("matchmaking-error.asp?msg=Please enter value for time zone of the girl.")
       Response.end
    End If

    If Not(IsNumeric(timeZonegirl)) Then
        Response.Redirect("matchmaking-error.asp?msg=Please enter digit characters in time zone of the girl.")
        Response.end
    End If

    If Cdbl(timeZonegirl) < -12.0 Or Cdbl(timeZonegirl) > 13.0 Then
       Response.Redirect("matchmaking-error.asp?msg=Please enter time zone of the girl between -12.0 to 14.0")
       Response.end
    End If

'************************************'End validation fOr the Girl**************************************

%>