package com.ojassoft.GradeResult;
import com.ojassoft.astrosagecloud.util.*;



public class FormValidation {
	
		public  String Validation(String rolnum,String name,int day,int month,int year,String ryear){
		//Validate rollNum  
		if(safeInt(rolnum))
		return false+"|Error : Please Enter a Valid Roll-Number";
		if(rolnum.length()>12)
		return false+"|Error : Please Enter a Valid Roll-Number";
				
		//Validate Name
			if(name.equals("")||!name.matches("[A-Za-z]+"))
			return false+"|Error : Please Enter a Valid Name";
		
		//Validate Date Month Year
			
		String yearlength=Integer.toString(year);
		if(yearlength.length()!=4)
		return false+"|Error : Please Enter a Valid Year";	
		if(month>12)
		return false+"|Error :Please Enter a Valid Month";
		if(!checkDay(day, month, year))	
			return false+"|Error :Please Enter a Valid Day";
		// Validate Result-Year
										if(safeInt(ryear))
										return false+"|Error : Please Enter a Valid Result-Year";
										else
										{
											if(!(ryear.length()==4))
												return false+"|Error : Please Enter a Valid Result-Year";
										}
		return true+"|";
		
										
								}

	public static boolean safeInt(String theval)
	{
		
		if(theval != null && !theval.trim().equals(""))
		{
			
			return false;
		}
		return true;
	}
	
	
	
	public static boolean checkDay (int day, int month, int year){
	    boolean valid = false;
	    if(day >=1){
	        // For months with 30 days.
	        if ((month == 4 || month == 6 || month == 9 || month == 11) && day <= 30){
	            valid = true;
	        }
	        // For months with 31 days.
	        if ((month == 1 || month == 3 || month == 5 || month == 7 || month == 8 || month == 10 || month == 12) && day <= 31){
	            valid = true;
	        }
	        // For February.
	        if (month == 2)
	        {
	            if(day <= 28)
	            {
	                valid = true;
	            } else if(day == 29)
	            {
	                if ((year%4 == 0 && year%100!=0) || year%400 == 0)
	                {
	                    valid = true;
	                } //else invalid
	            }
	        }
	    } //else date is not valid
	    return valid;
	}

}
