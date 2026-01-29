package com.ojassoft.astrosagecloud.util;

public class I_RandomNo {
	/**
	 * This method generate random number
	 * @return String strRandomNo
	 */
	 public String generateRandomNo(){        
	        int intPWLength,intCharType;
	        String strRandomNo="";
	        final int intMinPWLength = 6;
	        final int intMaxPWLength = 10;       
	        
	        intPWLength = (int)((intMaxPWLength - intMinPWLength + 1) * Math.random() + intMinPWLength);
	        
	        for(int loopCounter = 1;loopCounter<=intPWLength;loopCounter++){
	            intCharType = (int)((3 * Math.random()) + 1);

	            switch(intCharType){
	            case 1:
	                strRandomNo = strRandomNo + (char)((int)((25 * Math.random()) + 97));
	                break;
	            case 2:
	                strRandomNo = strRandomNo + (char)((int)((25 * Math.random()) + 65));
	                break;
	            case 3:
	                strRandomNo = strRandomNo + (char)((int)((9 * Math.random()) + 48));
	                break;
	            }
	        }
	        
	        return(strRandomNo);
		}

}
