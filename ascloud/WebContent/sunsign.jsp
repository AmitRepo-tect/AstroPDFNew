<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@ page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@ page import="com.cslsoftware.util.Constants"%>

 <!--#include virtual = "/DbConnection.inc"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

    <head>
        <!--#include virtual="/include/topmeta.asp"-->
        
        <% Object obj = request.getParameter("getsunsign");
        if(obj == null || obj.toString().trim().equals("")) { %>
        	<title>Your Sun Sign (Surya Rashi)</title>
        <%  } else { %>
        	<title>Sun Sign: Finding Your Sun Sign Compatibility</title>
        <%  } %>
        <meta name="Keywords" content="sun, sign, calculator, surya, rashi, free, horoscope, zodiac, compatibility, birth, chart, rising, astrology">
        <meta name="Description" content="AstroSage's Sun Sign calculator is the most accurate birth chart calculator on the Internet. It calculates Sun sign or surya rashi for exact moment. ">
        <meta name="copyright" content="astrosage.com">
        
        <!--#include virtual="/include/cssscript-other.asp"-->
        
    </head>
    <body>
        <% session.setAttribute("topmenulink", "calculators"); %>
        
        <!--#include virtual="/include/headernew.asp"-->
        <div id="roundborder" class="ui-container ui-margin-tb">
            <div id="roundtopheadid">
                <div class="roundtophead">
                    <div>
                        <div class="AscTopHead" style="text-align: left;">
                            <a href="/" title="Home" class="BreadCrumb">Home</a> &#187; <a class="BreadCrumb">Sun
                                Sign</a>
                        </div>
                    </div>
                </div>
            </div>
            <h1 align="center">
	            <% if(obj == null || obj.toString().trim().equals("")) { %>
		        	Your Sun Sign
		        <%  } else { %>
		        	Sun Sign - Find Your Sun Sign
		        <%  }
	            
		        if(Util.isMobileDevice(request)) { %>
                	<a id="exndColpsTrigger" href="javascript:expandCollapse();" class="btn btn-whxite card-shadow br-radius">
                    <span class="glyphicon glyphicon-plus"></span></a>
                <% } %>
            </h1>
            <%
            if(obj != null && !obj.toString().trim().equals("")) { 
            	if (Util.safestr(request.getParameter("day")).equals("") ||  Util.safestr(request.getParameter("month")).equals("") || Util.safestr(request.getParameter("year")).equals("") || Util.safestr(request.getParameter("place")).equals("")) {
            		response.sendRedirect("http://www.astrosage.com/sunsign.asp");
            	}

            	String name = Util.safestr(request.getParameter("name"));
            	String doB = Util.safestr(request.getParameter("day"));
            	String moB = Util.safestr(request.getParameter("month"));
            	String yoB = Util.safestr(request.getParameter("year"));     
	            
            	String hoB="", minOB="", soB="";
            	
            	if(Util.safeInt(request.getParameter("dontTOB")) == 1) {
            		hoB = "00";
    		        minOB = "00";
    		        soB = "00";
            	} else {
            		hoB = Util.safestr(request.getParameter("hrs"));
   		            minOB = Util.safestr(request.getParameter("min"));
   		            soB = Util.safestr(request.getParameter("sec"));
            	}
            	
            	String place = Util.safestr(request.getParameter("place"));
            	String latDegree = Util.safestr(request.getParameter("LatDeg"));
            	String latMinute = Util.safestr(request.getParameter("LatMin"));
            	String latNS = Util.safestr(request.getParameter("LatNS"));
            	String longDegree = Util.safestr(request.getParameter("LongDeg"));
            	String longMinute = Util.safestr(request.getParameter("LongMin"));
            	String longEW = Util.safestr(request.getParameter("LongEW"));
            	String timeZone = Util.safestr(request.getParameter("timeZone"));
            	String dST = Util.safestr(request.getParameter("dst"));
            	
            	String DateoB = doB + "/" + moB + "/" + yoB;
            	String TimeoB = hoB + ":" + minOB + ":" + soB;    
            	
//  ********* Make Object Of Horodesktop.dll **********

//  ********* INITIALIZE HORODESKTOP OBJECT WITH EITHER FORM OR DATABASE VALUES ****

	  		 	DesktopHoro ObjHoro = new  DesktopHoro();
				Constants ObjConst = new Constants();
				ObjConst.setConstPath(getServletContext().getRealPath("/cloud/"));
	
				ObjHoro.setPlace(place);
				ObjHoro.setCompanyAddLine1 ("Delhi");
				ObjHoro.setCompanyName ("OJAS Softech");
				ObjHoro.setTimeZone(String.valueOf(timeZone));
				ObjHoro.setSecondOfBirth(soB);
				ObjHoro.setMinuteOfBirth(minOB);
				ObjHoro.setHourOfBirth(hoB);
				ObjHoro.setDayOfBirth(doB);
				ObjHoro.setMonthOfBirth(moB);
				ObjHoro.setYearOfBirth(yoB);
				ObjHoro.setDegreeOfLattitude(String.valueOf(latDegree));
				ObjHoro.setDegreeOfLongitude(String.valueOf(longDegree));
				ObjHoro.setSecondOfLattitude("00");
				ObjHoro.setSecondOfLongitude("00");
				ObjHoro.setMinuteOfLongitude(String.valueOf(longMinute));
				ObjHoro.setMinuteOfLattitude(String.valueOf(latMinute));
				ObjHoro.setEastWest(longEW);
				ObjHoro.setNorthSouth(latNS);
				ObjHoro.setDST(dST);
				ObjHoro.setLanguageCode("0");
				ObjHoro.initialize();
				
				String insunsign = ObjHoro.getIndianSunSignName();
				String nameofinrashi = insunsign;
				if(insunsign == "Scorpion") {
					insunsign = "Scorpio";
			    }
				
				String wesunsign = ObjHoro.getSunSignName();
				String nameofwerashi = wesunsign;
				if(wesunsign == "Scorpion") {
					wesunsign = "Scorpio";
			    }	
            %>
            <div id="showSunSign" class="ui-content">
                <div class="col-sm-6">
                    <div class="card-view ui-padding-all">
                        <p>
                            <b>Your Sun Sign as per Vedic Astrology (Sidereal Astrology):</b></p>
                        <div class="col-xs-3" align="right">
                            <a href="http://www.astrosage.com/horoscope/<%=insunsign%>.asp">
                                <img src="images/sign/<%=insunsign.toLowerCase()%>.png" width="100" /></a>
                        </div>
                        <div class="col-xs-9">
                            <h2 align="left">
                                <%=nameofinrashi + " (" + getRashiNameinHindi(insunsign) + ")"%></h2>
                            <p>
                                Based on the provided birth details</p>
                        </div>
                        <div class="clearfix">
                        </div>
                    </div>
                    <div class="card-view">
                        <div class="ui-border-b">
                            <a href="http://www.astrosage.com/horoscope/daily-<%=insunsign.toLowerCase() %>-horoscope.asp"><span class="ui-inner-img">
                                <img src="images/sign/<%=insunsign.toLowerCase() %>.png" width="40" alt="<%=insunsign %> Zodiac sign" /></span><font
                                    size="+1">Daily Horoscope</font></a>
                        </div>
                        <div class="ui-border-b">
                            <a href="http://www.astrosage.com/horoscope/weekly-<%=insunsign.toLowerCase() %>-horoscope.asp"><span class="ui-inner-img">
                                <img src="images/sign/<%=insunsign.toLowerCase() %>.png" width="40" alt="<%=insunsign %> Zodiac sign" /></span><font
                                    size="+1">Weekly Horoscope</font></a>
                        </div>
                        <div class="ui-border-b">
                            <a href="http://www.astrosage.com/horoscope/monthly-<%=insunsign.toLowerCase() %>-horoscope.asp"><span class="ui-inner-img">
                                <img src="images/sign/<%=wesunsign.toLowerCase() %>.png" width="40" alt="<%=insunsign %> Zodiac sign" /></span><font
                                    size="+1">Monthly Horoscope</font></a>
                        </div>	
                        <div class="ui-border-b">
                            <a href="http://www.astrosage.com/horoscope/<%=insunsign.toLowerCase() %>-characteristics.asp"><span class="ui-inner-img">
                                <img src="images/sign/<%=insunsign.toLowerCase() %>.png" width="40" alt="<%=insunsign %> Zodiac sign" /></span><font
                                    size="+1">Characteristics</font></a>
                        </div>
                        <div class="ui-border-b">
                            <a href="http://www.astrosage.com/horoscope/weekly-<%=insunsign.toLowerCase() %>-love-horoscope.asp"><span class="ui-inner-img">
                                <img src="images/sign/<%=insunsign.toLowerCase() %>.png" width="40" alt="<%=insunsign %> Zodiac sign" /></span><font
                                    size="+1">Love Horoscope</font></a>
                        </div>
                        <div class="ui-border-b">
                            <a href="http://www.astrosage.com/horoscope/yearly-<%=insunsign.toLowerCase() %>-horoscope.asp"><span class="ui-inner-img">
                                <img src="images/sign/<%=insunsign.toLowerCase() %>.png" width="40" alt="<%=insunsign %> Zodiac sign" /></span><font
                                    size="+1">Yearly Horoscope</font></a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="card-view ui-padding-all">
                        <p>
                            <b>Your Sun Sign as per Western Astrology (Tropical Astrology):</b></p>
                        <div class="col-xs-3" align="right">
                            <a href="http://www.astrosage.com/horoscope/<%=wesunsign.toLowerCase() %>.asp">
                                <img src="images/sign/<%=wesunsign.toLowerCase()%>.png" width="100" /></a>
                        </div>
                        <div class="col-xs-9">
                            <h2 align="left">
                                <%=nameofwerashi + " (" + getRashiNameinHindi(wesunsign) + ")"%></h2>
                            <p>
                                Based on the provided birth details</p>
                        </div>
                        <div class="clearfix">
                        </div>
                    </div>
                    <div class="card-view">
                        <div class="ui-border-b">
                            <a href="http://www.astrosage.com/horoscope/daily-<%=wesunsign.toLowerCase() %>-horoscope.asp"><span class="ui-inner-img">
                                <img src="images/sign/<%=wesunsign.toLowerCase() %>.png" width="40" alt="<%=wesunsign %> Zodiac sign" /></span><font
                                    size="+1">Daily Horoscope</font></a>
                        </div>
                        <div class="ui-border-b">
                            <a href="http://www.astrosage.com/horoscope/weekly-<%=wesunsign.toLowerCase() %>-horoscope.asp"><span class="ui-inner-img">
                                <img src="images/sign/<%=wesunsign.toLowerCase() %>.png" width="40" alt="<%=wesunsign %> Zodiac sign" /></span><font
                                    size="+1">Weekly Horoscope</font></a>
                        </div>
                        <div class="ui-border-b">
                            <a href="http://www.astrosage.com/horoscope/monthly-<%=wesunsign.toLowerCase() %>-horoscope.asp"><span class="ui-inner-img">
                                <img src="images/sign/<%=wesunsign.toLowerCase() %>.png" width="40" alt="<%=wesunsign %> Zodiac sign" /></span><font
                                    size="+1">Monthly Horoscope</font></a>
                        </div>
                        <div class="ui-border-b">
                            <a href="http://www.astrosage.com/horoscope/<%=wesunsign.toLowerCase() %>-characteristics.asp"><span class="ui-inner-img">
                                <img src="images/sign/<%=wesunsign.toLowerCase() %>.png" width="40" alt="<%=wesunsign %> Zodiac sign" /></span><font
                                    size="+1">Characteristics</font></a>
                        </div>
                        <div class="ui-border-b">
                            <a href="http://www.astrosage.com/horoscope/weekly-<%=wesunsign.toLowerCase() %>-love-horoscope.asp"><span class="ui-inner-img">
                                <img src="images/sign/<%=wesunsign.toLowerCase() %>.png" width="40" alt="<%=wesunsign %> Zodiac sign" /></span><font
                                    size="+1">Love Horoscope</font></a>
                        </div>
                        <div class="ui-border-b">
                            <a href="http://www.astrosage.com/horoscope/yearly-<%=wesunsign.toLowerCase() %>-horoscope.asp"><span class="ui-inner-img">
                                <img src="images/sign/<%=wesunsign.toLowerCase() %>.png" width="40" alt="<%=wesunsign %> Zodiac sign" /></span><font
                                    size="+1">Yearly Horoscope</font></a>
                        </div>
                    </div>
                </div>
                <div class="clearfix">
                </div>
            </div>
            <% } %>
        </div>
        
        <!--#include virtual="/footer_no.inc"-->
    </body>
    </html>
    <%!
    public static String getRashiNameinHindi(String sign) {
		String signName = "";
		switch (sign.toLowerCase()) {
		    case "aries":
			    signName = "Mesh";
			    break;
		    case "taurus":
			    signName = "Vrishabha";
			    break;
		    case "gemini":
			    signName = "Mithun";
			    break;
			case "cancer":
			    signName = "Karka";
			    break;
	        case "leo":
			    signName = "Simha";
			    break;
		    case "virgo":
			    signName = "Kanya";
			    break;
		    case "libra":
			    signName = "Tula";
			    break;
			case "scorpio":
			    signName = "Vrishchika";
			    break;
			case "sagittarius":
			    signName = "Dhanu";
			    break;
		    case "capricorn":
			    signName = "Makara";
			    break;
		    case "aquarius":
			    signName = "Kumbha";
			    break;
			case "pisces":
			    signName = "Meena";
			    break;
			default:
				break;
		}
	return signName;
	}
    %>