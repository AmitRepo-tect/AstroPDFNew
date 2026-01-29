package com.ojassoft.astrosagecloud;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONException;
import org.json.JSONObject;

import com.cslsoftware.desktophoro.DesktopHoro;
import com.cslsoftware.util.Constants;
import com.ojassoft.api.CogniAstro;
import com.ojassoft.astrosagecloud.DO.InPlanetKpCusp;
import com.ojassoft.astrosagecloud.util.KCILUtil;
import com.ojassoft.astrosagecloud.util.Util;

/**
 * Servlet implementation class APIServlet
 */

public class APIServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public String[] RIASEC_CODES = {"R", "I", "A", "S", "E", "C"};
	public int[] BAR_PERCENT = {100, 86, 72, 58, 44, 30};
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public APIServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	/*protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}*/

    /*protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("/CloudServlet");
		HttpSession session = request.getSession();
		DesktopHoro objHoro = (DesktopHoro)session.getAttribute("HoroscopeObj");
		String urlParams = "UserName="+URLEncoder.encode(objHoro.getName(), "UTF-8")+"&LanguageCode="+session.getAttribute("languageCode")+
				"&ChartType="+session.getAttribute("chartType")+"&UserPlace="+URLEncoder.encode(objHoro.getPlace(), "UTF-8")+
				"&UserTimeZone="+objHoro.getTimeZone()+"&UserSex="+objHoro.getMaleFemale()+
				"&UserSecondOfBirth="+objHoro.getSecondOfBirth()+"&UserMinuteOfBirth="+objHoro.getMinuteOfBirth()+
				"&UserHourOfBirth="+objHoro.getHourOfBirth()+"&UserDayOfBirth="+objHoro.getDayOfBirth()+
				"&UserMonthOfBirth="+objHoro.getMonthOfBirth()+"&UserYearOfBirth="+objHoro.getYearOfBirth()+
				"&UserDegreeOfLattitude="+objHoro.getDegreeOfLattitude()+"&UserDegreeOfLongitude="+objHoro.getDegreeOfLongitude()+
				"&UserSecondOfLattitude="+objHoro.getSecondOfLattitude()+"&UserSecondOfLongitude="+objHoro.getSecondOfLongitude()+
				"&UserMinuteOfLongitude="+objHoro.getMinuteOfLongitude()+"&UserMinuteOfLattitude="+objHoro.getMinuteOfLattitude()+
				"&UserEastWest="+objHoro.getEastWest()+"&UserNorthSouth="+objHoro.getNorthSouth()+
				"&UserDST="+objHoro.getDST()+"&UserAyanamsaType="+objHoro.getAyanamsaType()+
				"&UserKPHorarySeed="+objHoro.getKPHorarySeed()+"&VarshphalYear=&fontstyle="+session.getAttribute("fontstyle");
		

		String forwardTo = "/cloud/personalitytype.jsp";
		
		try
		{
			String url = "http://192.168.1.147:8082/api?"+urlParams;
			//String url = "http://aspdf.astrosage.com/api?"+urlParams;
			
			
		    URL obj = new URL(url);
		    HttpURLConnection con = (HttpURLConnection) obj.openConnection();
		    String responseString = "";
		    con.setRequestMethod("GET");
		    int responseCode = con.getResponseCode();
		    if(responseCode==200){
			   BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF8"));
			   String inputLine;
			   StringBuffer responseTxt = new StringBuffer();
		   
			    while ((inputLine = in.readLine()) != null) {
			   		responseTxt.append(inputLine);
			   	}
		   		in.close();
		   		responseString = responseTxt.toString();
		   }
		    //String jsonstring = "{'Dominant': 'I', 'DominantDescription':'You are Investigative.','SubDominant': 'R','SubDominantDescription':'You are Enterprising.'}";
		    HashMap<String,String> map = jsonToMap(responseString);        
		    session.setAttribute("PMap", map);
			request.getRequestDispatcher(forwardTo).forward(request, response);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}*/
    
    /**
     * This servlet will be invoked from CogniAstro for calculating and displaying the personality types.
     * Following is the logic followed in this method:
     * 1) Create DesktopHoro Object with the parameters received in request.
     * 2) From the request, the psychological scores of all RIASEC personalities is received 
     *	  from riasecCodeValue method. This returns an array
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
		request.getSession().setAttribute("languageCode", 0);
		CloudServlet cloud = new CloudServlet();
		DesktopHoro objHoro = null;
		try
		{
			objHoro = cloud.createHoroscopeObject(request, getServletContext());
			request.getSession().setAttribute("HoroscopeObj", objHoro);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		HttpSession session = request.getSession();
		
		int[] riasecArray = riasecCodeValue(request);
		session.setAttribute("riasecArray", riasecArray);
		
		int[] ranking = CogniAstro.getRiasecRank(objHoro);
		
		int[] updatedBarPercent = new int[6];
		Map<Integer, Integer> hm = new HashMap<Integer, Integer>();
		for(int i=0;i<6;i++)
		{
			updatedBarPercent[i] = BAR_PERCENT[i] + riasecArray[ranking[i]];
			if(updatedBarPercent[i] > 100)
			{
				updatedBarPercent[i] = 100;
			}
			if(updatedBarPercent[i] < 8)
			{
				updatedBarPercent[i] = 8;
			}
			hm.put(ranking[i], updatedBarPercent[i]);
		}
		
		Map<Integer, Integer> sortedNoHM = sortMapByValues(hm);
		
		Map<String, Integer> sortedHM = new LinkedHashMap<String, Integer>();
		
		for (Map.Entry<Integer, Integer> entry : sortedNoHM.entrySet()) {
			sortedHM.put(RIASEC_CODES[entry.getKey()], entry.getValue());
		}
		
		String forwardTo = "/cloud/displaypersonalitytype.jsp";
		session.setAttribute("PMap", sortedHM);
		List<String> personalityList = getPersonalityList(CogniAstro.getRiasecRank(objHoro));
		request.getRequestDispatcher(forwardTo).forward(request, response);
	}
    
	
	public static HashMap<String, String> jsonToMap(String t) throws JSONException {

        HashMap<String, String> map = new HashMap<String, String>();
        JSONObject jObject = new JSONObject(t);
        Iterator<?> keys = jObject.keys();

        while( keys.hasNext() ){
            String key = (String)keys.next();
            String value = jObject.getString(key); 
            map.put(key, value);

        }

        return map;
    }
	
		
	/**
	 * This method returns the list of personlityType Codes corresoponding to their number
	 * @param personalityCodes
	 * @return List<String> - List of personalityCodes in the order of their rank.
	 */
	public List<String> getPersonalityList(int[] personalityCodes)
	{
		List<String> list = new ArrayList<String>();
		for(int code : personalityCodes)
		{
			list.add(RIASEC_CODES[code]);
		}
		return list;
	}
	
	public int[] riasecCodeValue(HttpServletRequest request)
	{
		int[] riasecArray = new int[6];
		for(int i=0;i<6;i++)
		{
			int temp = Util.safeInt(request.getParameter(RIASEC_CODES[i].toLowerCase()));
			
			//-9 is done because the values received are 1,2,3,4,5.
			//Expected are: -2,-1,0,1,2 which they are unable to send.
			riasecArray[i] = (temp - 9) * 3;
		}
		//int[] riasecArray = {6, 12, -12, -6, -18, 3};
		return riasecArray;
	}
	
	// function to sort hashmap by values 
    public HashMap<Integer, Integer> sortMapByValues(Map<Integer, Integer> hm) 
    { 
        // Create a list from elements of HashMap 
        List<Map.Entry<Integer, Integer> > list = 
               new LinkedList<Map.Entry<Integer, Integer> >(hm.entrySet()); 
  
        // Sort the list 
        Collections.sort(list, new Comparator<Map.Entry<Integer, Integer> >() { 
            public int compare(Map.Entry<Integer, Integer> o1,  
                               Map.Entry<Integer, Integer> o2) 
            { 
                return (o2.getValue()).compareTo(o1.getValue()); 
            } 
        }); 
          
        // put data from sorted list to hashmap  
        HashMap<Integer, Integer> temp = new LinkedHashMap<Integer, Integer>(); 
        for (Map.Entry<Integer, Integer> aa : list) { 
            temp.put(aa.getKey(), aa.getValue()); 
        } 
        return temp; 
    } 
}
