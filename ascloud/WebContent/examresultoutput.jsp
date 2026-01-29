<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Your Board Results Prediction</title>
</head>
<body>
<jsp:useBean id="ObjGradeResult" class="com.ojassoft.GradeResult.GradeResult"/>
<jsp:useBean id="ObjFormValid" class="com.ojassoft.GradeResult.FormValidation"/>



<div class="ui-container ui-margin-tb">
	<div id="roundtopheadid">
		<div class="roundtophead">
			
				<div class="AscTopHead">
					<a href="/" title="Home" class="BreadCrumb">Home</a> 
					&#187; <a class="BreadCrumb">Results</a>
				</div>
			
		</div>  
	</div>
	<div class="ui-content bg-light-gray">
	<div class="card-view-content">
	<h1 class="text-center"> 
	 Your Board Results Prediction
	</h1>
	
	<%
String boardType=request.getParameter("boardtype");
String rolnum=request.getParameter("rollno");
String name=request.getParameter("name");

String []nameArray=name.split(" ");
String Firstname=nameArray[0];
char gradeResults;
int printDestinyNumber;
int printDestinyNumberYear;
int printMulankNumber;
String printGradeText = "";
int day =Integer.parseInt(request.getParameter("day"));  
int month =Integer.parseInt(request.getParameter("month"));
int year =Integer.parseInt(request.getParameter("year"));
String printDOB = day + "-" + month + "-" + year;

String date=Integer.toString(day+month+year);
String ryear=request.getParameter("curryear"); 
String pipeDelimited=ObjFormValid.Validation(rolnum, Firstname, day, month, year, ryear);
String []validation=pipeDelimited.split("[|]");


if(validation[0].equals("true"))
{
	gradeResults = ObjGradeResult.calculateGradeResult(rolnum, date, name, ryear);
	printDestinyNumber = ObjGradeResult.getDestinyNumber(date);
	printDestinyNumberYear = ObjGradeResult.getDestinyNumber(ryear);
	printMulankNumber = ObjGradeResult.getNameMulank(name, 0);
	
	switch(gradeResults)
	{
	case 'B':
		printGradeText = "You may have a good result and your possible grade will be <b>\'B\'</b>. Keep it up with hard work with a more focused approach to achieve good grades in your class. Good Luck !";
	break;
	case 'A':
		printGradeText = "You would be getting excellent results as your continuous hard work would work in your favour. Your possible grade will be <b>\'A\'</b>. Although you have a high probability of getting in the list of highest marks takers, don’t be overconfident and continue with this intention of learning. Wish you a very promising Study season Ahead !";
	break;
	case 'C':
		printGradeText = "You may have an above average score in your exams as you might have slight decline in your consistency. Your possible grade will be <b>\'C\'</b>. This is a high time so, don’t wait for anything, keep indulging yourself in a studying approach study hard. Wish you a good study session ahead !";	
	break;
	default:
		printGradeText = "You may have to understand that study is essential for a great career. You may have unintentionally not paid much heed to your studies. As a result, your possible grade will be <b>\'D\'</b>. Hard work and determined approach is the need of an hour. Keep yourself mingling with books and other study stuff and dwell yourself in studies to get good marks. Wish you a progressive result. Good Luck !";
	}

	String gradeA = "", gradeB = "", gradeC = "", gradeD = ""; 
	if (boardType.equals("CBSC")){
		gradeA = "91 to 100";
		gradeB = "75 to 90";
		gradeC = "51 to 74";
		gradeD = "50";
	}
	if (boardType.equals("UPB")){
		gradeA = "81 to 100";
		gradeB = "61 to 80";
		gradeC = "41 to 60";
		gradeD = "40";
	}
%> 



<h2 class="ui-box text-center">
Your Grade Is: <%=gradeResults %>
</h2>

<div class="ui-margin-t">
<p>Your Name is  <b><%=name%></b> and Name Number is  <b><%=printMulankNumber%></b>. 
It shows that you are a person with a commanding and authoritative personality. 
You love to command others and are loyal and honest. 
Sometimes lazy but determination makes you achieve what you wished for.</p>
<ul>
<li>Your Roll No.is  <b><%=rolnum%></b> and Unique Number is  <b><%=printDestinyNumber%></b></li>
<li>Your Date of Birth is  <b><%=printDOB%></b> and Fortune Number is <b> <%=printDestinyNumber%></b></li>
<li>Your result date / Year is  <b><%=ryear%></b> and Year Number is  <b><%=printDestinyNumberYear%></b></li>
</ul>

<p>
<b>Results:</b> <%=printGradeText %>
</p>

<ul>
<li><b>Grade A:</b> between <%=gradeA%>%</li>
<li><b>Grade B:</b> between <%=gradeB%>%</li>
<li><b>Grade C:</b> between <%=gradeC%>%</li>
<li><b>Grade D:</b> below <%=gradeD%>%</li>

</ul>
</div>

<%
}
else{
	out.println(validation[1]);
}
%>

	</div>
	
	<p style="font-size:11px; line-height:18px; padding:12px; margin-top:16px;">
	
	Disclaimer: We would like to highlight the fact that the result obtained from this tool must not be considered FINAL. This information and predictions are provided for astrological, academic and research purposes only and doesn't support any kind of illegal or immoral activities. Kindly do not carry out such activities and wait for your board results.
	</p>
	</div>
	</div>
	
	
</body>
</html>