package com.ojassoft.astrosagecloud.localization;

import java.util.HashMap;

public class GetallPropertiesConstants{
	private String keys[],vals[];
	/**
	 * This method is called inside getValuesFromDictionary to convert constants properties according to language code passed.
	 * @param langCode
	 * @return HashMap containing key in English and value according to language code passed. 
	 */
	public HashMap<String, String> convertPropertiesToConstants(int langCode){
		Local localObj = new Local();
		MyResourceBundle rBEnglishConst = localObj.loadPropertiesFileNew("constant-properties",0);
		MyResourceBundle rBTamilConst = localObj.loadPropertiesFileNew("constant_ta-properties",0);
		MyResourceBundle rBBangaliConst = localObj.loadPropertiesFileNew("constant_bn-properties",0);
		MyResourceBundle rBGujratiConst = localObj.loadPropertiesFileNew("constant_gu-properties",0);
		HashMap<String,String> hashMap = new HashMap<String, String>();
		if(langCode!=0){
			for(int i=0 ;i<68;i++){
				keys = rBEnglishConst.getString("EngConstantValues"+i).split("�");
	           /* if (langCode == 1) {
	                //vals = rBHindiConst.getString("HinConstantValues"+i).split("ÿ"); 
	            }
	            else*/ if (langCode == 2) {
	                vals = rBTamilConst.getString("TamConstantValues"+i).split("ÿ");
	            }
	            else if(langCode ==  6)
	            {
	            	vals = rBBangaliConst.getString("BenConstantValues"+i).split("ÿ");
	            }
	            //uncomment and convert following code according to requirement.
	         /* else  if (langCode == 4) {
	               // vals = split(KanConstantValues(i),"ÿ")
	            }
	            else if (langCode == 5) {
	              //  vals = split(TelConstantValues(i),"ÿ")
	            }
	            else if (langCode == 6) {
	              //  vals = split(BenConstantValues(i),"ÿ")
	            }*/
	            else if (langCode == 7) {
	                vals = rBGujratiConst.getString("GujConstantValues"+i).split("ÿ");
	            }
	            /*else if (langCode == 8) {
	              //  vals = split(MalConstantValues(i),"ÿ")
	            }
	            else if (langCode == 9) {
	             //   vals = split(MarConstantValues(i),"ÿ")
	            }*/
	                   
	            for(int j=0; j<vals.length;j++)
	            {
	            	String key = keys[j];
	            	String val = vals[j];
	            	hashMap.put(key, val);
	            }
			}        
        }
		return hashMap;
     }
	/**
	 * This methid is used to convert result according to langauage code based on key passed in this.
	 * @param key
	 * @param langCode
	 * @return String perameter returnValue according to langauge specific. 
	 */
	public String getValuesFromDictionary(String key,int langCode){
		String returnValue="";
		String splittedVals[];
		HashMap<String,String> hashM= convertPropertiesToConstants(langCode);
	    if(langCode == 0){
	        returnValue = key;
	    }
	    else{
	        if (key != null && (key.indexOf(","))>0){
	            splittedVals = key.split(",");
	            for (int i=0;i<splittedVals.length;i++){
	                returnValue = returnValue + splittedVals[i] +",";
             }
	            returnValue = returnValue.substring(0, returnValue.length()-1);
	        } else{
	        	
	            returnValue = hashM.get(key);
	        }
	    }
	    return returnValue;
	}
  }