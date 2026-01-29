<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.util.Common"%>

<%!
String PlanetJson = "";
public int getCorrespondingPlanetNo(String strPlanetName)
{
	int returnVal = 0;
	for(int i=0;i<=11;i++)
	{
		if(strPlanetName.equals(Common.arrShortPlanetName[i]))
		{
			returnVal = i;
			break;
		}
	}
	return returnVal;
}

/**
'this function returns details of passed planet (intPlanetNo) in perticular varga (strKundliType)
'intPlanetNo is misleading and it should be planetName
'intPlanetNo - planet name as per arrShortPlanetName array
'strKundliType - varga name as per getcorrespondingValueforKundliType function
*/
public String subPrintPlanetNameDetails(String planetName , String  strKundliType, DesktopHoro myAstrologyObject, int planetLangCode)
{
	int iPlanetNo = getCorrespondingPlanetNo(planetName)+1;

	String strDescription = Common.arrLongPlanetName[iPlanetNo-1];
	strDescription = strDescription + " in " + strKundliType +"\n";

	int iShodhashvargaPosition = getcorrespondingValueforKundliType(strKundliType);

	strDescription = strDescription + myAstrologyObject.getPlanetaryRasiNameForShodashvargaDivision(iPlanetNo, iShodhashvargaPosition) + "\n";


	int iRelationship = myAstrologyObject.getRelationshipForShodashvargaDivision(iPlanetNo, iShodhashvargaPosition);
	strDescription = strDescription + getRelationshipInString(iRelationship) + "\n";


	int[] arrHouseLord = myAstrologyObject.getHouselord(iPlanetNo, iShodhashvargaPosition);


	String strHouseLord = "";
	for(int icount = 0;icount<=arrHouseLord.length-1;icount++)
	{
	  if( arrHouseLord[icount] != 0)
	  {
	    strHouseLord = strHouseLord.equals("")? "" : strHouseLord + ", ";
	    strHouseLord = strHouseLord + arrHouseLord[icount] + " ";
	  }
	  else
	  {
	    strHouseLord = strHouseLord + " ";
	  }
	}
	int[] arrPlanetInBhav = new int[13];
	String[] strhouselordarr = strHouseLord.split(" ");
	String strHouseLordjsonarr = "[\"";
	for(int j=0;j<=arrHouseLord.length-1;j++)
	{
	    strHouseLordjsonarr = strHouseLordjsonarr +""+ arrHouseLord[j]+"\",\"";
	}
	strHouseLordjsonarr=strHouseLordjsonarr.substring(0, strHouseLordjsonarr.length()-2);
	strHouseLordjsonarr = strHouseLordjsonarr+"]";

	if(!strHouseLord.equals(""))
	{
	  strDescription = strDescription + "Lord of ";
	  strDescription = strDescription + strHouseLord;
	  arrPlanetInBhav = myAstrologyObject.getPlanetInBhav(iShodhashvargaPosition);
	  strDescription = strDescription + "In " + arrPlanetInBhav[iPlanetNo-1] + "\n";
	}

	String strAspect = "";

	myAstrologyObject.initializePlanetAspectToForShodashvargaDivision(iPlanetNo, iShodhashvargaPosition);
	int[] arrAspectNo = myAstrologyObject.getAspectToBhav();
	String[] arrAspectValue = myAstrologyObject.getAspectValueToBhav();

	for(int icount = 0;icount<=arrAspectNo.length-1;icount++)
	{
		strAspect = strAspect.equals("")? "" : strAspect + ", ";
		strAspect = strAspect + arrAspectNo[icount] + ":" + arrAspectValue[icount];
	}
	  
	strDescription = strDescription + "Aspect On " + strAspect + "\n";


  	String[] arrplanetstrAspectOn = strAspect.split(",");
  	String planetstrAspectOnValues = "[\"";
  	for(int icount = 0;icount<=arrplanetstrAspectOn.length-1;icount++)
  	{
    	planetstrAspectOnValues = planetstrAspectOnValues + arrplanetstrAspectOn[icount].trim() +"\",\"";
  	}
  	planetstrAspectOnValues = planetstrAspectOnValues.substring(0,planetstrAspectOnValues.length()-2);
  	planetstrAspectOnValues = planetstrAspectOnValues+"]";


	String strAspectFrom = "";
	int[] arrAspectFrom = myAstrologyObject.getPlanetAspectFromShodashvargaDivision(iPlanetNo, iShodhashvargaPosition);

	for(int icount = 0;icount<=arrAspectFrom.length-1;icount++)
	{
	  if(arrAspectFrom[icount] == 1)
	  {
	    strAspectFrom = strAspectFrom.equals("")? "" : strAspectFrom + ", ";
	    strAspectFrom = strAspectFrom + Common.arrLongPlanetName[icount];
	  }
	}

	String RashiName = "";
	if(planetLangCode == 1)
	{
	  RashiName = myAstrologyObject.getPlanetaryRasiNameForShodashvargaDivision(iPlanetNo, iShodhashvargaPosition).replace("\"","");
	}
	else
	{
	  RashiName = myAstrologyObject.getPlanetaryRasiNameForShodashvargaDivision(iPlanetNo, iShodhashvargaPosition) ;
	}

	if(!strAspectFrom.equals(""))
	{
	  String[] arrplanetstrAspectFrom = strAspectFrom.split(",");
	  String planetstrAspectFromValues = "[\"";
	  for(int icount = 0;icount<=arrplanetstrAspectFrom.length-1;icount++)
	  {
	    planetstrAspectFromValues = planetstrAspectFromValues + arrplanetstrAspectFrom[icount].trim()+"\",\"";
	  }
	  planetstrAspectFromValues = planetstrAspectFromValues.substring(0,planetstrAspectFromValues.length()-2);
	  planetstrAspectFromValues = planetstrAspectFromValues+"]";
	  
	  strDescription = strDescription + "Aspect From " + strAspectFrom + " full";
	  
	  PlanetJson = "{\"ChartType\": \""+ strKundliType +"\",\"PlanetName\":\""+ Common.arrLongPlanetName[iPlanetNo - 1] +"\",\"Sign\":\""+ RashiName +"\",\"Relationship\":\""+ getRelationshipInString(iRelationship) +"\",\"LordOf\":"+ strHouseLordjsonarr +",\"House\":\""+ arrPlanetInBhav[iPlanetNo - 1] +"\",\"Aspects\":"+ planetstrAspectOnValues +",\"AspectsFrom\":"+planetstrAspectFromValues+"}";
	} 
	else 
	{
	  strDescription = strDescription + "Aspect From  ";
	  strAspectFrom = "Null";
	  PlanetJson = "{\"ChartType\": \""+ strKundliType +"\",\"PlanetName\":\""+ Common.arrLongPlanetName[iPlanetNo - 1] +"\",\"Sign\":\""+ RashiName +"\",\"Relationship\":\""+ getRelationshipInString(iRelationship) +"\",\"LordOf\":"+ strHouseLordjsonarr +",\"House\":\""+ arrPlanetInBhav[iPlanetNo - 1] +"\",\"Aspects\":"+ planetstrAspectOnValues +",\"AspectsFrom\":\""+ strAspectFrom +"\"}";
	} 

	return strDescription;
}

public int getcorrespondingValueforKundliType(String strKundliType )
{
	int returnVal = 0;
	for(int i=0;i<=11;i++)
	{
		if(strKundliType.equals(Common.arrKundliType[i]))
		{
			returnVal = i;
			break;
		}
	}
	return returnVal;
}

public String getRelationshipInString(int iRelationship)
{
	String strReturnValue = "-";
	if(iRelationship > 0 && iRelationship <= 6)
		strReturnValue = Common.relationship[iRelationship-1];
	return strReturnValue;
}
%>
