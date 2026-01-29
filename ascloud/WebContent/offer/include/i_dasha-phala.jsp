<%@page import="com.ojassoft.astrosagecloud.util.SharedFunction"%>
<%@page import="org.json.JSONObject"%>
<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page import="com.ojassoft.astrosagecloud.DAO.CloudDAO"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Hindi"%>
<%@include file='/cloud/planets-detailed-informations.jsp'%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
int languageCode = (Integer)session.getAttribute("languageCode");
Hindi hindi = new Hindi();
Local local = new Local();

/*MyResourceBundle rbConstants;
Object objR = request.getAttribute("constants");
if(objR == null){
rbConstants = local.loadPropertiesFileNew("constants",languageCode);
}else{
rbConstants = (MyResourceBundle) objR;}
*/
MyProperties rbConstants = (MyProperties) session.getAttribute("constants");
MyResourceBundle rBDashaPhala = local.loadPropertiesFileNew("dashaphala",languageCode);
DesktopHoro myAstrologyObj= (DesktopHoro) session.getAttribute("HoroscopeObj");

int langCode = (Integer)session.getAttribute("languageCode");
if(langCode ==1 ) {
    myAstrologyObj.setLanguageCode("1");
    myAstrologyObj.initialize();
}else{
    myAstrologyObj.setLanguageCode("0");
    myAstrologyObj.initialize();
}

//Dim planetrasi, RasiForPrediction
int rasiForPrediction = myAstrologyObj.getAscendentSign();
String[] myPlanetNames =  new String[13];

String[] aryPlanet ={"Sun", "Moon", "Mars", "Mercury", "Jupiter", "Venus", "Saturn", "Rahu", "Ketu", "Uranus", "Neptune", "Pluto"};

myPlanetNames[1]="Sun";
myPlanetNames[2]="Moon";
myPlanetNames[3]="Mars";										   
myPlanetNames[4]="Mercury";					  
myPlanetNames[5]="Jupiter";					   
myPlanetNames[6]="Venus";
myPlanetNames[7]="Saturn";
myPlanetNames[8]="Rahu";
myPlanetNames[9]="Ketu";

int[] planetrasi = myAstrologyObj.getPositionForShodasvarg(0);

//Set shmRsCity = server.CreateObject ("ADODB.Recordset")
//Set ConnObjCity = server.CreateObject ("ADODB.Connection")
//ConnObjCity.Open Application("DSN")

// calculate dasa
myAstrologyObj.getVimsottariDasaTwoLevel();
String yoB = String.valueOf(myAstrologyObj.getYearOfBirth());     
String prefixYoB = yoB.substring(0, 2);

%>

<div align="center" class="heading-sec">
    <h2>
        <%=rBDashaPhala.getString("VIMSHOTTARI_MAHADASHA_PHAL_DASHA_PREDICTIONS")%>
    </h2>
</div>

<div class="inner-sec">
 
<%

String fullPlanetAspectsVal[] = new String[12];
String fullPlanetAspectsVallues_HI ="";
String fullPlanetAspectsVallues= "";
for(int i = 1 ;i<= 9 ;i++){

   String dasa = myAstrologyObj.getMahaDasa(i-1);
   String dasaLord = myAstrologyObj.getMahaDasa(i-1).substring(0, 3);
   int dasaLordNumber = PlanetNumber(dasaLord);
   String dasaTill = hindi.unicode(dasa.substring(dasa.length()-10),languageCode);
   String dasaFrom = "";
     
   if(i == 1){
       dasaFrom = rbConstants.getString("BIRTH");
   }else{ 
   	
   	dasaFrom = myAstrologyObj.getMahaDasa(i-2);
	    dasaFrom = hindi.unicode(dasaFrom.substring(dasaFrom.length()-8),languageCode);
       //dasaFrom = hindi.unicode(myAstrologyObj.getMahaDasa(i-2).substring(myAstrologyObj.getMahaDasa(i-2).length()-8),languageCode);//Right(myAstrologyObj.getMahaDasa(i-2), 8))
   }
  
   //out.println(dasaFrom+"<br/>");
      Util utl =  new  Util();
   if(!dasaFrom.equals(rbConstants.getString("BIRTH"))){
   	if(Integer.parseInt(dasaFrom.substring(dasaFrom.length()-2)) > Integer.parseInt(dasaTill.substring(dasaTill.length()-2))){
      
           dasaFrom = utl.getDate(dasaFrom,prefixYoB,languageCode,rbConstants);
           prefixYoB = String.valueOf(Integer.parseInt(prefixYoB) + 1);
           dasaTill = utl.getDate(dasaTill,prefixYoB,languageCode,rbConstants);
          
   }else{
           dasaFrom = utl.getDate(dasaFrom,prefixYoB,languageCode,rbConstants);
           dasaTill = utl.getDate(dasaTill,prefixYoB,languageCode,rbConstants);
   }
   }else{
       
       	if(Integer.parseInt(yoB.substring(yoB.length()-2)) > Integer.parseInt(dasaTill.substring(dasaTill.length()-2))){
           prefixYoB = String.valueOf(Integer.parseInt(prefixYoB) + 1);        
           dasaTill = utl.getDate(dasaTill,prefixYoB,languageCode,rbConstants); 
       }else{
           dasaTill = utl.getDate(dasaTill,prefixYoB,languageCode,rbConstants);
       }
   }
   //out.println(dasaFrom+"##"+dasaTill+","+prefixYoB+"<br/>");

   int bhava = planetrasi[dasaLordNumber] - rasiForPrediction + 1;
   if(bhava < 1){
	    bhava = bhava + 12;
   }
 
%>
<h3>
<%   

   //subPrintPlanetNameDetails (left(aryPlanet(dasaLordNumber-1),2)), "Rasi"
   //out.println(aryPlanet[dasaLordNumber-1].substring(0,2));
String PlanetInfo = subPrintPlanetNameDetails(aryPlanet[dasaLordNumber-1].substring(0,2), "Rasi", myAstrologyObj, languageCode);
  out.println(rbConstants.getString((myPlanetNames[dasaLordNumber].toUpperCase()))+"&nbsp;" +  rBDashaPhala.getString("MAHADASHA_PHAL") +" (" + dasaFrom + " - " + dasaTill + ")");

 %>
  </h3>
  <p>
<%   
    //Response.Write "<b>" & GetString(UCase(myPlanetNames(dasaLordNumber))) & GetString("Is_In")& Unicode(myAstrologyObj.getPlanetaryRasiName(dasaLordNumber)) & GetString("In_Your")&" " & bhava & NoSuffix(bhava)&" " & GetString("IS_HOUSE")&".</b><br/><br/>"
     
    //*****************Set JSON Object

        JSONObject ObjPlanetJSON = new JSONObject(PlanetJson);
        //Set ObjPlanetJSON = JSON.parse(PlanetJson)

        //*****************Create Array for PlanetAspects_EN
       
        String[] arrPlanetAspects = String.valueOf(ObjPlanetJSON.getJSONArray("Aspects")).replace("\"", "").replace("[","").split(",");

        for(int j=0 ;j<=arrPlanetAspects.length-1 ; j++) {
          boolean fullPlanetAspects = arrPlanetAspects[j].contains("/");
          
          if(fullPlanetAspects == false){
            fullPlanetAspectsVal = arrPlanetAspects[j].split(":");
           // out.println(arrPlanetAspects[j]);
            fullPlanetAspectsVallues_HI = fullPlanetAspectsVallues_HI +" "+ utl.newConvertNoSuffixHI(Integer.parseInt(fullPlanetAspectsVal[0]))+",";
            fullPlanetAspectsVallues = fullPlanetAspectsVallues +" "+ fullPlanetAspectsVal[0]+SharedFunction.NoSuffix(Integer.parseInt(fullPlanetAspectsVal[0]))+",";
          }
        }
        
        //***************** 
        fullPlanetAspectsVallues_HI = fullPlanetAspectsVallues_HI.substring(0,fullPlanetAspectsVallues_HI.length()-1);// Left(FullPlanetAspectsVallues_HI,len(FullPlanetAspectsVallues_HI)-1)
        fullPlanetAspectsVallues = fullPlanetAspectsVallues.substring(0,fullPlanetAspectsVallues.length()-1);//Left(FullPlanetAspectsVallues,len(FullPlanetAspectsVallues)-1);
     
         
       //*****************Get Planet Lordof in hindi
       // JSONArray arrPlanetLord = ObjPlanetJSON.getJSONArray("LordOf");
       String[] arrPlanetLord = String.valueOf(ObjPlanetJSON.getJSONArray("LordOf")).replace("\"", "").replace("]","").replace("[","").split(",");
       String aspectsPlanetLord="";
        for(int k=0 ;k<= arrPlanetLord.length-1 ; k++){
          if(arrPlanetLord[k]!="0" ){
             aspectsPlanetLord = aspectsPlanetLord+" "+utl.newConvertNoSuffixHI(Integer.parseInt(arrPlanetLord[k]))+",";
          } 
        }
        
        
        //*****************Set Planet Lordof in AspectsPlanetLord
        
        if(!aspectsPlanetLord.equals("")){
          aspectsPlanetLord = aspectsPlanetLord.substring(0,aspectsPlanetLord.length()-1);//Left(AspectsPlanetLord,len(AspectsPlanetLord)-1)
        }
        
        //*****************Create Array for PlanetAspects_HI
       //PlanetAspects = ObjPlanetJSON.AspectsFrom
        String planetAspect ="";
        		try{
        			planetAspect=String.valueOf(ObjPlanetJSON.getJSONArray("AspectsFrom"));
        		
        		}
        		catch(Exception e)
        		{
        			planetAspect=ObjPlanetJSON.getString("AspectsFrom");
        		}
       arrPlanetAspects = planetAspect.replace("[", "").replace("]", "").replace("\"", " ").split(",");
        //arrPlanetAspects = split(PlanetAspects,",")
        String aspectsPlanetName ="";
       for(int l=0;l<=arrPlanetAspects.length-1;l++){
    	
    	   aspectsPlanetName = aspectsPlanetName+" "+Util.ConvertPlanetNameinHI(arrPlanetAspects[l])+",";
            
          
       }
        aspectsPlanetName = aspectsPlanetName.substring(0,aspectsPlanetName.length()-1);//Left(AspectsPlanetName,len(AspectsPlanetName)-1)
		
        if(langCode == 1){
        
        //*****************Print Technical Detail in Simple Hindi Language                        
        if((dasaLordNumber-1) < 7){
           //FullPlanetAspectsVallues_HI = Left(FullPlanetAspectsVallues_HI,len(FullPlanetAspectsVallues_HI)-1)
          if(planetAspect.equals("Null")){
             out.println("<b>"+"आपकी कुण्डली में " +utl.convertPlanetNameinHI(ObjPlanetJSON.getString("PlanetName")) +" "+ hindi.unicode(myAstrologyObj.getPlanetaryRasiName(dasaLordNumber),languageCode) +" राशि में स्थित है, जो की " + utl.convertPlanetNameinHI(ObjPlanetJSON.getString("PlanetName")) + " की "+ utl.relationshipWithPlanet(ObjPlanetJSON.getString("Relationship"),rbConstants) +" है। "+ utl.convertPlanetNameinHI(ObjPlanetJSON.getString("PlanetName")) +" "+ aspectsPlanetLord + " घर का स्वामी होकर आपकी कुण्डली में " + utl.newConvertNoSuffixHI(Integer.parseInt(ObjPlanetJSON.getString("House")))  + " घर में स्थित है। "  +utl.convertPlanetNameinHI(ObjPlanetJSON.getString("PlanetName")) + " की दृष्टि "+ fullPlanetAspectsVallues_HI + " घर पर है। "+"</b></br></br>");
          }else{
             out.println("<b>"+"आपकी कुण्डली में " + utl.convertPlanetNameinHI(ObjPlanetJSON.getString("PlanetName")) +" "+ hindi.unicode(myAstrologyObj.getPlanetaryRasiName(dasaLordNumber),languageCode) +" राशि में स्थित है, जो की " +utl.convertPlanetNameinHI(ObjPlanetJSON.getString("PlanetName")) + " की "+utl.relationshipWithPlanet(ObjPlanetJSON.getString("Relationship"),rbConstants) +" है। "+ utl.convertPlanetNameinHI(ObjPlanetJSON.getString("PlanetName")) +" "+ aspectsPlanetLord + " घर का स्वामी होकर आपकी कुण्डली में " + utl.newConvertNoSuffixHI(Integer.parseInt(ObjPlanetJSON.getString("House")))  + " घर में स्थित है। "  + utl.convertPlanetNameinHI(ObjPlanetJSON.getString("PlanetName")) + " की दृष्टि "+ fullPlanetAspectsVallues_HI + " घर पर है। "+ aspectsPlanetName +" की पूर्ण दृष्टि "+utl.convertPlanetNameinHI(ObjPlanetJSON.getString("PlanetName"))+" पर है।"+"</b></br></br>"); 
          }
        }else if((dasaLordNumber-1) > 6){
          if(String.valueOf(ObjPlanetJSON.getJSONArray("AspectsFrom")).equals("Null")){
             out.println("<b>"+"आपकी कुण्डली में " +utl.convertPlanetNameinHI(ObjPlanetJSON.getString("PlanetName")) +" "+ hindi.unicode(myAstrologyObj.getPlanetaryRasiName(dasaLordNumber),languageCode) +" राशि में स्थित है। "+ utl.convertPlanetNameinHI(ObjPlanetJSON.getString("PlanetName"))+" "+ utl.newConvertNoSuffixHI(Integer.parseInt(ObjPlanetJSON.getString("House")))  + " घर में स्थित है। " + utl.convertPlanetNameinHI(ObjPlanetJSON.getString("PlanetName")) + " की दृष्टि "+ fullPlanetAspectsVallues_HI + " घर पर है। "+"</b></br></br>");
        }else{
             out.println("<b>"+"आपकी कुण्डली में " +utl.convertPlanetNameinHI(ObjPlanetJSON.getString("PlanetName")) +" "+ hindi.unicode(myAstrologyObj.getPlanetaryRasiName(dasaLordNumber),languageCode) +" राशि में स्थित है। "+utl.convertPlanetNameinHI(ObjPlanetJSON.getString("PlanetName"))+" "+ utl.newConvertNoSuffixHI(Integer.parseInt(ObjPlanetJSON.getString("House")))  + " घर में स्थित है। " + utl.convertPlanetNameinHI(ObjPlanetJSON.getString("PlanetName")) + " की दृष्टि "+ fullPlanetAspectsVallues_HI + " घर पर है। "+ aspectsPlanetName +" की पूर्ण दृष्टि "+ utl.convertPlanetNameinHI(ObjPlanetJSON.getString("PlanetName"))+" पर है।"+"</b></br></br>"); 
        }
        
        }

        fullPlanetAspectsVallues_HI = "";
            aspectsPlanetLord = "";
            aspectsPlanetName = "";
        } else{
        //out.println(ObjPlanetJSON.getString("LordOf"));
        //*****************Print Technical Detail in Simple English Language
         if((dasaLordNumber-1)<7){
             if(planetAspect.equals("Null")){   
                 out.println("<b>"+"Your " + ObjPlanetJSON.getString("PlanetName") + " is in "+ hindi.unicode(myAstrologyObj.getPlanetaryRasiName(dasaLordNumber),languageCode) +" sign which is a "+ ObjPlanetJSON.getString("Relationship") +" sign for "+ ObjPlanetJSON.getString("PlanetName") +". "+ ObjPlanetJSON.getString("PlanetName") + " is lord of " + String.valueOf(ObjPlanetJSON.getJSONArray("LordOf")).replace("\"", "").replace("]","").replace("[","").replace(",0","") + " house and situated in " + ObjPlanetJSON.getString("House").replace("\"", "").replace("]","").replace("[","")+SharedFunction.NoSuffix(Integer.parseInt(ObjPlanetJSON.getString("House"))) + " house. "  + ObjPlanetJSON.getString("PlanetName") + " aspects "+fullPlanetAspectsVallues + " house."+"</b></br></br>");
             } else{
            	 out.println("<b>"+"Your " + ObjPlanetJSON.getString("PlanetName") + " is in "+ hindi.unicode(myAstrologyObj.getPlanetaryRasiName(dasaLordNumber),languageCode) +" sign which is a "+ ObjPlanetJSON.getString("Relationship") +" sign for "+ ObjPlanetJSON.getString("PlanetName") +". "+ ObjPlanetJSON.getString("PlanetName") + " is lord of " + String.valueOf(ObjPlanetJSON.getJSONArray("LordOf")).replace("\"", "").replace("]","").replace("[","").replace(",0","") + " house and situated in " + ObjPlanetJSON.getString("House").replace("\"", "").replace("]","").replace("[","")+SharedFunction.NoSuffix(Integer.parseInt(ObjPlanetJSON.getString("House"))) + " house. "  + ObjPlanetJSON.getString("PlanetName") + " aspects "+ fullPlanetAspectsVallues+ " house and aspected by "+ planetAspect.replace("\"", "").replace("]","").replace("[","") +"."+"</b></br></br>");
             }
         }else if((dasaLordNumber-1) > 6){
              if(planetAspect.equals("Null")){ 
            	  out.println("<b>"+"Your " + ObjPlanetJSON.getString("PlanetName") + " is in "+ hindi.unicode(myAstrologyObj.getPlanetaryRasiName(dasaLordNumber),languageCode) +" sign."+ ObjPlanetJSON.getString("PlanetName") +" is situated in " + ObjPlanetJSON.getString("House").replace("\"", "").replace("]","").replace("[","")+SharedFunction.NoSuffix(Integer.parseInt(ObjPlanetJSON.getString("House"))) + " house. "  + ObjPlanetJSON.getString("PlanetName") + " aspects "+ fullPlanetAspectsVallues + " house."+"</b></br></br>");
              }else{
            	  out.println("<b>"+"Your " + ObjPlanetJSON.getString("PlanetName") + " is in "+ hindi.unicode(myAstrologyObj.getPlanetaryRasiName(dasaLordNumber),languageCode) +" sign."+ ObjPlanetJSON.getString("PlanetName") +" is situated in " + ObjPlanetJSON.getString("House").replace("\"", "").replace("]","").replace("[","")+SharedFunction.NoSuffix(Integer.parseInt(ObjPlanetJSON.getString("House"))) + " house. "  + ObjPlanetJSON.getString("PlanetName") + " aspects "+ fullPlanetAspectsVallues + " house and aspected by "+ planetAspect.replace("\"", "").replace("]","").replace("[","") +"."+"</b></br></br>");
              }
             
         }
         fullPlanetAspectsVallues = "";
        }
     
            
        CloudDAO predic = new CloudDAO();
        out.println(predic.GetPrediction(dasaLordNumber,bhava,languageCode,null,hindi)); 
    
%>
 </p>  
<%  
} 
  
%>
</div>
<%!
public int  PlanetNumber (String planetName){
     int planetNumber = 0;
	if(planetName.equals("SUN"))
	{
		planetNumber = 1;  
	}
	else if(planetName.equals("lw;")){
		planetNumber = 1;
	}
	else if(planetName.equals("MON")){
		planetNumber = 2;
	}
	else if(planetName.equals("pan")){
		planetNumber = 2;
	}
	else if(planetName.equals("MAR")){
		planetNumber = 3;
	}
	else if(planetName.equals("eax")){
		planetNumber = 3;
	}
	else if(planetName.equals("MER")){
		planetNumber = 4;
	}
	else if(planetName.equals("cq/")){
		planetNumber = 4;
	}
	else if(planetName.equals("JUP")){
		planetNumber = 5;
	}
	else if(planetName.equals("xq:")){
		planetNumber = 5;
	}
	else if(planetName.equals("VEN")){
		planetNumber = 6;
	}
	else if(planetName.equals("'kq")){
		planetNumber = 6;
	}
	else if(planetName.equals("SAT")){
		planetNumber = 7;
	}
	else if(planetName.equals("'kf")){
		planetNumber = 7;
	}
	else if(planetName.equals("RAH")){
		planetNumber = 8;
	}
	else if(planetName.equals("jkg")){
		planetNumber = 8;
	}
	else if(planetName.equals("KET")){
		planetNumber = 9;
	}
	else if(planetName.equals("dsr")){
		planetNumber = 9;
	}
	
    return planetNumber;
}
%>





