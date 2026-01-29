package com.ojassoft.astrosagecloud.util;

import java.util.Calendar;
import java.util.GregorianCalendar;

import com.cslsoftware.desktophoro.DesktopHoro;
import com.ojassoft.astrosagecloud.localization.MyProperties;
import com.ojassoft.astrosagecloud.localization.MyResourceBundle;

import astrosage.south.matchmaking.*;

public class PoruthamMatchingFunctions 
{
	UpdateCalculatePorutham ObjSouthkundli = new UpdateCalculatePorutham();

	public String getRasiName(int RasiNumber)
	{
	    int getRasiIndex = ObjSouthkundli.getRasi(RasiNumber);
	    return Common.RasiName[getRasiIndex];
	}

	public String getRasiAdhipathiName(int RasiNumber)
	{
	    int getRasiAdhipathiIndex = ObjSouthkundli.getRashiAdhipathi(RasiNumber);
	    return Common.RasiAdhipathiName[getRasiAdhipathiIndex];
	}

	public String getVasiyaName(int RasiNumber)
	{
		int getVasiyaIndex = ObjSouthkundli.getVasiya(RasiNumber);
		return Common.VasiyaName[getVasiyaIndex];
	}

	public String getMahendraName(int NakNumber)
	{
		int getMahendraIndex = ObjSouthkundli.getMahendra(NakNumber);
		return Common.MahendraName[getMahendraIndex];
	}

	public String getGanaName(int NakNumber)
	{
		int getGanaIndex = ObjSouthkundli.getGana(NakNumber);
		return Common.GanaName[getGanaIndex];
	}

	public String getYoniName(int NakNumber)
	{
		int getYoniIndex = ObjSouthkundli.getYoni(NakNumber);
		return Common.YoniName[getYoniIndex];
	}

	public String getDhinaName(int NakNumber)
	{
		int getDhinaIndex = ObjSouthkundli.getDhina(NakNumber);
		return Common.DhinaName[getDhinaIndex];
	}

	public String getSthreeDheerkamName(int NakNumber)
	{
		int getSthreeDheerkamIndex = ObjSouthkundli.getSthreeDheerkam(NakNumber);
		return Common.SthreeDheerkamName[getSthreeDheerkamIndex];
	    
	}

	public String getRajjuName(int NakNumber)
	{
		int RajjuIndex = ObjSouthkundli.getRajju(NakNumber);
		return Common.RajjuName[RajjuIndex];
	}

	public String getVedhaiName(int NakNumber)
	{
		int getVedhaiIndex = ObjSouthkundli.getVedhai(NakNumber);
		return Common.VedhaiName[getVedhaiIndex];
	}

	//---------------Matchmaking Methods---------------------------

	public double getRasiMatchResultValue(int BoyRasi, int GirlRasi)
	{
		double rasireturnval = ObjSouthkundli.getRasiPoruthamMatchResultValue(BoyRasi, GirlRasi);
	    //When girl and boy rasi difference is 7, this case is not handled in dll, hence this case is handled on asp pages of porutham result.
	   //'Now this case is solved in jar file under SouthKundliMilan project but still remain to solve in dll.
	    
	    if (rasireturnval == 0.5)
	    	rasireturnval = 1.0;
	    return rasireturnval;
	}

	public double getRasiAdhipathiMatchResultValue(int BoyRasi, int GirlRasi)
	{
	    return ObjSouthkundli.getRasiAdhipathiPoruthamMatchResultValue(BoyRasi, GirlRasi);
	}

	public double getVasiyaMatchResultValue(int BoyRasi, int GirlRasi)
	{
	    return ObjSouthkundli.getVasiyaPoruthamMatchResultValue(BoyRasi, GirlRasi);
	}

	public double getMahendraMatchResultValue(int BoyNakNum, int GirlNakNum)
	{
	    return ObjSouthkundli.getMahendraMatchResultValue(BoyNakNum,GirlNakNum);
	}

	public double getGanaMatchResultValue(int BoyNakNum, int GirlNakNum)
	{
	    return ObjSouthkundli.getGanaPoruthamMatchResultValue(BoyNakNum, GirlNakNum);
	}

	public double getYoniMatchResultValue(int BoyNakNum, int GirlNakNum)
	{
	    return ObjSouthkundli.getYoniPoruthamMatchResultValue(BoyNakNum,GirlNakNum);
	}

	public double getDhinaMatchResultValue(int BoyRasi, int GirlRasi, int BoyNakNum, int GirlNakNum, int BoyNakCharan, int GirlNakCharan)
	{
	    return ObjSouthkundli.getDhinaPoruthamMatchResultValue_PROKERALA(BoyRasi, GirlRasi, BoyNakNum, GirlNakNum, BoyNakCharan, GirlNakCharan);
	}

	public double getSthreeDheerkamMatchResultValue(int BoyNakNum, int GirlNakNum)
	{
	    return ObjSouthkundli.getSthreeDheerkamMatchResultValue_PROKERALA(BoyNakNum,GirlNakNum);
	}

	public double getRajjuMatchResultValue(int BoyNakNum, int GirlNakNum)
	{
	    return ObjSouthkundli.getRajjuMatchResultValue_PROKERALA(BoyNakNum,GirlNakNum);
	}
		
	public double getVedhaiMatchResultValue(int BoyNakNum, int GirlNakNum)
	{
	    return ObjSouthkundli.getVedhaiMatchResultValue(BoyNakNum,GirlNakNum);
	}

	//---------------Description Methods---------------------------

	public int getRasiPoruthamDescription(int BoyRasi, int GirlRasi)
	{
	    int descriptioncodereturnval = ObjSouthkundli.getRasiPoruthamDescriptionCode(BoyRasi, GirlRasi);
	    //When girl and boy rasi difference is 7 then dll gives -1 code, now this case is solve in jar file but still remain to solve in dll.
	    //Hence this case is handled on asp pages of porutham result
	    if(descriptioncodereturnval == -1)       
	    	descriptioncodereturnval = 2;        
	    return descriptioncodereturnval;
	}

	public int getRasiAdhipathiPoruthamDescription(int BoyRasi, int GirlRasi)
	{
	    return ObjSouthkundli.getRasiAdhipathiPoruthamDescriptionCode(BoyRasi, GirlRasi);
	}

	public int getVasiyaPoruthamDescription(int BoyRasi, int GirlRasi)
	{
	    return ObjSouthkundli.getVasiyaPoruthamDescriptionCode(BoyRasi, GirlRasi);
	}

	public int getMahendraDescription(int BoyNakNum, int GirlNakNum)
	{
	    return ObjSouthkundli.getMahendraDescriptionCode(BoyNakNum,GirlNakNum);
	}

	public int getGanaPoruthamDescription(int BoyNakNum, int GirlNakNum)
	{
	    return ObjSouthkundli.getGanaPoruthamDescriptionCode(BoyNakNum, GirlNakNum);
	}

	public int getYoniPoruthamDescription(int BoyNakNum, int GirlNakNum)
	{
	    return ObjSouthkundli.getYoniPoruthamDescriptionCode(BoyNakNum,GirlNakNum);
	}

	public int getDhinaPoruthamDescription(int BoyRasi, int GirlRasi, int BoyNakNum, int GirlNakNum, int BoyNakCharan, int GirlNakCharan)
	{
	    return ObjSouthkundli.getDhinaPoruthamDescriptionCode_PROKERALA(BoyRasi, GirlRasi, BoyNakNum, GirlNakNum, BoyNakCharan, GirlNakCharan);
	}

	public int getSthreeDheerkamDescription(int BoyNakNum, int GirlNakNum)
	{
	    return ObjSouthkundli.getSthreeDheerkamDescriptionCode_PROKERALA(BoyNakNum,GirlNakNum);
	}

	public int getRajjuDescription(int BoyNakNum, int GirlNakNum)
	{
	    return ObjSouthkundli.getRajjuDescriptionCode_PROKERALA(BoyNakNum,GirlNakNum);
	}
		
	public int getVedhaiDescription(int BoyNakNum, int GirlNakNum)
	{
	    return ObjSouthkundli.getVedhaiDescriptionCode(BoyNakNum,GirlNakNum);
	}

	public int getPapasamyamValue(int[] arrPlanetsShodashvargaMF)
	{
		int papasamyamCount = 0;
	    //Dim Planethouse(12),ascSign(2),arrPapasamyamPlanet
	    //Planet code for papasamya are Sun (0), Mars (2), Saturn(6), Rahu(7), Ketu(8)
	   int[] arrPapasamyamPlanet = {0,2,6,7,8};
	   int[] ascSign = new int[3];
	   
	    ascSign[0] = arrPlanetsShodashvargaMF[0];
	    ascSign[1] = arrPlanetsShodashvargaMF[2];
	    ascSign[2] = arrPlanetsShodashvargaMF[6];
	    int[] Planethouse = new int[9];
	    for(int lagnaval = 1;lagnaval<=3;lagnaval++)
	    {
	        for(int planet = 1;planet<=9;planet++)
	        {
	            Planethouse[planet-1] = GetPlanetInBhava(ascSign[lagnaval-1], arrPlanetsShodashvargaMF[planet]);
	        }  
	        for(int planet = 0;planet<=4;planet++)
	        {
	           if( GetPapasamyam(Planethouse[arrPapasamyamPlanet[planet]]))
	        	   papasamyamCount = papasamyamCount + 1;
	            
	        }    
	    }
	    return papasamyamCount;
	}
	
	public int GetPlanetInBhava(int AscendentPosition , int planetPosition ) 
    {
	    int tempBhava = planetPosition - AscendentPosition + 1;
	    if( tempBhava <= 0 ) 
	    {
	    	tempBhava = tempBhava + 12;
	    }
	    return tempBhava;
    }

	public boolean GetPapasamyam(int PlanetHouseNumber)
	{
		boolean PlanetPapasamyam = false;
   
		if(PlanetHouseNumber == 1 || PlanetHouseNumber == 2 || PlanetHouseNumber == 4 || PlanetHouseNumber == 7 || PlanetHouseNumber == 8 || PlanetHouseNumber == 12)
		      PlanetPapasamyam = true;
   
   
    return PlanetPapasamyam;
	}
	
	public int PlanetNumber(String PlanetName)
	{
		int PlanetNumber = 0;
		if(PlanetName.equals("SUN") || PlanetName.equals("lw;"))
		{
			PlanetNumber = 1;
		}
		else if(PlanetName.equals("MON") || PlanetName.equals("pan"))
		{
			PlanetNumber = 2;
		}
		else if(PlanetName.equals("MAR") || PlanetName.equals("eax"))
		{
			PlanetNumber = 3;
		}
		else if(PlanetName.equals("MER") || PlanetName.equals("cq/"))
		{
			PlanetNumber = 4;
		}
		else if(PlanetName.equals("JUP") || PlanetName.equals("xq:"))
		{
			PlanetNumber = 5;
		}
		else if(PlanetName.equals("VEN") || PlanetName.equals("'kq"))
		{
			PlanetNumber = 6;
		}
		else if(PlanetName.equals("SAT") || PlanetName.equals("'kf"))
		{
			PlanetNumber = 7;
		}
		else if(PlanetName.equals("RAH") || PlanetName.equals("jkg"))
		{
			PlanetNumber = 8;
		}
		else if(PlanetName.equals("KET") || PlanetName.equals("dsr"))
		{
			PlanetNumber = 9;
		}
	    return PlanetNumber;
    
	}

	public String GetCurrentMahaDasa(DesktopHoro objHoro, int langCode, MyProperties rbConst) 
	{
		String YourCurrentDasha = "";
		String YoB = String.valueOf(objHoro.getYearOfBirth());  
		String prefixYoB = YoB.substring(0, 2);
			   // Dim myPlanetNames, YourCurrentDasha, dasa, dasaLord, dasaLordNumber, dasaTill, dasaFrom
			      
		String[] myPlanetNames = {"SUN","MOON","MARS","MERCURY","JUPITER","VENUS","SATURN","RAHU","KETU"};
		
		for(int i=1;i<=9;i++)
		{
			String dasa = objHoro.getMahaDasa(i-1);
			String dasaLord = dasa.substring(0,3);
			int dasaLordNumber = PlanetNumber(dasaLord);
			String dasaTill = dasa.substring(dasa.length()-10);
			String dasaFrom= "";
			if(i==1)
			{
				dasaFrom = "00";
			}
			else
			{
				String mahadasa=objHoro.getMahaDasa(i-2);
				dasaFrom = mahadasa.substring(mahadasa.length()-8);
			}
			if(!dasaFrom.equals("00"))
			{
				if(Integer.valueOf(dasaFrom.substring(dasaFrom.length()-2)) > Integer.valueOf(dasaTill.substring(dasaTill.length()-2)))
				{
					dasaFrom = GetDateNew(dasaFrom, prefixYoB, langCode, rbConst);
					prefixYoB= prefixYoB + 1;
					dasaTill = GetDateNew(dasaTill, prefixYoB, langCode, rbConst);
				}
				else
				{
					dasaFrom = GetDateNew(dasaFrom, prefixYoB, langCode, rbConst);;
					dasaTill = GetDateNew(dasaTill, prefixYoB, langCode, rbConst);
				}
			}
			else
			{
				String yobString = String.valueOf(YoB);
				if(Integer.valueOf(yobString.substring(yobString.length() - 2)) > Integer.valueOf(dasaTill.substring(dasaTill.length() - 2)))
				{
					prefixYoB = prefixYoB + 1;
					dasaTill = GetDateNew(dasaTill, prefixYoB, langCode, rbConst);
				}
				else
				{
					dasaTill = GetDateNew(dasaTill, prefixYoB, langCode, rbConst);
				}
			
			}
			if(dasaFrom.length() > 4)
			{
			Calendar cal = Calendar.getInstance();
			//int currentDate = cal.get(Calendar.DATE);
			//int currentMonth = cal.get(Calendar.MONTH); 
			int currentYear = cal.get(Calendar.YEAR);
			if(currentYear >= Integer.valueOf(dasaFrom.substring(dasaFrom.length() - 4)) && currentYear < Integer.valueOf(dasaTill.substring(dasaTill.length() - 4)))
			{
				YourCurrentDasha = rbConst.getString(myPlanetNames[dasaLordNumber-1])+", "+dasaFrom+" - "+dasaTill;
			}
			else if(currentYear == Integer.valueOf(dasaTill.substring(dasaTill.length() - 4)))
			{
				//String dateDasa = dasa.substring(dasa.length() - 10);
				//String[] dateVal = dateDasa.split("/");
				//int dateVal0Int = Integer.valueOf(dateVal[0]);
				//int dateVal1Int = Integer.valueOf(dateVal[1]);
				
				YourCurrentDasha = rbConst.getString(myPlanetNames[dasaLordNumber-1])+", "+dasaFrom+" - "+dasaTill;
				
				//Did not convert the following code because all the conditions seem to set just what is set above.
				/*if(currentDate < dateVal0Int)
				{
					YourCurrentDasha = rbConst.getString(myPlanetNames[dasaLordNumber-1])+", "+dasaFrom+" - "+dasaTill;
				}
				else if(currentMonth == dateVal1Int)
				{
					if(currentDate < dateVal0Int)
					{
						
					}
				}*/
						
			}
			if(!YourCurrentDasha.equals(""))
			{
				break;
			}
			}
		}
			                
			            /*If int(Year(Date)) >= int(Right(dasaFrom,4)) And int(Year(Date)) < int(Right(dasaTill,4)) Then
			                YourCurrentDasha = GetString(myPlanetNames(dasaLordNumber-1)) &", "& dasaFrom & " - " & dasaTill
			            ElseIf int(Year(Date)) = int(Right(dasaTill,4)) Then
			                datedasa = Right(objHoroFeMale.getMahaDasa(i-1), 10)
			                datval = split(datedasa,"/")
			                currdate = split(Date,"/")
			                
			                If int(currdate(1)) < int(datval(1)) Then
			                    YourCurrentDasha = GetString(myPlanetNames(dasaLordNumber-1)) &", "& dasaFrom & " - " & dasaTill
			                ElseIf int(currdate(1)) = int(datval(1)) Then
			                    If int(currdate(0)) < int(datval(0)) Then
			                        YourCurrentDasha = GetString(myPlanetNames(dasaLordNumber-1)) &", "& dasaFrom & " - " & dasaTill
			                    End If
			                End If
			            End If
			            If YourCurrentDasha <> "" Then 
			                Exit For
			            End If
			    Next*/
		//return "";
		return YourCurrentDasha;
	}
	public String GetCurrentMahaDasaforFeMale() 
	{
		return "";
	}
	public String Getbalanceofdasa(String dasabal, MyResourceBundle properties)
	{
	    String[] dasabalarr = dasabal.split(" ");
	    return properties.getString(dasabalarr[0])+" "+dasabalarr[1]+" "+dasabalarr[2]+" "+dasabalarr[3]+" "+dasabalarr[4]+" "+dasabalarr[5]+" "+dasabalarr[6];
	    
	}
	
	public String GetDateNew(String dateval,String PrefixYoB, int langCode, MyProperties rbConst)
	{
	    String[] datev = dateval.split("/");
	    Util util = new Util();
	    return util.fullMonthName(Integer.valueOf(datev[1].trim()),langCode, rbConst)+" "+datev[0]+", "+PrefixYoB+datev[2];
	}

}
