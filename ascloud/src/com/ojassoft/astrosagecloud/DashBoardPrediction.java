package com.ojassoft.astrosagecloud;

import java.awt.Desktop;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;




import com.astrocamp.sms.RequestProcessing;
import com.cslsoftware.desktophoro.DesktopHoro;
import com.cslsoftware.util.Constants;
import com.ojassoft.astrosagecloud.Panchang.AajKaPanchangData;
import com.ojassoft.astrosagecloud.util.Common;
import com.ojassoft.astrosagecloud.util.SharedFunction;
import com.ojassoft.astrosagecloud.util.Util;
import com.ojassoft.panchang.Masa;
import com.ojassoft.panchang.Muhurta;
import com.ojassoft.panchang.Place;

public class DashBoardPrediction {
	static int houseLord;
	Calendar cal = Calendar.getInstance(); 
	// DashBoardPrediction DB = new DashBoardPrediction();
	
	public static void main(String[] args) {
	 DesktopHoro myHoroObject = createHoro("11" , "4" , "1979" , "18" , "23" , "0" , "27" , "9" , "N" , "78" , "0" , "E" , "5.5");//
	 
	 //List<String> getHoraBhavPred = getHoraBhavPrediction(myHoroObject,"");
	// System.out.println(getHoraBhavPred.get(1)+","+getHoraBhavPred.get(2));
	 //int rashi =myHoroObject.getAscendentSign();
	 //String getGoodTime = getGoodTime(true,0,rashi,myHoroObject);
	 //String getBadTime = getGoodTime(false,0,rashi,myHoroObject);
	 
	 //System.out.println(getGoodTime);
	// System.out.println(getBadTime);
	 
	
	 //System.out.println(DB.getDishaShool("0",myHoroObject)+"neha");
	 Muhurta model = new Muhurta();
	 //System.out.println(model.getRahuKaal(jd, place));
	 Masa model1 = new Masa();
     int jd = (int) Masa.toJulian(2019, 5, 28);
	 //System.out.println(model.getDishaShoola(jd));
	 AajKaPanchangData calculation = new AajKaPanchangData(myHoroObject.getLatitude(),myHoroObject.getLongitude(),Double.parseDouble(String.valueOf(myHoroObject.getTimeZone())));
	 System.out.println(calculation.getTodayNakshtra()[0]+","+calculation.getTodayNakshtra()[1]);
	 System.out.println(calculation.getRahuKaal());
     }
	
	 /* © copyrights Ojas Softech pvt. ltd. 
	  * this method is used to get current time prediction based on planet and their kp bhav position
	 * return list
	 * param horoObj with dataType :- DesktopHoro ,  category with dataType :-  String
	 */
	public  List<String> getHoraBhavPrediction(DesktopHoro horoObj, Double latitude,Double longitude,Double timezone ,String category)
	{
		   List<String> getFinalData = new ArrayList<>();
		   
		  Map<Integer, String[]> hashMapServiceBhav1 = new LinkedHashMap<Integer, String[]>();
	      Map<Integer, String[]> hashMapServiceBhav2 = new LinkedHashMap<Integer, String[]>();
	      Map<Integer, String[]> hashMapServiceBhav3 = new LinkedHashMap<Integer, String[]>();
	      Map<Integer, String[]> hashMapServiceBhav4 = new LinkedHashMap<Integer, String[]>();
	      Map<Integer, String[]> hashMapServiceBhav5 = new LinkedHashMap<Integer, String[]>();
	      Map<Integer, String[]> hashMapServiceBhav6 = new LinkedHashMap<Integer, String[]>();
	      Map<Integer, String[]> hashMapServiceBhav7 = new LinkedHashMap<Integer, String[]>();
	      Map<Integer, String[]> hashMapServiceBhav8 = new LinkedHashMap<Integer, String[]>();
	      Map<Integer, String[]> hashMapServiceBhav9 = new LinkedHashMap<Integer, String[]>();
	      Map<Integer, String[]> hashMapServiceBhav10 = new LinkedHashMap<Integer, String[]>();
	      Map<Integer, String[]> hashMapServiceBhav11 = new LinkedHashMap<Integer, String[]>();
	      Map<Integer, String[]> hashMapServiceBhav12 = new LinkedHashMap<Integer, String[]>();
	      
	      hashMapServiceBhav1.put(1,new String[]{"Father or Father figure may call you","Sudden Mental Stress due to ongoing affairs in the office.","Dont be headstrong in any official matter.","You will have great ideas and solution for office works.","Some one from other team will give you guidance and support.","Your female co-worker will praise your work to your senior","Complete your work at time to avoid later confusion."});
	      hashMapServiceBhav2.put(2,new String[]{"You may have word with finance/HR dept.","Try to Be polite with female co-workers. Dont be harsh.","Try to drive safely to office with seat belts or helmets on.","Your office laptop might get faulty.","You may get difficulty in verbal presentation in front of seniors","Your creativity will give you good standard in your job profile.","you may have to wait longer for reimbursements."});
	      hashMapServiceBhav3.put(3,new String[]{"You may intereact with someone after a long break","	Sudden local travel may exhaust you.","Your office sitting may change to other place.","Try to communicate properly with your team mates in order to be hassle free.","You may go for sudden local travel.","Complete your pending task before someone poke you about it.","You may have sudden travel to client location."});
	      hashMapServiceBhav4.put(4,new String[]{"Extra Work Load will make you restless, Please be calm.","You will be happy for your feedback from seniors.","There is a chance of disagreement in the office meeting.","You may send some wrong official emails. ","Kindly check twice.	you may ask admin for some purchases.","Your office siting may get change.","Stay focused in your work as your senior may find you lazy."});
	      hashMapServiceBhav5.put(5,new String[]{"You may apply or receive new job call.","You will give new ideas and solutions to your workmates.","You'll share your plan for future project with senior.","You may get a call from your previous job collegeue.","	You may apply for future leave today","Someone from other department may approach for help.","Your creative solution will benefit the company's revenue."});
	      hashMapServiceBhav6.put(6,new String[]{"Your competitor may conspire about you to your boss.","Your ongoing work may suffer due to some health issue.","You may have to work on other's behalf due to their unavailbility.","You will be praised for your harwork in the ongoing project.","	You may have some verbal conflict at the work place.","You will get apprroval on your pending reimbursement.","You might get the information about your ongoing conspiracy. Be atentive."});
	      hashMapServiceBhav7.put(7,new String[]{"you will discuss some work plan with other team member.","Female collegue will help to complete your pending task.","	You may apply for new job due to frustration.","You may finalise the deal with a new client for your employer.","Team players will be very helpful to you.","Your team mate may get all the credit for team work, So be very prompt.","Approval on Promotion or Hike will happen. Be happy"});
	      hashMapServiceBhav8.put(8,new String[]{"Sudden travel or meeting may happen, so be prepared for it.","Some sudden verbal spat can happen in the office, please be cautious","	Call regarding loan may ring your mobile.","Some sudden extra work load will make you restless","Someone can suddenly demand money from you.","Sudden conflict with woman in the office may down your image. be careful.","	You will get approval on Medical expenditure."});
	      hashMapServiceBhav9.put(9,new String[]{"Your senior will give you good feedback of your past projects.","	Your luck factor will save you from some official conflicts today.","	Don't give unwanted guidance to anyone in the office. It will backfire on you.","	You will get stuck in the ongoing project.","You may have long work related discussion with your senior.","Your senior may ask you for office tour on someone else behalf.","Your trained juniors will do wonders, thus you will get all the praises."});
	      hashMapServiceBhav10.put(10,new String[]{"You may indulged in some verbal conflict with junior, please be generous.","You will be more active in professional works.","	You may help your dearest friend to get enrolled in your company.","Conversation with senior may give you a new vision.","You boss will be impressed from you","you should share your idea directly to your boss rather than with team mates then it will give you good result.","You may apply for new job or get a interview call."});
	      hashMapServiceBhav11.put(11,new String[]{"Collegue will return your money which you gave previously.	","Casual talks with work mates can hamper your work.","	Approval on Reputation and Status elevation.","Sudden supervision of team players will be required.","You may advice someone or someone can ask for your advice today.","your senior will communicate your faults that you have done in the past. So listen carefully.","Success in previously given interview is on the card for you."			});
	      hashMapServiceBhav12.put(12,new String[]{"You may travel for job related work. Stay alert.","	You may go for eating with your office client.","you will impress your office client efficiently.","Your way of communication to team mates will get offened.","You may feel little discomfort in your health today.","Don't take any step in the anger as it leads to serious future issues.","You may apply for foreign job or may give interview for it."});
	      
	      Map<Integer, String[]>[] hashMapServiceBhav  = (Map<Integer, String[]>[])new Map[]{hashMapServiceBhav1,hashMapServiceBhav2,hashMapServiceBhav3,hashMapServiceBhav4,hashMapServiceBhav5,hashMapServiceBhav6,hashMapServiceBhav7,hashMapServiceBhav8,hashMapServiceBhav9,hashMapServiceBhav10,hashMapServiceBhav11,hashMapServiceBhav12};
	      
	      Map<Integer, String[]> hashMapBuisnessBhav1 = new LinkedHashMap<Integer, String[]>();
	      Map<Integer, String[]> hashMapBuisnessBhav2 = new LinkedHashMap<Integer, String[]>();
	      Map<Integer, String[]> hashMapBuisnessBhav3 = new LinkedHashMap<Integer, String[]>();
	      Map<Integer, String[]> hashMapBuisnessBhav4 = new LinkedHashMap<Integer, String[]>();
	      Map<Integer, String[]> hashMapBuisnessBhav5 = new LinkedHashMap<Integer, String[]>();
	      Map<Integer, String[]> hashMapBuisnessBhav6 = new LinkedHashMap<Integer, String[]>();
	      Map<Integer, String[]> hashMapBuisnessBhav7 = new LinkedHashMap<Integer, String[]>();
	      Map<Integer, String[]> hashMapBuisnessBhav8 = new LinkedHashMap<Integer, String[]>();
	      Map<Integer, String[]> hashMapBuisnessBhav9 = new LinkedHashMap<Integer, String[]>();
	      Map<Integer, String[]> hashMapBuisnessBhav10 = new LinkedHashMap<Integer, String[]>();
	      Map<Integer, String[]> hashMapBuisnessBhav11 = new LinkedHashMap<Integer, String[]>();
	      Map<Integer, String[]> hashMapBuisnessBhav12 = new LinkedHashMap<Integer, String[]>();
	      
	      hashMapBuisnessBhav1.put(1,new String[]{"You may crack the good deal.","Some business conflict may triiger mental stress","Dont be headstrong in any official matter.","You will have great ideas and solution for office works.","You will meet someone who is very intellectual and full of wisdon.","New buyers will come to you without any efforts.","Complete your work at time to avoid later confusion."});
	      hashMapBuisnessBhav2.put(2,new String[]{"You may have issue with finance/HR dept.","	Calmness and patience are key to success","Don't invest in anything new untill you get the profits from your ongoing deals.","Your office laptop/pc will get faulty.","	Face to Face meeting will help you in work","	Your creativity will give you good standard in your profile.","you must personally listen to your employees to grow in your business."	});
	      hashMapBuisnessBhav3.put(3,new String[]{"Sudden call can change your mood.","You may go for internet advertisement.","You can buy some accessary for your seat or car","	Try to have conversation with your business partner before any final verdict.","	You may go for sudden local travel.","Complete your pending task before someone poke you about it.","You may have sudden travel to client location."});
	      hashMapBuisnessBhav4.put(4,new String[]{"You will get an approval call for a new business project	","You will be happy for your feedback from your client.","There is a chance of disagreement at the work place","You may send some wrong official emails. Kindly check twice.","	You may invest for new office.","Your office siting may get change.	Stay focused in your work , it will benefit you	"});
	      hashMapBuisnessBhav5.put(5,new String[]{"You may apply or receive new job call.","you may get the blocked funds which you were waiting for long.","You may get angry of your current situation.","You may misplace you cards.","Some purchasing for the business may happen.","You rival may hire your employee, which can impact you greatly.","Your creative mind will give you more business."});
	      hashMapBuisnessBhav6.put(6,new String[]{"You will have talk regarding pending funds.","	Your ongoing work may suffer due to some health issue.","Your business rival may beat you in new venture's tender, try to spy them.","You will visit bank today.","You may have some verbal conflict at the work place.","You will get apprroval on your pending reimbursement.","Mental Dissatisfaction due to payment dues"});
	      hashMapBuisnessBhav7.put(7,new String[]{"Some conflict with business partner will tense you deeply and hamper your work.	","Female client may give you business","Frustration will be high.","You have to travel suddenly for business deal.","You may get business leads today	","Your team mate may get all the credit for team work, So be very prompt.","Sudden gain may happy your mood"});
	      hashMapBuisnessBhav8.put(8,new String[]{"You will apply for loan for new venture","You can get a call for loan","You may apply for loan today.","Some sudden extra work load will make you restless","your employee can suddenly ask for salary hike or loan. Be Prepared","	Sudden conflict with woman in the office may down your image. be careful.","sudden card lost may increase you tension"});
	      hashMapBuisnessBhav9.put(9,new String[]{"Your father or family member can give you some suggestion or ideas","You may take the help your wife's sibling for some business fault or error.","Don't give unwanted guidance to anyone at workplace. It will backfire on you.","You may sign some document, please be attentive","You may visit food cafe today.","Don't blind follow what other's suggest you for business growth, be your own researcher.","You may shop for your requirement"});
	      hashMapBuisnessBhav10.put(10,new String[]{"You may indulged in some verbal conflict with employees, please be generous.","You will be more active in professional works.","you may go for new company registration for new business.","	Long Voice calls regarding work may shake your head.","You client will be impressed from you","	if you share your idea directly to your boss rather than with team mates then it will give you good result.","You will get the approval call from your investor"});
	      hashMapBuisnessBhav11.put(11,new String[]{"You will get some gain like project approval.	","Your friend may bring new busines to you.","Approval on Reputation and Status elevation.","Be careful while speaking to someone as you may speak out your business secret.","You may advice someone or someone can ask for your advice today.","your senior will communicate your faults that you have done in the past. So listen carefully.","You may need new employee for your business"});
	      hashMapBuisnessBhav12.put(12,new String[]{"You may collaborate with distant or foreign partner.","	Some investment is on the card.","	you will impress your office client efficiently.	","Your way of communication to team mates will get offened by the collegues.","You may donate the money to save tax.","Don't take any step in the anger as it leads to serious future issues.","You may effort for foreign related business."});
	      
	      Map<Integer, String[]>[] hashMapBuisnessBhav  = (Map<Integer, String[]>[])new Map[]{hashMapBuisnessBhav1,hashMapBuisnessBhav2,hashMapBuisnessBhav3,hashMapBuisnessBhav4,hashMapBuisnessBhav5,hashMapBuisnessBhav6,hashMapBuisnessBhav7,hashMapBuisnessBhav8,hashMapBuisnessBhav9,hashMapBuisnessBhav10,hashMapBuisnessBhav11,hashMapBuisnessBhav12};
	      
	      Map<Integer, String[]> hashMapHouseWifeBhav1 = new LinkedHashMap<Integer, String[]>();
	      Map<Integer, String[]> hashMapHouseWifeBhav2 = new LinkedHashMap<Integer, String[]>();
	      Map<Integer, String[]> hashMapHouseWifeBhav3 = new LinkedHashMap<Integer, String[]>();
	      Map<Integer, String[]> hashMapHouseWifeBhav4 = new LinkedHashMap<Integer, String[]>();
	      Map<Integer, String[]> hashMapHouseWifeBhav5 = new LinkedHashMap<Integer, String[]>();
	      Map<Integer, String[]> hashMapHouseWifeBhav6 = new LinkedHashMap<Integer, String[]>();
	      Map<Integer, String[]> hashMapHouseWifeBhav7 = new LinkedHashMap<Integer, String[]>();
	      Map<Integer, String[]> hashMapHouseWifeBhav8 = new LinkedHashMap<Integer, String[]>();
	      Map<Integer, String[]> hashMapHouseWifeBhav9 = new LinkedHashMap<Integer, String[]>();
	      Map<Integer, String[]> hashMapHouseWifeBhav10 = new LinkedHashMap<Integer, String[]>();
	      Map<Integer, String[]> hashMapHouseWifeBhav11 = new LinkedHashMap<Integer, String[]>();
	      Map<Integer, String[]> hashMapHouseWifeBhav12 = new LinkedHashMap<Integer, String[]>();
	      
   
	      hashMapHouseWifeBhav1.put(1,new String[]{"Being a housewife you should support you man,rather doubt.","Dont be angry, be caring like you used to be.","You should give courage to your husband, as you are his biggest support.","You communication with all members at home creates stable ambiance","You will feel very spirtual from heart today.","You and your friend circle may go for shopping or movie.","You may donate your old cloths or items to your servents."});
	      hashMapHouseWifeBhav2.put(2,new String[]{"Try to cook cautiously, any ignorance can be harmful.","	Your in law will praise you for your support and care.","you may decide to fix your funds in the bank.","You may try for new dishes at home which can go haywire. So please be alert.","You wil may write something religious or purchase some religious books.","You may invest in gold.","You will prepare many dishes today due to many choices."});
	      hashMapHouseWifeBhav3.put(3,new String[]{"You may join some kitty party team.","Sudden local travel may exhaust you physically.","Visiting your mothers house will delight you.","A sudden change in interest can shock others.","You will decorate your home temple with new purchases.","Try to be cautious in bathroom as foot may slip","Issue at shoulder can restrict your speed of household work."});
	      hashMapHouseWifeBhav4.put(4,new String[]{"Family members will praise you for your efforts.","	Eating favourite dish at the restrauant will delight you.","	Take care of your chest area, some problem may come.","You may book the film ticket with family.","	You may invest money for some purchase.","You maid will have some issue with you. Be alert.","Your elder in the family may point you unnecessarily."});
	      hashMapHouseWifeBhav5.put(5,new String[]{"You will have exhausting time with your child.","	your creative mind will help your child to understand the ongoing situtation.","	Start which you wanted to start without second thought.","Great shopping in on the card for you.","Your child's performance at school may sadden you.","	Your entertainment product may get faulty. Don't be upset.","You may shout on your child. Don't do it , teach with love."});
	      hashMapHouseWifeBhav6.put(6,new String[]{"Try not to order anything from outside, else health issue may come.","Verbal spat with family member will mourne you","You may plan to join some new course for better knowledge.","Neighbour may suddenly ask for some favour. Be prepared.","Ask your family member not to eat outside, stomach issue is on the card.","Your issue with your servent can trigger serious conflict at home.","You may buy new pair of footwears today."});
	      hashMapHouseWifeBhav7.put(7,new String[]{"You will have some sudden cozy moment with your husband.","	Express your emotions and feelings without delay.","You should listen your husband properly without giving any verdict.","Husband healths may bother you. Have patience","Your child may compell you for approval for school trip.","Your husband's office schedule can ruin your mood today.","Your husband will be very happy because of your management at home."});
	      hashMapHouseWifeBhav8.put(8,new String[]{"Sudden expenditure may empty your wallet.","	Some suddent verbal spat can happen in the house, please be cautious","	You need to do 360 research for all your problem's solution","Loss of purse or wallet may increase your tension.","Your own mother may get some sudden change in her life. Be connected to her.","You may plan for amusemant park tour with family or friends.","Your husband will take you on shopping which was long pending."});
	      hashMapHouseWifeBhav9.put(9,new String[]{"You will visit temple with your friend all of sudden.","	Sudden appearance of your sibling will make you happy.","Your fathers health may trouble you deep.","Take care of your leg, Some sudden issue may arise. Walk attentively.","Your Stomach can be very upset, keep your medicine ready","	Your deep heart will ask you to donate at temple today.","	You and your family may suddenly plan for nearby religious place."});
	      hashMapHouseWifeBhav10.put(10,new String[]{"you may plan to start freelancing work.","You may plan for your father's place.","Your husband may get good hike at the office, you will be rewarded.","Have more and more water to keep yourself calm in current situation.","You may apply for new job due to boredom at home","Take care of your eyes, excess household work can pain this.","Your abdoment may get some problem, get your doctor on call."});
	      hashMapHouseWifeBhav11.put(11,new String[]{"Money gain in on the card for you.","Your sibling is your real friend, you must share your feelings.","Break from busy schdule is a good solution for problems.","Some old times friend can connect to after a long time. You will be delighted.","You will do fix deposit today of your savings.","	Your close friend can ask for financial help today.","Your mother will gift you some good amout of money or precious gift."});
	      hashMapHouseWifeBhav12.put(12,new String[]{"Sudden visiting to hospital/clinic may give you mental stress.","You may plan for shopping with friends.","Meditation can heal your mental stress effiiciently.","You may visit some friend's house for knowing the health condition.","You may ask your husband for investing in property or vehicle.","Some precious crockery or costly item may get damaged today","you may plan for long distant travel for future date."});
	      
          Map<Integer, String[]>[] hashMapHouseWifeBhav  = (Map<Integer, String[]>[])new Map[]{hashMapHouseWifeBhav1,hashMapHouseWifeBhav2,hashMapHouseWifeBhav3,hashMapHouseWifeBhav4,hashMapHouseWifeBhav5,hashMapHouseWifeBhav6,hashMapHouseWifeBhav7,hashMapHouseWifeBhav8,hashMapHouseWifeBhav9,hashMapHouseWifeBhav10,hashMapHouseWifeBhav11,hashMapHouseWifeBhav12};
	      
        //Calendar cal = Calendar.getInstance(); 
		int age = cal.get(Calendar.YEAR)- horoObj.getYearOfBirth();
		String gender = horoObj.getMaleFemale().toLowerCase();	
		Map<Integer, String[]>[] classDesOfUser = (Map<Integer, String[]>[])new Map[3] ;
	
		if(gender.equals("m") || gender.equals("male"))
		{
	     	if (age >= 0 && age < 45){
	         classDesOfUser= hashMapServiceBhav;
	        		 }
	       else{
            classDesOfUser= hashMapBuisnessBhav;}
	     	}
		else if(gender.equals("f") || gender.equals("female"))
		{
			if (age >= 0 && age < 45){
              classDesOfUser= hashMapServiceBhav;}
		    else{
              classDesOfUser= hashMapHouseWifeBhav;}
		}
        //**********calling hora time 
		 
		 int year =  cal.get(Calendar.YEAR);
		 int month = cal.get(Calendar.MONTH)+1;
		 int day =cal.get(Calendar.DAY_OF_MONTH);
		 int day_of_month = cal.get(Calendar.DAY_OF_WEEK) - 1;
		// double latitude =lahoroObj.getLatitude();
		// double longitude =horoObj.getLongitude();
		// String timezone =horoObj.getTimeZone();
	   
	    Object Obj[] = getDayHoraPlanetEntryExitTime(year,month,day,latitude,longitude,timezone,day_of_month);
		
		 int[] arrayHoraPlanet =  (int[])Obj[0];
		 List<String> arrayHoraEnteyTime =  (List<String>)Obj[1];
		 List<String> arrayHoraExitTime =  (List<String>)Obj[2];
		 String[] getCurrTime = getCurrentTimeStr().split(":");
		 int getCurrHour = Integer.parseInt(getCurrTime[0]);
		 int getCurrMin = Integer.parseInt(getCurrTime[1]);
		 int getCurrSec = Integer.parseInt(getCurrTime[2]);
		 String businessStart="",businessEnd="";
		 String loveStart="",loveEnd="";
		 String govWorkStart="",govWorkEnd="";
		 boolean isTrue=true;
		 boolean isTrueForBuisness=true;
		 boolean isTrueForLove=true;
		 boolean isTrueForWork=true;
		 for (int i=0 ;i<arrayHoraPlanet.length;i++){
			 int getRunningPlanet;
			 
			 String[] HoraEnteyTime = arrayHoraEnteyTime.get(i).split(":");
			 String[] HoraExitTime = arrayHoraExitTime.get(i).split(":");
			 
			 int getHoraEnteyHour = Integer.parseInt(HoraEnteyTime[0]); 
			 int getHoraEnteyMin = Integer.parseInt(HoraEnteyTime[1]); 
			 int getHoraEnteySec = Integer.parseInt(HoraEnteyTime[2]); 
			 int getHoraExitTimeHour = Integer.parseInt(HoraExitTime[0]);
			 int getHoraExitTimeMin = Integer.parseInt(HoraExitTime[1]);
			 int getHoraExitTimeSec = Integer.parseInt(HoraExitTime[0]);
			 //System.out.println(getHoraEnteyHour+","+getHoraExitTimeHour+","+getHoraExitTimeMin+","+","+getHoraExitTimeMin+","+getCurrMin+","+getCurrHour);
		     String prediction ="";
		     
		        // if(getHoraEnteyHour<=getCurrHour && getHoraExitTimeHour>getCurrHour){ //&& getHoraExitTimeMin>getCurrMin  && getHoraExitTimeSec>getCurrSec){
			 if(isTrue && (getHoraEnteyHour<getCurrHour || getHoraEnteyHour==getCurrHour) && (getHoraExitTimeHour>getCurrHour || (getHoraExitTimeHour==getCurrHour && getHoraExitTimeMin>getCurrMin))){ //&& getHoraExitTimeMin>getCurrMin  && getHoraExitTimeSec>getCurrSec){
		
				 getRunningPlanet= arrayHoraPlanet[i];	
				 int planetBhavVal = getBhavValueBasedOnPlanet(horoObj,getRunningPlanet)-1; //bcz hasmap start with 0
				 prediction = classDesOfUser[planetBhavVal].get(planetBhavVal+1)[getRunningPlanet];
				 getFinalData.add(prediction);
				 getFinalData.add(arrayHoraEnteyTime.get(i));
				 getFinalData.add(arrayHoraExitTime.get(i));
				 getFinalData.add(String.valueOf(getRunningPlanet));
				 getFinalData.add(String.valueOf(planetBhavVal+1));
				
				 isTrue =false;
			 }
			 //*****************Business muhurat
			 if(isTrueForBuisness && arrayHoraPlanet[i]==4 && (getHoraExitTimeHour>getCurrHour || (getHoraExitTimeHour==getCurrHour &&  getHoraExitTimeMin>getCurrMin)|| getHoraExitTimeHour<getCurrHour && getHoraEnteyHour>getCurrHour) ){	    	 
				 // getFinalData.add(5,arrayHoraEnteyTime.get(i));
				  //getFinalData.add(6,arrayHoraExitTime.get(i));
				  //break; 
				 businessStart=arrayHoraEnteyTime.get(i);
				 businessEnd=arrayHoraExitTime.get(i);
				 isTrueForBuisness= false;
			 }
			 
			//*****************Love muhurat
			 if(isTrueForLove && arrayHoraPlanet[i]==5 && (getHoraExitTimeHour>getCurrHour || (getHoraExitTimeHour==getCurrHour &&  getHoraExitTimeMin>getCurrMin) || getHoraExitTimeHour<getCurrHour && getHoraEnteyHour>getCurrHour)){	    	 
				 //getFinalData.add(7,arrayHoraEnteyTime.get(i));
				  //getFinalData.add(arrayHoraExitTime.get(i));
				 // break; 
				 
				 loveStart=arrayHoraEnteyTime.get(i);
				 loveEnd=arrayHoraExitTime.get(i);	 
				 isTrueForLove= false;
			 }
			 
			 //*****************Gov Work muhurat
			 if(isTrueForWork && arrayHoraPlanet[i]==0 && (getHoraExitTimeHour>getCurrHour || (getHoraExitTimeHour==getCurrHour &&  getHoraExitTimeMin>getCurrMin)|| getHoraExitTimeHour<getCurrHour && getHoraEnteyHour>getCurrHour)){	    	 
				  //getFinalData.add(arrayHoraEnteyTime.get(i));
				  //getFinalData.add(arrayHoraExitTime.get(i));
				 // break; 
				 govWorkStart=arrayHoraEnteyTime.get(i);
				 govWorkEnd=arrayHoraExitTime.get(i);
				 isTrueForWork =false;
			 }
						
			 if(!isTrueForWork && !isTrueForLove && !isTrueForBuisness && !isTrue) { break;} //untill we not get the all the values
		 }
		 if(!businessStart.equals("") && !businessEnd.equals("") &&! loveStart.equals("") &&!loveEnd.equals("") &&!govWorkStart.equals("") &&  !govWorkEnd.equals("")){
			 getFinalData.add(businessStart);
			 getFinalData.add(businessEnd);
			 getFinalData.add(loveStart);
			 getFinalData.add(loveEnd);
			 getFinalData.add(govWorkStart);
			 getFinalData.add(govWorkEnd);
			
		 }
		return getFinalData;
	}
	
	/* © copyrights Ojas Softech pvt. ltd. 
	 * Get Bhav position of planet in kp chart 
	 * return bhav number
	 * Neha 16-05-2019
	 */
	public static int getBhavValueBasedOnPlanet(DesktopHoro myAstrologyObject,int planetNo){
		   int bhavPosition=0;
		   double[] bhavaPositions = new double[13];
		    double longitudeDifference;
		    for(int j = 0 ; j<=11;j++){
		       longitudeDifference = myAstrologyObject.getKPCuspLongitude(j + 1);
		       if(longitudeDifference >= 360.0){  longitudeDifference = longitudeDifference - 360.0 ;}
		       bhavaPositions[j] = longitudeDifference;
             }
		    
		    longitudeDifference = myAstrologyObject.getKPPlanetLongitude(planetNo + 1);
		    if(longitudeDifference >= 360.0 ){
	 	        longitudeDifference = longitudeDifference - 360.0;
	         }
	         //Add new condition so that it will not crash when negative value will come.
	         if(longitudeDifference<0){ 
	     	    longitudeDifference = longitudeDifference+360.0;
	         }
	         SharedFunction sf = new SharedFunction();
	         bhavPosition = sf.getPlanetBhavaPosition(longitudeDifference, bhavaPositions); // same functinality getKPPlanetBhavaPosition
	         return bhavPosition;
		
	}
	/****************
	 * © copyrights Ojas Softech pvt. ltd. 
	 * Hora calculation per day hour
	 * Neha 14-05-2019
	 * @return object array
	 */
	public static Object[] getDayHoraPlanetEntryExitTime(int year, int month, int day, double latitude,
            double longitude, double timezone,int day_of_month)
	{
	  //calculate Hora Planet
		int[] arrHoraPlanet = HoraLordName(day_of_month);
		
		Object[] arrHoraEnteyExitTime = HoraEntryExitTime(year,month,day,latitude,
	            longitude,timezone);
		 List<String> arrHoraEnteyTime = (List<String>)arrHoraEnteyExitTime[0];
		 List<String> arrHoraExitTime    =  (List<String>)arrHoraEnteyExitTime[1];
	
		 //hard Code date not for user only testing
        String[] arrHoraPlanet1 = new String[]   {"sun","moon","venus","saturn","mercury","saturn","moon","jupiter","sun","saturn","venus","mars",
				                                 "sun","moon","venus","saturn","mercury","saturn","moon","jupiter","sun","saturn","venus","mars"};

		String[] arrHoraEnteyTime1 = new String[] {"005:31:38","006:39:16","007:46:55","008:54:33","010:02:12","011:09:51","012:17:29","013:25:08","014:32:46","015:40:25","016:48:03","017:55:42",
                                                  "019:03:21","019:55:42","020:48:03","021:40:25","022:32:46","023:25:08","000:17:29","001:09:51","002:02:12","002:54:33","003:46:55","004:39:16"};
		
		String[] arrHoraExitTime1 = new String[] {"006:39:16","007:46:55","008:54:33","010:02:12","011:09:51","012:17:29","013:25:08","014:32:46","015:40:25","016:48:03","017:55:42","019:03:21",
                                                  "019:55:42","020:48:03","021:40:25","022:32:46","023:25:08","000:17:29","001:09:51","002:02:12","002:54:33","003:46:55","004:39:16","005:31:38"};
		//**************************************************
		return new Object[]{arrHoraPlanet, arrHoraEnteyTime,arrHoraExitTime};
         
    }
	
	/****************
	 * © copyrights Ojas Softech pvt. ltd. 
	 * get Hora Lord name list
	 * Neha 14-05-2019
	 * @return int array
	 */
	
	public static int[] HoraLordName(int day_of_month) {
	    int dayLordForDayHora[] = new int[24];
	    try {
                for (int i = 0; i < 24; i++) {
	            dayLordForDayHora[i] = (day_of_month + (i * 5)) % 7;    
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return dayLordForDayHora;
    }
	
	/****************
	 * © copyrights Ojas Softech pvt. ltd. 
	 * Hora 24 hours Entry / Exit Time
	 * Neha 14-05-2019
	 * @return object array
	 */
	public static Object[] HoraEntryExitTime(int year, int month, int day, double latitude,
            double longitude, double timezone) {
		
		int jd = (int) Masa.toJulian(year, month, day);
		double tzone  = timezone;
		Place place = new Place(latitude, longitude, tzone );
	
    	 List<String> EntryDataTime = new ArrayList<>();
    	 List<String> ExitDataTime = new ArrayList<>();
    	
    	
		try {
	        for (int k = 0; k < 13; k++) {
	            	 if (k <= 11) {
	            	
                    Muhurta.getDayDivisons(jd, place, Masa.getSunRise(jd, place), 8);
	            	EntryDataTime.add(SharedFunction.dms(Muhurta.getDayDivisons(jd, place,Masa.getSunRise(jd, place), 12)[k]));   }
	            	 
	            if (k > 0) {
	            	ExitDataTime.add( SharedFunction.dms(Muhurta.getDayDivisons(jd, place,Masa.getSunRise(jd, place), 12)[k]));
                 }
	        }
	            for (int j = 0; j < 13; j++) {
                    if (j <= 11) {
                      EntryDataTime.add(SharedFunction.dms(Muhurta.getNightDivisons(jd, place,Masa.getSunSet(jd, place), 12)[j]));
                     }
	                if (j > 0) {
	                	ExitDataTime.add(SharedFunction.dms(Muhurta.getNightDivisons(jd, place,Masa.getSunSet(jd, place), 12)[j]));
                   }
	            }
		}
	       catch (Exception e) {
	            e.printStackTrace();
	        }
		
		Object Obj[] = new Object[] {EntryDataTime,ExitDataTime};
    	return Obj;
     }
	
	/**
	 * Creates DesktopHoro object
	 * @param day
	 * @param month
	 * @param year
	 * @param hrs
	 * @param min
	 * @param sec
	 * @param latDeg
	 * @param latMin
	 * @param latNS
	 * @param longDeg
	 * @param longMin
	 * @param longEW
	 * @param timeZone
	 * @return
	 */
	public static DesktopHoro createHoro(String day, String month, String year, String hrs, String min, String sec, String latDeg, String latMin, String latNS, String longDeg, String longMin, String longEW, String timeZone) {

		Constants const1 = new Constants();
        const1.setConstPath(System.getProperty("user.dir")+"/war/cloud/");
        //const1.setConstPath(getServletContext().getRealPath("/cloud/"));

		DesktopHoro phoro = new DesktopHoro();
		
		try {

			phoro.setCompanyName("CSL SOFTWARE LTD., G-4A, Green park Extn., New Delhi-110 016");
			phoro.setCompanyAddLine1("Phone:011-6867329, 9811356741, E-Mail: info@astrocamp.com http://www.astrocamp.com");
			phoro.setName("neha");
			phoro.setPlace("noida");
			phoro.setTimeZone(timeZone);
			phoro.setMaleFemale("F");
			phoro.setSecondOfBirth(sec);
			phoro.setMinuteOfBirth(min);
			phoro.setHourOfBirth(hrs);
			phoro.setDayOfBirth(day);
			phoro.setMonthOfBirth(month);
			phoro.setYearOfBirth(year);
			phoro.setDegreeOfLattitude(latDeg);
			phoro.setDegreeOfLongitude(longDeg);
			phoro.setSecondOfLattitude("00");
			phoro.setSecondOfLongitude("00");
			phoro.setMinuteOfLongitude(longMin);
			phoro.setMinuteOfLattitude(latMin);
			phoro.setEastWest(longEW);
			phoro.setNorthSouth(latNS);
			phoro.setLanguageCode("0");
			phoro.setDST("0");
			phoro.setAyan(0);
			// phoro.setAyanamsaType(3);
			phoro.setLanguageCode("0");
			// phoro.setCustomizedAyanamsa("23.000");
			phoro.initialize();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return phoro;
		
	}
	
	/****************
	 * © copyrights Ojas Softech pvt. ltd. 
	 * This method is used for currnet time from the date
	 * Neha 14-05-2019
	 * @return String format with hour/min/sec
	 */
	public String getCurrentTimeStr(){
		
	    //Calendar cal = Calendar.getInstance();
        String hour = cal.get(Calendar.HOUR_OF_DAY) + "";
		String min = (cal.get(Calendar.MINUTE))+"";
		String sec = cal.get(Calendar.SECOND) + "";
		
		return hour+":"+min+":"+sec;
		}
	
	
	/****************
	 * © copyrights Ojas Softech pvt. ltd. 
	 * This method is used for good time and bad time planet based on good house and bad house 
	 * Neha 14-05-2019
	 * @return String 
	 */
	
	public String getGoodTime(boolean isForGoodTime, int LANGUAGE_CODE, int rashi,DesktopHoro objHoro,Double latitude,Double longitude,Double timezone) {
	    
	    String answer = "";
	    String aboutHora = "";
	    String intent = null;
	    if (isForGoodTime) {
	        String goodTimeIntent = getGoodTimeIntent(rashi);

	        if (goodTimeIntent != null) {
	            intent = goodTimeIntent;
	        }

	    } else {
	        String badTimeIntent = getBadTimeIntent(rashi);
	        if (badTimeIntent != null) {
	            intent = badTimeIntent;
	        }

	    }

	    String[] horaPlanets = new String[] {"Sun","Moon","Mars","Mercury","Jupiter","Venus","Saturn"};

	    if (intent != null) {

	        if (intent.equals("SURYA_HORA_SUBH") || intent.equals("SURYA_HORA_ASUBH")) {
	          
	            aboutHora = horaPlanets[0];

	        } else if (intent.equals("MOON_HORA_SUBH") || intent.equals("MOON_HORA_ASUBH")) {
	            

	            aboutHora = horaPlanets[1];

	        } else if (intent.equals("MARS_HORA_SUBH") || intent.equals("MARS_HORA_ASUBH")) {
	           
	            aboutHora = horaPlanets[2];

	        } else if (intent.equals("MERCURY_HORA_SUBH") || intent.equals("MERCURY_HORA_ASUBH")) {
	           

	            aboutHora = horaPlanets[3];

	        } else if (intent.equals("JUPITER_HORA_SUBH") || intent.equals("JUPITER_HORA_ASUBH")) {
	           
	            aboutHora = horaPlanets[4];

	        } else if (intent.equals("VENUS_HORA_SUBH") || intent.equals("VENUS_HORA_ASUBH")) {
	           
	            aboutHora = horaPlanets[5];

	        } else if (intent.equals("SATURN_HORA_SUBH") || intent.equals("SATURN_HORA_ASUBH")) {
	           
	            aboutHora = horaPlanets[6];

	        }

	        Calendar cal = Calendar.getInstance();
	       // SetdataonList(cal.get(Calendar.YEAR), cal.get(Calendar.MONTH), cal.get(Calendar.DATE), CUtils.getStringData(context, CGlobalVariables.currentLalitude, "0"), CUtils.getStringData(context, CGlobalVariables.currentLongitude, "0"), CUtils.getStringData(context, CGlobalVariables.timeZone, "0"), "today");
	        answer = getExactHoraForSubhAsubhPlanet(aboutHora,objHoro,latitude,longitude,timezone);
	        return answer;
	    } else {
	        return "-";
	    }
	}
	
	
	/****************
	 * © copyrights Ojas Softech pvt. ltd. 
	 * This method is used for get list for given planet within 12 hours from 8 Am to 8 PM
	 * Neha 14-05-2019
	 * @return String 
	 */
	
	public String getExactHoraForSubhAsubhPlanet(String planet,DesktopHoro horoObj,Double latitude,Double longitude,Double timezone ) {

	    List<String> allPlanetName = new ArrayList<>();
	    List<String> horaStartTime = new ArrayList<>();
	    List<String> horaEndTime = new ArrayList<>();
	    
	    int day_of_month = geDayOfWeek();
	   // Calendar cal = Calendar.getInstance(); 
		 int year =  cal.get(Calendar.YEAR);
		 int month = cal.get(Calendar.MONTH)+1;
		 int day =cal.get(Calendar.DAY_OF_MONTH);
		 //double latitude =horoObj.getLatitude();
		 //double longitude =horoObj.getLongitude();
		 //String timezone =horoObj.getTimeZone();
	    Object Obj[] = getDayHoraPlanetEntryExitTime(year,month,day,latitude,longitude,timezone,day_of_month);
		
	    int[] arrayHoraPlanet =  (int[])Obj[0];
	    List<String> intList = new ArrayList<String>();
	     
	     for (int i : arrayHoraPlanet)
	     {
	         intList.add(Common.arrLongPlanetName[i]);
	     }
		 List<String> arrayHoraEnteyTime =  (List<String>)Obj[1];
		 List<String> arrayHoraExitTime =  (List<String>)Obj[2];
	    
	    for (int i = 0; i < intList.size(); i++) {
	        String startTime = arrayHoraEnteyTime.get(i);
	        String arr[] = startTime.split(":");
	        int hour = Integer.parseInt(arr[0]);

	        if (hour >= 0 && hour <= 23) {
	            allPlanetName.add(intList.get(i));
	            horaStartTime.add(arrayHoraEnteyTime.get(i));
	            horaEndTime.add(arrayHoraExitTime.get(i));
	        }


	    }


	    String ans = exactSubhTime(planet, allPlanetName, horaStartTime, horaEndTime);
	    return ans;
	}
	
	/****************
	 * © copyrights Ojas Softech pvt. ltd. 
	 * This method is used for get good and bad hora between given time period which lies based on given planet
	 * Neha 14-05-2019
	 * @return String 
	 */
	
	
	private  String exactSubhTime(String planet, List<String> allPlanetName, List<String> horaStartTime, List<String> horaEndTime) {
        int index = 0;
        String[] getCurrTime = getCurrentTimeStr().split(":");
		int getCurrHour = Integer.parseInt(getCurrTime[0]);
		int getCurrMin = Integer.parseInt(getCurrTime[1]);
        for (int i = 0; i < allPlanetName.size(); i++) {
        	String[] horaBeginTime= horaStartTime.get(i).split(":");
        	String[] horaExitTime= horaEndTime.get(i).split(":");
        	int horaBeginHour = Integer.parseInt(horaBeginTime[0]);
        	int horaExitHour = Integer.parseInt(horaExitTime[0]);
        	int horaExitMin = Integer.parseInt(horaExitTime[1]);
            if (allPlanetName.get(i).equals(planet) && (horaExitHour>=getCurrHour)){
                index = i;
                break;
            }

        }
        String entryTime = horaStartTime.get(index);
        String exitTime = horaEndTime.get(index);
        String planetName = allPlanetName.get(index);

        if (planetName == null) {
            for (int i = allPlanetName.size(); i >= 0; i--) {
                if (allPlanetName.get(i).equals(planet)) {
                    index = i;
                    break;
                }
            }
            entryTime = horaStartTime.get(index);
            exitTime = horaEndTime.get(index);
            planetName = allPlanetName.get(index);
        }
        String ans =entryTime + " "+exitTime+" "+planetName;

        return ans;
    }
	
	/****************
	 * © copyrights Ojas Softech pvt. ltd. 
	 * This method is used for get lord number from the 5th house which is good in user birth chart
	 * Neha 14-05-2019
	 * @return String 
	 */
	
		 
	public static String getGoodTimeIntent( int rashi) {
        String suffix = "_HORA_SUBH";
        int houseNo = 5;
        Util objUtil = new Util();
        objUtil.initialize(rashi);
        int houseLordNumber = objUtil.getHouseLord(houseNo, rashi);
        houseLord = houseLordNumber;
        String answerType = objUtil.getHouseLordName(houseLordNumber) + suffix;
        return answerType;
        
    }

	
	
	/****************
	 * © copyrights Ojas Softech pvt. ltd. 
	 * This method is used for get lord number from the 8th house which is bad in user birth chart and if same as good then we take others house lord number
	 * Neha 14-05-2019
	 * @return String 
	 */
    public static String getBadTimeIntent(int rashi) {
        String suffix = "_HORA_ASUBH";
        int houseNo;
        if (houseLord == 4 || houseLord == 5) {
            houseNo = 12;
        } else {
            houseNo = 8;
        }

        Util objUtil = new Util();
        objUtil.initialize(rashi);
        int houseLordNumber = objUtil.getHouseLord(houseNo, rashi);
        String answerType = objUtil.getHouseLordName(houseLordNumber) + suffix;
        return answerType;
        
    }
    
    /****************
	 * © copyrights Ojas Softech pvt. ltd. 
	 * This method is used to get day of week from calender
	 * Neha 14-05-2019
	 * @return int 
	 */
    
        public  int  geDayOfWeek(){
    	 //Calendar cal = Calendar.getInstance(); 
		 return cal.get(Calendar.DAY_OF_WEEK) - 1;
    	
    }
        
        
        /****************
    	 * © copyrights Ojas Softech pvt. ltd. 
    	 * This method is used to get bad direction
    	 * Neha 14-05-2019
    	 * @return int 
    	 */
        public int getDishaShool(){
        	 Muhurta model = new Muhurta();
        	 //Calendar cal = Calendar.getInstance(); 
    		 int year =  cal.get(Calendar.YEAR);
    		 int month = cal.get(Calendar.MONTH)+1;
    		 int day =cal.get(Calendar.DAY_OF_MONTH);
    		 int jd = (int) Masa.toJulian(year, month, day);
    		return  model.getDishaShoola(jd);
        	
        }
        
        /****************
    	 * © copyrights Ojas Softech pvt. ltd. 
    	 * This method is used to get given time in AM / PM
    	 * Neha 14-05-2019
    	 * @return String 
    	 */
        
        public String getTimeInAMPM(String data){
        	String AMPMData = "";
        	DateFormat dateFormat = new SimpleDateFormat("hh:mm a");
        	DateFormat df = new SimpleDateFormat("HH:mm:ss");
        	 try{
        		 AMPMData = dateFormat.format(df.parse(data));
        	 }catch(Exception e){
            	 e.printStackTrace();
             }
        	 return AMPMData;
        }
        
        
        
        /****************
    	 * © copyrights Ojas Softech pvt. ltd. 
    	 * This method is used to get current horo object of user
    	 * Neha 14-05-2019
    	 * @return Desktop object 
    	 */
        public DesktopHoro getCurrentObj(DesktopHoro objHoro,int languageCode){
        	int ayanamsa1 = 0;
        	DesktopHoro objCurrHoro = new DesktopHoro();
        	GregorianCalendar gcalendar = new GregorianCalendar();
        	int currMonth = gcalendar.get(Calendar.MONTH),currDay = gcalendar.get(Calendar.DATE),currYear = gcalendar.get(Calendar.YEAR);
        	int nowHour = gcalendar.get(Calendar.HOUR_OF_DAY),nowMinute = gcalendar.get(Calendar.MINUTE),nowSecond = gcalendar.get(Calendar.SECOND);
        try{
        	objCurrHoro.setName("");
        	objCurrHoro.setPlace("");
        	objCurrHoro.setCompanyAddLine1 ("Delhi");
        	objCurrHoro.setCompanyName("CSL Software Ltd");
        	objCurrHoro.setTimeZone("5.5");
        	objCurrHoro.setMaleFemale(objHoro.getMaleFemale());
        	objCurrHoro.setSecondOfBirth(String.valueOf(nowSecond));
        	objCurrHoro.setMinuteOfBirth(String.valueOf(nowMinute));
        	objCurrHoro.setHourOfBirth(String.valueOf(nowHour));
        	objCurrHoro.setDayOfBirth(String.valueOf(currDay));
        	objCurrHoro.setMonthOfBirth(String.valueOf(currMonth+1));
        	objCurrHoro.setYearOfBirth(String.valueOf(currYear));
        	objCurrHoro.setDegreeOfLattitude("27");
        	objCurrHoro.setDegreeOfLongitude("78");
        	objCurrHoro.setSecondOfLattitude("00");
        	objCurrHoro.setSecondOfLongitude("00");
        	objCurrHoro.setMinuteOfLongitude("00");
        	objCurrHoro.setMinuteOfLattitude("09");
        	objCurrHoro.setEastWest("E");
        	objCurrHoro.setNorthSouth("N");

        	objCurrHoro.setDST("00");
        	int langCode = languageCode;
        	if(langCode == 1){
        		objCurrHoro.setLanguageCode("1");  //Hindi languagecde
        	}
        	else{                
        		objCurrHoro.setLanguageCode("0");  //English languagecde
        	}

        	objCurrHoro.setAyan(ayanamsa1);
        	objCurrHoro.initialize();
        } catch (Exception ex) {
			ex.printStackTrace();
		}
        	return objCurrHoro;
        }
      
        
        /****************
    	 * © copyrights Ojas Softech pvt. ltd. 
    	 * This method is used to get nakshtra between current time and current location
    	 * Neha 14-05-2019
    	 * @return HashMap
    	 */
        
        public HashMap<Integer,String> getCurrentTimeNakshatra(DesktopHoro ObjHoro,Double latitude,Double longitude,Double timezone){
        	 AajKaPanchangData calculation = new AajKaPanchangData(latitude,longitude,timezone);
             
             int todayNak = (int)calculation.getTodayNakshtra()[0]-1;
             String todayNakEndTime = SharedFunction.dms(calculation.getTodayNakshtra()[1]);
             String todayNakStartTime = SharedFunction.dms(calculation.getPreviousNakshtra()[1]);
             
             String[] NEnteyTime = todayNakStartTime.split(":");
        	 String[] NExitTime = todayNakEndTime.split(":");
             String addSuffixInStart= " (Yesterday)";
             String addSuffixInEnd= " (Tomorrow)";
             boolean isEndNextDay= false;
             boolean isEndToDay= true;
             
        	 String[] getCurrTime = getCurrentTimeStr().split(":");
        	 int getCurrHour = Integer.parseInt(getCurrTime[0]);
        	 int getCurrMin = Integer.parseInt(getCurrTime[1]);
        	 
             int getNEnteyHour = Integer.parseInt(NEnteyTime[0]); 
             int getNExitTimeHour = Integer.parseInt(NExitTime[0]);
             int getNExitTimeMin = Integer.parseInt(NExitTime[1]);	
            	
            	 if(getNExitTimeHour<getCurrHour || (getNExitTimeHour==getCurrHour &&  getNExitTimeMin<getCurrMin) ){
            	 todayNak= (int)calculation.getNextNakshtra()[0]-1;
            	 todayNakEndTime = SharedFunction.dms(calculation.getNextNakshtra()[1]);
                 todayNakStartTime = SharedFunction.dms(calculation.getTodayNakshtra()[1]);
                 isEndNextDay= true;
                 isEndToDay= false;
            	}
             String todayNakEndTimeAMPM= isEndNextDay ? getTimeInAMPM(todayNakEndTime)+addSuffixInEnd  :getTimeInAMPM(todayNakEndTime);
             String todayNakStartTimeAMPM= isEndToDay ? getTimeInAMPM(todayNakStartTime)+addSuffixInStart: getTimeInAMPM(todayNakStartTime);   
             String Nak= SharedFunction.ProperCase(Common.DhinaName[todayNak]);
             
             HashMap<Integer,String> mp = new HashMap<Integer,String>();
             mp.put(0, todayNakStartTimeAMPM);
             mp.put(1, todayNakEndTimeAMPM);
             mp.put(2, Nak);
             mp.put(3, String.valueOf(todayNak));
             
             return mp;
             
             
        }
        
        /****************
    	 * © copyrights Ojas Softech pvt. ltd. 
    	 * This method is used to get class of thumb up / down to show in web
    	 * Neha 14-05-2019
    	 * @return String
    	 */
         
        public String getGoodOrBadClass(boolean isTrueGood){
        	String classGet = "thumb_down_alt";
        	if(isTrueGood){
        		classGet ="thumb_up_alt";
        	}
        	return classGet;
        }
        
        
        
        /****************
    	 * © copyrights Ojas Softech pvt. ltd. 
    	 * This method is used to get percentage of meter low / hign to show in web
    	 * Neha 14-05-2019
    	 * @return String
    	 */
         
        public String getMeterBar(boolean isTrueGood){
        	String classGet = "10";
        	if(isTrueGood){
        		classGet ="90";
        	}
        	return classGet;
        }
        /****************
    	 * © copyrights Ojas Softech pvt. ltd. 
    	 * This method is used to get percentage of meter low / hign to show in web
    	 * Neha 14-05-2019
    	 * @return String
    	 */
        public String getMeterBar(boolean isTrueGood,int point){
        	String classGet = "10";
        	if(isTrueGood){
        		classGet = String.valueOf(Integer.parseInt(classGet)*point);
        	}
        	return classGet;
        }
        
        /****************
    	 * © copyrights Ojas Softech pvt. ltd. 
    	 * This method is used to get percentage of meter low / hign to show in web
    	 * Neha 14-05-2019
    	 * @return String
    	 */
        
        public String getMeterBarwithGivenPoint(boolean isTrueGood,int point){
        	String classGet = "10";
        	if(isTrueGood){
        		classGet = String.valueOf(20*point);
        	}
        	return classGet;
        }
	}
	
