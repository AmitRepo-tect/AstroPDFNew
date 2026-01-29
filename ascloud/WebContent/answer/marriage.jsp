<%@page import="java.util.Locale"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Hindi"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.api.Dasa"%>
<%@page import="com.ojassoft.astrosagecloud.api.DasafalMarriage"%>
<%@page import="com.ojassoft.astrosagecloud.api.MarriageBean"%>
<%@page import="com.ojassoft.astrosagecloud.util.PdashaUtil"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
//boolean when = false; 
//boolean loveOrArranged = false;
//boolean samePerson = false;
//boolean how = false;
//boolean characterisitics = false;
//boolean survive = false;
//boolean past = false;
//boolean remedies = false;
int langCode = Integer.parseInt(request.getParameter("languageCode"));
String name = request.getParameter("name");
Local local = new Local();
Hindi hindi = new Hindi();
boolean[] mrgArr = (boolean[])request.getAttribute("marriagearr");
int  odId = 0;

if(request.getAttribute("odId")!=null && !request.getAttribute("odId").equals(""))
{
	odId = Integer.parseInt(String.valueOf(request.getAttribute("odId")));
}

MyResourceBundle rBConst = local.loadPropertiesFileNew("constants",langCode);
MyResourceBundle rBextra = local.loadPropertiesFileNew("extrapages",langCode);
//Dasa ObjHoro = (Dasa) request.getAttribute("HoroObject");

//DesktopHoro ObjHoro1 = (DesktopHoro) request.getAttribute("HoroObject");
Dasa ObjHoro = (Dasa) request.getAttribute("dasa");  
MyResourceBundle messages = local.loadPropertiesFileNew("marriagetemplate",langCode);

ArrayList<MarriageBean> arrayList = new ArrayList<MarriageBean>();
arrayList = DasafalMarriage.getDasaRank(ObjHoro);

String arrAllNameTemplate[] = PdashaUtil.getStringArrayFromResource("USER_NAME", messages);
String arrAllPersonalDetail[] = PdashaUtil.getStringArrayFromResource("USER_HOROSCOPE", messages);
int randomNameTemplate = PdashaUtil.getRandomSeed(arrAllNameTemplate.length,odId);
int randomPDetailTemplate = PdashaUtil.getRandomSeed(arrAllPersonalDetail.length,odId);
String userName = PdashaUtil.displayResult(arrAllNameTemplate[randomNameTemplate], name);
out.println(userName +"" + arrAllPersonalDetail[randomPDetailTemplate]);

// when
if(mrgArr[0]){
	SimpleDateFormat month_date = new SimpleDateFormat("MMMM, yyyy",langCode == 1 ? new Locale("hi","IN") :new Locale("en","IN") );
	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
   ArrayList<String> marriageDates = PdashaUtil.getMarriageDates(arrayList);
   ArrayList<String> marriageDatesNew = new ArrayList<String>();
	
	int index = 0;//line.indexOf(",");
	for (String s : marriageDates)
	{
     	Date date1 = sdf.parse(s);
        String month_name1 = month_date.format(date1);
		index =  month_name1.indexOf(",");
		//marriageDatesNew.add(rBConst.getString(month_name1.substring(0,index).toString().toUpperCase()).trim()+", "+month_name1.substring(index+1,month_name1.length()));
		marriageDatesNew.add(month_name1.substring(0,index).toString().toLowerCase().trim()+", "+month_name1.substring(index+1,month_name1.length()));
   }
	
	if (month_date.parse(marriageDatesNew.get(0)).compareTo(month_date.parse(marriageDatesNew.get(1)))== 0 && (month_date.parse(marriageDatesNew.get(2)).compareTo(month_date.parse(marriageDatesNew.get(3)))> 0 || month_date.parse(marriageDatesNew.get(2)).compareTo(month_date.parse(marriageDatesNew.get(3)))< 0)){
		String arrAllTemplate[] = PdashaUtil.getStringArrayFromResource("MARRIAGE_TEMPLATE1", messages);
		String[] putArray = {marriageDatesNew.get(0).toString(),marriageDatesNew.get(2).toString(),marriageDatesNew.get(3).toString()};
		String fullTemplate = local.getDesiredString(arrAllTemplate[PdashaUtil.getRandomSeed(arrAllTemplate.length,odId)],putArray);
        out.println();
        out.println(fullTemplate);
      
	}
	else if(month_date.parse(marriageDatesNew.get(2)).compareTo(month_date.parse(marriageDatesNew.get(3)))== 0 && (month_date.parse(marriageDatesNew.get(0)).compareTo(month_date.parse(marriageDatesNew.get(1)))> 0 || month_date.parse(marriageDatesNew.get(0)).compareTo(month_date.parse(marriageDatesNew.get(1)))< 0))
	{
		String arrAllTemplate[] = PdashaUtil.getStringArrayFromResource("MARRIAGE_TEMPLATE2", messages);
		String[] putArray = {marriageDatesNew.get(0).toString(),marriageDatesNew.get(1).toString(),marriageDatesNew.get(2).toString()};
		String fullTemplate = local.getDesiredString(arrAllTemplate[PdashaUtil.getRandomSeed(arrAllTemplate.length,odId)],putArray);
        out.println();
        out.println(fullTemplate);
  }
	else if(month_date.parse(marriageDatesNew.get(0)).compareTo(month_date.parse(marriageDatesNew.get(1)))== 0 && month_date.parse(marriageDatesNew.get(2)).compareTo(month_date.parse(marriageDatesNew.get(3)))== 0)
	{
		String arrAllTemplate[] = PdashaUtil.getStringArrayFromResource("MARRIAGE_TEMPLATEBOTH", messages);
		String[] putArray = {marriageDatesNew.get(0).toString(),marriageDatesNew.get(2).toString()};
		String fullTemplate = local.getDesiredString(arrAllTemplate[PdashaUtil.getRandomSeed(arrAllTemplate.length,odId)],putArray);
        out.println();
        out.println(fullTemplate);
	}
	
   else
  {
	String arrAllTemplate[] = PdashaUtil.getStringArrayFromResource("MARRIAGE_TEMPLATE", messages);
	String fullTemplate = PdashaUtil.displayResult(arrAllTemplate[PdashaUtil.getRandomSeed(arrAllTemplate.length,odId)],
			marriageDatesNew, "when",null);
	out.println();
	out.println(fullTemplate);
   }
  }

if (mrgArr[1]) {
	String arrLoveMarriageDetail[] = PdashaUtil.getStringArrayFromResource("LOVE_MARRIAGE", messages);
	String arrArrangeMarriageDetail[] = PdashaUtil.getStringArrayFromResource("ARRANGE_MARRIAGE", messages);
	boolean isLove = PdashaUtil.getMarriageDetails(ObjHoro);
	if (isLove) {
		out.println();
		out.println(PdashaUtil
				.displayResult(arrLoveMarriageDetail[PdashaUtil.getRandomSeed(arrLoveMarriageDetail.length,odId)]));
	} else {
		out.println();
		out.println(PdashaUtil.displayResult(
				arrArrangeMarriageDetail[PdashaUtil.getRandomSeed(arrArrangeMarriageDetail.length,odId)]));

	}
}
if (mrgArr[2]) {
	String arrSameOrOtherDetail[] = PdashaUtil.getStringArrayFromResource("SAMEPERSONORDIFFERENT", messages);
	boolean isPersonSame = PdashaUtil.getSameOrDifferentPerson();
	if (isPersonSame) {
		out.println();
		out.println(PdashaUtil
				.displayResult(arrSameOrOtherDetail[PdashaUtil.getRandomSeed(arrSameOrOtherDetail.length,odId)]));
	} else {
		out.println();
		out.println(PdashaUtil
				.displayResult(arrSameOrOtherDetail[PdashaUtil.getRandomSeed(arrSameOrOtherDetail.length,odId)]));
	}
}
if (mrgArr[3]) {
	String arrRelationShipGoal[] = PdashaUtil.getStringArrayFromResource("LIFEAFTERRELATINSHIP", messages);
	out.println();
	out.println(
			PdashaUtil.displayResult(arrRelationShipGoal[PdashaUtil.getRandomSeed(arrRelationShipGoal.length,odId)]));

}
if (mrgArr[4]) {
	ArrayList<String> direction = PdashaUtil.getDirection(ObjHoro);
	String arrDirection[] = PdashaUtil.getStringArrayFromResource("DIRECTION", messages);
	String fullDirection = PdashaUtil.displayResult(arrDirection[PdashaUtil.getRandomSeed(arrDirection.length,odId)],
			direction, "characterisitics",messages);
	out.println();
	out.println(fullDirection);

}
if (mrgArr[5]) {
	String arrSurvival[] = PdashaUtil.getStringArrayFromResource("SURVIVALHESHE", messages);

	boolean isSurvive = PdashaUtil.isMarriageSurvive();
	if (isSurvive) {
		out.println();
		out.println(PdashaUtil.displayResult(arrSurvival[PdashaUtil.getRandomSeed(arrSurvival.length,odId)]));
	} else {
		out.println();
		out.println(PdashaUtil.displayResult(arrSurvival[PdashaUtil.getRandomSeed(arrSurvival.length,odId)]));
	}

}
if (mrgArr[6]) {
	ArrayList<String> noOfYeras = PdashaUtil.getPastString(ObjHoro);
	String arrTrust[] = PdashaUtil.getStringArrayFromResource("TRUSTHESHE", messages);
	String fullTemplate = PdashaUtil.displayResult(arrTrust[PdashaUtil.getRandomSeed(arrTrust.length,odId)], noOfYeras,
			"past",rBextra);
	out.println();
	out.println(fullTemplate);

}
if (mrgArr[7]) {

	int planetIndex = PdashaUtil.getRemedies(ObjHoro);
	String arrRemedies[] = PdashaUtil.getStringArrayFromResource("REMEDIES", messages);
	ArrayList<String> arrayList1 = PdashaUtil.getRemediesList(planetIndex);
	for (int i = 0; i < arrRemedies.length; i++) {
		//out.println("<br/>"+messages.getString(arrayList1.get(i)));
		out.println(PdashaUtil.displayResult(arrRemedies[i],messages.getString(arrayList1.get(i)),"remedies"));
	}
	

}


%>