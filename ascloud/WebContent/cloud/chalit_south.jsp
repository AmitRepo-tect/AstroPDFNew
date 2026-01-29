<%@page import="com.cslsoftware.util.UtilDesktop"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
DesktopHoro myAstrologyObject = (DesktopHoro)session.getAttribute("HoroscopeObj");
  double ChalitPlanetLongitude=0;
  double ChalitPlanetLongitude1=0;
  double ChalitCuspLongitude=0;
  double ChalitCuspLongitude1=0;
  double[] combined = new double[25];
  double[] combined1 = new double[25];

    int temp1 = 0;
    int temp2  = 0;
    int temp3 = 0;
    int temp4 = 0;
    int temp5 = 0;
    int temp6 = 0;
    int temp7= 0;
    int temp8  = 0;
    int temp9 = 0;
    int temp10 = 0;
    int temp11= 0;
    int temp12 = 0;
    double temp = 0;
    int[] home1 = new int[24];
    int[] home2 = new int[24];
    int[] home3 = new int[24];
    int[] home4 = new int[24];
    int[] home5 = new int[24];
    int[] home6 = new int[24];
    int[] home7 = new int[24];
    int[] home8 = new int[24];
    int[] home9 = new int[24];
    int[] home10 = new int[24];
    int[] home11 = new int[24];
    int[] home12 = new int[24];
    
    double[] temphome1 = new double[24];
    double[] temphome2 = new double[24];
    double[] temphome3 = new double[24];
    double[] temphome4 = new double[24];
    double[] temphome5 = new double[24];
    double[] temphome6 = new double[24];
    double[] temphome7 = new double[24];
    double[] temphome8 = new double[24];
    double[] temphome9 = new double[24];
    double[] temphome10 = new double[24];
    double[] temphome11 = new double[24];
    double[] temphome12 = new double[24];
    
    int[] finalhome1 = new int[24];
    int[] finalhome2 = new int[24];
    int[] finalhome3 = new int[24];
    int[] finalhome4 = new int[24];
    int[] finalhome5 = new int[24];
    int[] finalhome6 = new int[24];
    int[] finalhome7 = new int[24];
    int[] finalhome8 = new int[24];
    int[] finalhome9 = new int[24];
    int[] finalhome10 = new int[24];
    int[] finalhome11 = new int[24];
    int[] finalhome12 = new int[24];
    
    String array1="";
    String array2="";
    String array3="";
    String array4="";
    String array5="";
    String array6="";
    String array7="";
    String array8="";
    String array9="";
    String array10="";
    String array11="";
    String array12="";
    
    for(int i = 1;i<=12;i++)
    {

       ChalitPlanetLongitude = myAstrologyObject.getPlanetaryLongitude(i)  / 30 ;
       combined[i] = ChalitPlanetLongitude +1;
       ChalitCuspLongitude = myAstrologyObject.getMidBhavForBhava(i) / 30 ;
       combined[i+12] = ChalitCuspLongitude +1;
       ChalitPlanetLongitude1 = myAstrologyObject.getPlanetaryLongitude(i);
       combined1[i]    = ChalitPlanetLongitude1;
       ChalitCuspLongitude1 = myAstrologyObject.getMidBhavForBhava(i);
       combined1[i + 12] = ChalitCuspLongitude1;
     // out.println(combined[i]+","+combined[i+12]+"<br/>");

    }  


       for(int i = 0;i<=23;i++)
       {
	       combined[i] = (int)(combined[i+1]);
	       combined1[i] = combined1[i+1];
       } 

       

       for(int i = 0;i<=23;i++)
       {
       	for(int j=1;j<=12;j++)
       	{
       		if(combined[i] == j)
       		{
       			if(j==1)
       			{
       				home1[temp1] = i;
       				temp1++;
       			}
       			else if(j==2)
       			{
       				home2[temp2] = i;
       				temp2++;
       			}
       			else if(j==3)
       			{
       				home3[temp3] = i;
       				temp3++;
       			}
       			else if(j==4)
       			{
       				home4[temp4] = i;
       				temp4++;
       			}
       			else if(j==5)
       			{
       				home5[temp5] = i;
       				temp5++;
       			}
       			else if(j==6)
       			{
       				home6[temp6] = i;
       				temp6++;
       			}
       			else if(j==7)
       			{
       				home7[temp7] = i;
       				temp7++;
       			}
       			else if(j==8)
       			{
       				home8[temp8] = i;
       				temp8++;
       			}
       			else if(j==9)
       			{
       				home9[temp9] = i;
       				temp9++;
       			}
       			else if(j==10)
       			{
       				home10[temp10] = i;
       				temp10++;
       			}
       			else if(j==11)
       			{
       				home11[temp11] = i;
       				temp11++;
       			}
       			else if(j==12)
       			{
       				home12[temp12] = i;
       				temp12++;
       			}
       			break;
       		}
       	}
       }
       
       for(int tempj=0;tempj<=temp1-1;tempj++)
       {
       	temphome1[tempj] = combined1[home1[tempj]];
       }
       for(int tempj=0;tempj<=temp2-1;tempj++)
       {
       	temphome2[tempj] = combined1[home2[tempj]];
       }
       for(int tempj=0;tempj<=temp3-1;tempj++)
       {
       	temphome3[tempj] = combined1[home3[tempj]];
       }
       for(int tempj=0;tempj<=temp4-1;tempj++)
       {
       	temphome4[tempj] = combined1[home4[tempj]];
       }
       for(int tempj=0;tempj<=temp5-1;tempj++)
       {
       	temphome5[tempj] = combined1[home5[tempj]];
       }
       for(int tempj=0;tempj<=temp6-1;tempj++)
       {
       	temphome6[tempj] = combined1[home6[tempj]];
       }
       for(int tempj=0;tempj<=temp7-1;tempj++)
       {
       	temphome7[tempj] = combined1[home7[tempj]];
       }
       for(int tempj=0;tempj<=temp8-1;tempj++)
       {
       	temphome8[tempj] = combined1[home8[tempj]];
       }
       for(int tempj=0;tempj<=temp9-1;tempj++)
       {
       	temphome9[tempj] = combined1[home9[tempj]];
       }
       for(int tempj=0;tempj<=temp10-1;tempj++)
       {
       	temphome10[tempj] = combined1[home10[tempj]];
       }
       for(int tempj=0;tempj<=temp11-1;tempj++)
       {
       	temphome11[tempj] = combined1[home11[tempj]];
       }
       for(int tempj=0;tempj<=temp12-1;tempj++)
       {
       	temphome12[tempj] = combined1[home12[tempj]];
       }

       //----------------------------------
       for(int i=0;i<=temp1-1;i++)
       {
       	for(int j=1;j<=temp1-1;j++)
       	{
       		if(temphome1[i] > temphome1[j])
       		{
       			temp = temphome1[i];
       			temphome1[i] = temphome1[j];
       			temphome1[j] = temp;
       			break;
       		}
       	}
       }
       for(int i=0;i<=temp2-1;i++)
       {
       	for(int j=1;j<=temp2-1;j++)
       	{
       		if(temphome2[i] > temphome2[j])
       		{
       			temp = temphome2[i];
       			temphome2[i] = temphome2[j];
       			temphome2[j] = temp;
       			break;
       		}
       	}
       }
       for(int i=0;i<=temp3-1;i++)
       {
       	for(int j=1;j<=temp3-1;j++)
       	{
       		if(temphome3[i] > temphome3[j])
       		{
       			temp = temphome3[i];
       			temphome3[i] = temphome3[j];
       			temphome3[j] = temp;
       			break;
       		}
       	}
       }
       for(int i=0;i<=temp4-1;i++)
       {
       	for(int j=1;j<=temp4-1;j++)
       	{
       		if(temphome4[i] > temphome4[j])
       		{
       			temp = temphome4[i];
       			temphome4[i] = temphome4[j];
       			temphome4[j] = temp;
       			break;
       		}
       	}
       }
       for(int i=0;i<=temp5-1;i++)
       {
       	for(int j=1;j<=temp5-1;j++)
       	{
       		if(temphome5[i] > temphome5[j])
       		{
       			temp = temphome5[i];
       			temphome5[i] = temphome5[j];
       			temphome5[j] = temp;
       			break;
       		}
       	}
       }
       for(int i=0;i<=temp6-1;i++)
       {
       	for(int j=1;j<=temp6-1;j++)
       	{
       		if(temphome6[i] > temphome6[j])
       		{
       			temp = temphome6[i];
       			temphome6[i] = temphome6[j];
       			temphome6[j] = temp;
       			break;
       		}
       	}
       }
       for(int i=0;i<=temp7-1;i++)
       {
       	for(int j=1;j<=temp7-1;j++)
       	{
       		if(temphome7[i] > temphome7[j])
       		{
       			temp = temphome7[i];
       			temphome7[i] = temphome7[j];
       			temphome7[j] = temp;
       			break;
       		}
       	}
       }
       for(int i=0;i<=temp8-1;i++)
       {
       	for(int j=1;j<=temp8-1;j++)
       	{
       		if(temphome8[i] > temphome8[j])
       		{
       			temp = temphome8[i];
       			temphome8[i] = temphome8[j];
       			temphome8[j] = temp;
       			break;
       		}
       	}
       }
       for(int i=0;i<=temp9-1;i++)
       {
       	for(int j=1;j<=temp9-1;j++)
       	{
       		if(temphome9[i] > temphome9[j])
       		{
       			temp = temphome9[i];
       			temphome9[i] = temphome9[j];
       			temphome9[j] = temp;
       			break;
       		}
       	}
       }
       for(int i=0;i<=temp10-1;i++)
       {
       	for(int j=1;j<=temp10-1;j++)
       	{
       		if(temphome10[i] > temphome10[j])
       		{
       			temp = temphome10[i];
       			temphome10[i] = temphome10[j];
       			temphome10[j] = temp;
       			break;
       		}
       	}
       }
       for(int i=0;i<=temp11-1;i++)
       {
       	for(int j=1;j<=temp11-1;j++)
       	{
       		if(temphome11[i] > temphome11[j])
       		{
       			temp = temphome11[i];
       			temphome11[i] = temphome11[j];
       			temphome11[j] = temp;
       			break;
       		}
       	}
       }
       for(int i=0;i<=temp12-1;i++)
       {
       	for(int j=1;j<=temp12-1;j++)
       	{
       		if(temphome12[i] > temphome12[j])
       		{
       			temp = temphome12[i];
       			temphome12[i] = temphome12[j];
       			temphome12[j] = temp;
       			break;
       		}
       	}
       }

       //-----------------------------------
       for(int i=0;i<=temp1-1;i++)
       {
       	for(int j=0;j<=23;j++)
       	{
       		if(temphome1[i] == combined1[j])
       		{
       			finalhome1[i] = j;
       			break;
       		}
       	}
       }

       for(int i=0;i<=temp2-1;i++)
       {
       	for(int j=0;j<=23;j++)
       	{
       		if(temphome2[i] == combined1[j])
       		{
       			finalhome2[i] = j;
       			break;
       		}
       	}
       }

       for(int i=0;i<=temp3-1;i++)
       {
       	for(int j=0;j<=23;j++)
       	{
       		if(temphome3[i] == combined1[j])
       		{
       			finalhome3[i] = j;
       			break;
       		}
       	}
       }

       for(int i=0;i<=temp4-1;i++)
       {
       	for(int j=0;j<=23;j++)
       	{
       		if(temphome4[i] == combined1[j])
       		{
       			finalhome4[i] = j;
       			break;
       		}
       	}
       }

       for(int i=0;i<=temp5-1;i++)
       {
       	for(int j=0;j<=23;j++)
       	{
       		if(temphome5[i] == combined1[j])
       		{
       			finalhome5[i] = j;
       			break;
       		}
       	}
       }

       for(int i=0;i<=temp6-1;i++)
       {
       	for(int j=0;j<=23;j++)
       	{
       		if(temphome6[i] == combined1[j])
       		{
       			finalhome6[i] = j;
       			break;
       		}
       	}
       }

       for(int i=0;i<=temp7-1;i++)
       {
       	for(int j=0;j<=23;j++)
       	{
       		if(temphome7[i] == combined1[j])
       		{
       			finalhome7[i] = j;
       			break;
       		}
       	}
       }

       for(int i=0;i<=temp8-1;i++)
       {
       	for(int j=0;j<=23;j++)
       	{
       		if(temphome8[i] == combined1[j])
       		{
       			finalhome8[i] = j;
       			break;
       		}
       	}
       }

       for(int i=0;i<=temp9-1;i++)
       {
       	for(int j=0;j<=23;j++)
       	{
       		if(temphome9[i] == combined1[j])
       		{
       			finalhome9[i] = j;
       			break;
       		}
       	}
       }

       for(int i=0;i<=temp10-1;i++)
       {
       	for(int j=0;j<=23;j++)
       	{
       		if(temphome10[i] == combined1[j])
       		{
       			finalhome10[i] = j;
       			break;
       		}
       	}
       }

       for(int i=0;i<=temp11-1;i++)
       {
       	for(int j=0;j<=23;j++)
       	{
       		if(temphome11[i] == combined1[j])
       		{
       			finalhome11[i] = j;
       			break;
       		}
       	}
       }

       for(int i=0;i<=temp12-1;i++)
       {
       	for(int j=0;j<=23;j++)
       	{
       		if(temphome12[i] == combined1[j])
       		{
       			finalhome12[i] = j;
       			break;
       		}
       	}
       }

       UtilDesktop objUtil = new UtilDesktop();

       for(int i=0;i<=temp1-1;i++)
       {
       	array1  = array1+"'val"+(i+1)+"':'"+finalhome1[i]+"#"+objUtil.dms1(GetReminderInRasi(combined1[finalhome1[i]]))+"',";
       }
       array1 = array1.replaceAll(",$", "");   
       for(int i=0;i<=temp2-1;i++)
       {
       	array2  = array2+"'val"+(i+1)+"':'"+finalhome2[i]+"#"+objUtil.dms1(GetReminderInRasi(combined1[finalhome2[i]]))+"',";
       }
       array2 = array2.replaceAll(",$", "");
       for(int i=0;i<=temp3-1;i++)
       {
       	array3  = array3+"'val"+(i+1)+"':'"+finalhome3[i]+"#"+objUtil.dms1(GetReminderInRasi(combined1[finalhome3[i]]))+"',";
       }
       array3 = array3.replaceAll(",$", "");
       for(int i=0;i<=temp4-1;i++)
       {
       	array4  = array4+"'val"+(i+1)+"':'"+finalhome4[i]+"#"+objUtil.dms1(GetReminderInRasi(combined1[finalhome4[i]]))+"',";
       }
       array4 = array4.replaceAll(",$", "");
       for(int i=0;i<=temp5-1;i++)
       {
       	array5  = array5+"'val"+(i+1)+"':'"+finalhome5[i]+"#"+objUtil.dms1(GetReminderInRasi(combined1[finalhome5[i]]))+"',";
       }
       array5 = array5.replaceAll(",$", "");
       for(int i=0;i<=temp6-1;i++)
       {
       	array6  = array6+"'val"+(i+1)+"':'"+finalhome6[i]+"#"+objUtil.dms1(GetReminderInRasi(combined1[finalhome6[i]]))+"',";
       }
       array6 = array6.replaceAll(",$", "");
       for(int i=0;i<=temp7-1;i++)
       {
       	array7  = array7+"'val"+(i+1)+"':'"+finalhome7[i]+"#"+objUtil.dms1(GetReminderInRasi(combined1[finalhome7[i]]))+"',";
       }
       array7 = array7.replaceAll(",$", "");
       for(int i=0;i<=temp8-1;i++)
       {
       	array8  = array8+"'val"+(i+1)+"':'"+finalhome8[i]+"#"+objUtil.dms1(GetReminderInRasi(combined1[finalhome8[i]]))+"',";
       }
       array8 = array8.replaceAll(",$", "");
       for(int i=0;i<=temp9-1;i++)
       {
       	array9  = array9+"'val"+(i+1)+"':'"+finalhome9[i]+"#"+objUtil.dms1(GetReminderInRasi(combined1[finalhome9[i]]))+"',";
       }
       array9 = array9.replaceAll(",$", "");
       for(int i=0;i<=temp10-1;i++)
       {
       	array10  = array10+"'val"+(i+1)+"':'"+finalhome10[i]+"#"+objUtil.dms1(GetReminderInRasi(combined1[finalhome10[i]]))+"',";
       }
       array10 = array10.replaceAll(",$", "");
       for(int i=0;i<=temp11-1;i++)
       {
       	array11  = array11+"'val"+(i+1)+"':'"+finalhome11[i]+"#"+objUtil.dms1(GetReminderInRasi(combined1[finalhome11[i]]))+"',";
       }
       array11 = array11.replaceAll(",$", "");
       for(int i=0;i<=temp12-1;i++)
       {
       	array12  = array12+"'val"+(i+1)+"':'"+finalhome12[i]+"#"+objUtil.dms1(GetReminderInRasi(combined1[finalhome12[i]]))+"',";
       }
       array12 = array12.replaceAll(",$", "");
         
       %>
<%!

       public double GetReminderInRasi(double degree)
       {
       	return degree - (int)((degree / 30)) * 30.0;
       }
       %>