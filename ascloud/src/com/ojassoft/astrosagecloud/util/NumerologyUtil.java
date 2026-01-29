package com.ojassoft.astrosagecloud.util;

public class NumerologyUtil {
	/**
     * This function is used to calculate the Mulank
     *
     * @param dob
     * @return Mulank
     */
    public static int getMulank(String dob) {
        int idob = Integer.parseInt(dob);
        while (String.valueOf(idob).length() > 1) {
            int remainder = idob / 10;
            int division = idob % 10;
            idob = remainder + division;
        }

        return idob;
    }
    /**
     * This function is used to calculate the Namank
     *
     * @param name
     * @param typeVal
     * @return Namank
     */
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
    
    /**
     * This function is used to calculate the NameMulank
     *
     * @param name
     * @param typeVal
     * @return NameMulank
     */

    public static int getNameMulank(String name, int typeVal) {
        int namank = getNamank(name, typeVal);

        return getMulank(String.valueOf(namank));
    }
    
    /**
     * @param fullDob (dd-mm-yyyy)
     * @return destiny number
     */
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
    
 // Function to check String for only Alphabets 
    public static boolean isStringOnlyAlphabet(String strName) 
    { 
    	strName=strName.trim();
    	String firstCharName="";
    	char getFirstChar= strName.charAt(0);
    	firstCharName= firstCharName+getFirstChar;
        return ((strName != null) 
                && (!strName.equals("")) 
                && (firstCharName.matches("^[a-zA-Z]*$"))); 
    }


}
