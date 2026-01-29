package com.ojassoft.astrosagecloud.localization;


import java.io.UnsupportedEncodingException;
import java.util.*;

import com.ojassoft.astrosagecloud.util.Util;

public class Local{
	
	/**
	 * The specific language(corresponding to languagecode) properties file (by name passed in parameters) 
	 * is loaded and is returned.
	 * @param fileName
	 * @param languageCode
	 * @return The LanguageSpecific Properties File (ResourceBundle)
	 */
	public ResourceBundle loadPropertiesFile(String fileName, int languageCode){
		String[] languageSuffix = {"","_hi","_ta","","_ka","_te","_bn","_gu","_ml","_mr","_ur"};
		ResourceBundle resource=null; 
		Locale locale = new Locale("en", "US");	
		resource = ResourceBundle.getBundle("com.ojassoft.astrosagecloud.resources.properties."+fileName+languageSuffix[languageCode],locale);	 
		//System.getProperty("user.dir");	
		 //String name=resource.getString("Name");
		return(resource);	 	
	}

	/**
	 * The specific language(corresponding to languagecode) properties file (by name passed in parameters) 
	 * is loaded and is returned.
	 * @param fileName
	 * @param languageCode
	 * @return The LanguageSpecific Properties File (Customized ResourceBundle - MyResourceBundle)
	 */
	public MyResourceBundle loadPropertiesFileNew(String fileName, int languageCode){
		String[] languageSuffix = {"","_hi","_ta","","_ka","_te","_bn","_gu","_ml","_mr"};
		ResourceBundle resource=null; 
		Locale locale = new Locale("en", "US");	
		resource = ResourceBundle.getBundle("com.ojassoft.astrosagecloud.resources.properties."+fileName+languageSuffix[languageCode],locale);
		MyResourceBundle mrb = new MyResourceBundle(resource);
		//System.getProperty("user.dir");	
		 //String name=resource.getString("Name");
		return(mrb);	 	
	}


public String getStringBytes(String key){	
	try{
	String bytekey = new String(key.getBytes("ISO-8859-1"), "UTF-8");	
	return bytekey;
	}
	catch (UnsupportedEncodingException e) {
        return key;
    }
}

public String[] getStringArray(String key){
 String retrunarr[] = key.split("#");
	return(retrunarr);	
}
public String correctSeperator(String getWrongString){
	
	String correctString = getWrongString.replace("+", ":");
	return(correctString);
}
public String correctSeperator1(String getWrongString){
	
	String correctString = getWrongString.replace("-", ":");
	String str="";
	int i=0;
	for(char s:correctString.toCharArray())
	{
		if(i==0 && s=='0')
		{
			
		}
		else{
		str+=s;
		}
		i++;
	}
	
	return str;
}
public String correctSeperatorDot(String getWrongString)
{
	String correctString = getWrongString.replace("+",".");
	return(correctString);
}
public String correctSeperatorHypen(String getWrongString){
	
	String correctString = getWrongString.replace(".", "-");
	return(correctString);
}

/**
 * Returns the languageSpecific dasha.
 * @param legacy_text
 * @param languageCode
 * @return String
 */
public String unicodefForDasha(String legacy_text, int languageCode){
	int i;
	String returnValue = "";
	String charSequenceToFind = " ";//,returnValue;
	if(legacy_text.contains(charSequenceToFind)){
		String dashatext[] = legacy_text.split(charSequenceToFind);
		for(i=0;i<dashatext.length;i++){
			if (!dashatext[i].equals("") && dashatext[i].trim().matches("[a-zA-Z]+"))
			{
				String x = Util.getValuesFromDictionary(dashatext[i], languageCode);
				if("".equals(x)){
					returnValue = returnValue +" "+ dashatext[i];
				}
				else
				{
					returnValue = returnValue +" "+ x;
				}
			}
			else
			{
				returnValue = returnValue +" "+ dashatext[i];
			}
		}
		return(returnValue);
	}
	else{
		return(legacy_text);		
	}	
	//return(returnValue);
}


public String getRNSSData(String rnss, String delimiter, int languageCode){   
String rnssreturndata;
String tempstr = "";
Hindi hindi = new Hindi();
if(languageCode == 1){
   rnssreturndata = hindi.unicode(rnss,languageCode);
    		}
else{
   String[] rnssArr = rnss.split(delimiter);
    for(int arrCounter=0; arrCounter<rnssArr.length; arrCounter++){
        tempstr = tempstr + hindi.unicode(rnssArr[arrCounter],languageCode)+delimiter;
}
    rnssreturndata = tempstr.substring(0, tempstr.length()-1);
}        
return(rnssreturndata);
}

/**
 * This method replaces chunks of strings with the passed in string array objects.
 * @param data - The string from which @@...$ has to be removed.
 * @param arr - Array of strings which will replace @@..$ substring in data
 * @return String
 */

/*/
public String getDesiredString(String data,String [] arr){
	System.out.println("b4  "+data);
    for (int i = 0; i < arr.length; i++) {
        data = data.replaceFirst("\\@@.*?\\$",arr[i]);
    }
    System.out.println("after "+data);
    return data;
}
/*/

public String getDesiredString(String str, String a[])
{
	int i=0;
    StringBuffer sb=new StringBuffer(str);
    while(i<a.length)
    {
        int s1=sb.indexOf("@@");
        int s2=sb.indexOf("$");
        if(s1!=-1&&s2!=-1)
        sb.replace(s1,s2+1,a[i]);
        i++;
    }
    return sb.toString();
}

}

