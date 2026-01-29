package com.ojassoft.GradeResult;


public class GradeResult 
{  
	public static final int ROLLNO_DESTINY=0;
	public static final int NAME_MULANK=1;
	public static final int DOB_DESTINY=2;
	public static final int RESULT_YEAR=3;

	/**
	 * @param rollno = get user roll no
	 * @param fullDob = get user's date of birth
	 * @param getName =get user name
	 * @param rYear =get user's result of year
	 * @return grade of user's result
	 */
	public  char calculateGradeResult(String rollno,String fullDob,String getName,String rYear){
	    { 
	    	
		 
		 int count=0,totalFriend=0,totalEnemy=0,totalNeutral=0;
	  int userinput[]= new int[4];
	 
	  userinput[ROLLNO_DESTINY] =   getDestinyNumber(rollno);          //rollno
	  userinput[NAME_MULANK] = getNameMulank(getName, 0);     // name
	  userinput[DOB_DESTINY] = getDestinyNumber(fullDob);          //dob
	  userinput[RESULT_YEAR] = getDestinyNumber(rYear);          //resultyear
	  
	        int[][] friends = {{ 1,2,3,9 },{2,1,3},{3,1,2,9},{4,5,6,8},{5,1,4,6},{6,4,5,8},{7,8,6,5},{8,4,5,6},{9,1,2,3} }; 
	        int[][] enemy = {{ 4,6,8 },{5,4},{5,6},{1,2,9},{2},{1,2},{1,2,9},{1,2,9},{5,4} };
	        int[][] neutral = {{5,7 },{6,7,8,9},{4,7,8},{3,7},{3,7,8,9},{3,7,9},{3,4},{3,7},{6,7,8}};
	    for(int s=1;s<userinput.length;s++)
	    {
	        for (int i =userinput[ROLLNO_DESTINY]-1; i<=userinput[ROLLNO_DESTINY]-1; i++) 
	        {
	            for (int j =0; j<friends[i].length; j++)
	            {
	            	if(userinput[s]==friends[i][j])
	            	{
	            		totalFriend++;
	            		count++;
	            		
	            	}
	            }     
	     
	        if(count<3)
	        {
	            for (int j =0; j<enemy[i].length; j++)
	            {
	            	if(userinput[s]==enemy[i][j])
	            	{
	            		totalEnemy++;
	            		count++;
	            		
	            	}
	            }     
	       }
	        
	        if(count<3)
	        {
	            for (int j =0; j<neutral[i].length; j++)
	            {
	            	if(userinput[s]==neutral[i][j])
	            	{
	            		totalNeutral++;
	            		count++;	
	            	}
	            }     
	       }
	        
	    }
	    } 
	    if(totalFriend==3)
	    {
	    	return 'A';
	    }
	    if(totalNeutral==3 || (totalFriend==1 && totalNeutral==2) || (totalFriend==2 && totalEnemy==1) || (totalFriend==2 && totalNeutral==1)  || (totalFriend==1 && totalNeutral==1 && totalEnemy==1))
	    {
	    	return 'B';
	    }
	    if((totalFriend==1 && totalEnemy==2) || (totalEnemy==1 && totalNeutral==2)|| (totalNeutral==1 && totalEnemy==2))
	    {
	    	return 'C';
	    }
	    if(totalEnemy==3 )
	    {
	    	return 'D';
	    }
	   return ' ';
       }
	 	 
}
	public static int getDestinyNumber(String fullDob) {
	       int result = 0;
	       try {

	           int sumOfDob = 0;
	           char[] charArray = fullDob.toCharArray();
	           for (int i = 0; i < charArray.length; i++) {

	               char singleChar = charArray[i];

	               if (!Character.isDigit(singleChar)) continue;

	               int num = Character.getNumericValue(singleChar);
	               sumOfDob = sumOfDob + num;
	           }

	           // calculate sum till single digit
	           while (sumOfDob > 9) {
	               int num = sumOfDob;
	               int sum = 0;
	               while (num > 0) {
	                   sum = sum + num % 10;
	                   num = num / 10;
	               }
	               sumOfDob = sum;
	           }
	           return sumOfDob;
	       } catch (Exception e) {

	       }
	       return result;
	       
	   }
	public static int getNameMulank(String name, int typeVal) {
	       int namank = getNamank(name, typeVal);

	       return getMulank(String.valueOf(namank));
	   }
	public static int getNamank(String name, int typeVal) {
	       char[] alphabet = new char[]{'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'};
	       int[] cheiro = new int[]{1, 2, 3, 4, 5, 8, 3, 5, 1, 1, 2, 3, 4, 5, 7, 8, 1, 2, 3, 4, 6, 6, 6, 5, 1, 7};
	       int[] sepherial = new int[]{1, 2, 2, 4, 5, 8, 3, 8, 1, 1, 2, 3, 4, 5, 7, 8, 1, 2, 3, 4, 6, 6, 6, 6, 1, 7};
	       int[] modern = new int[]{1, 2, 3, 4, 5, 6, 7, 8, 9, 1, 2, 3, 4, 5, 6, 7, 8, 9, 1, 2, 3, 4, 5, 6, 7, 8};
	       int[] pythagorian = new int[]{1, 2, 3, 4, 5, 6, 7, 8, 9, 1, 2, 3, 4, 5, 6, 7, 8, 9, 1, 2, 3, 4, 5, 6, 7, 8};

	       int[][] type = {cheiro, sepherial, modern, pythagorian};
	       int namank = 0;
	       name = name.toUpperCase();
	       for (int i = 0; i < name.length(); i++) {
	           char c = name.charAt(i);
	           for (int j = 0; j < alphabet.length; j++) {
	               if (alphabet[j] == c) {
	                   namank += type[typeVal][j];
	             
	               }
	           }
	       }
	       
	       return namank;
	   }
	
	public static int getMulank(String dob) {
	       int idob = Integer.parseInt(dob);
	       while (String.valueOf(idob).length() > 1) {
	           int remainder = idob / 10;
	           int division = idob % 10;
	           idob = remainder + division;
	       }	       return idob;
	   }

	 }