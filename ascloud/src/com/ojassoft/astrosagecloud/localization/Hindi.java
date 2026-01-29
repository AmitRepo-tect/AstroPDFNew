package com.ojassoft.astrosagecloud.localization;

import com.ojassoft.astrosagecloud.localization.GetallPropertiesConstants;
import com.ojassoft.astrosagecloud.util.Util;

public class Hindi {

	String modifiedSubstring;
	int arrayOneLength;
	String[] arrayOne = {"ñ", "Q+Z", "sas", "aa", ")Z", "ZZ", "‘", "’", "“", "”",

		"å", "ƒ", "„", "…", "†", "‡", "ˆ", "‰", "Š", "‹",

		"¶+", "d+", "[+k", "[+", "x+", "T+", "t+", "M+", "<+", "Q+", ";+", "j+", "u+",
		"Ùk", "Ù", "ä", "–", "—", "é", "™", "=kk", "f=k",

		"à", "á", "â", "ã", "ºz", "º", "í", "{k", "{", "=", "«",
		"Nî", "Vî", "Bî", "Mî", "<î", "|", "K", "}",
		"J", "Vª", "Mª", "<ªª", "Nª", "Ø", "Ý", "nzZ", "æ", "ç", "Á", "xz", "#", ":",

		"v‚", "vks", "vkS", "vk", "v", "b±", "Ã", "bZ", "b", "m", "Å", ",s", ",", "_",

		"ô", "d", "Dk", "D", "[k", "[", "x", "Xk", "X", "Ä", "?k", "?", "³",
		"pkS", "p", "Pk", "P", "N", "t", "Tk", "T", ">", "÷", "¥",

		"ê", "ë", "V", "B", "ì", "ï", "M+", "<+", "M", "<", ".k", ".",
		"r", "Rk", "R", "Fk", "F", ")", "n", "/k", "èk", "/", "Ë", "è", "u", "Uk", "U",

		"i", "Ik", "I", "Q", "¶", "c", "Ck", "C", "Hk", "H", "e", "Ek", "E",
		";", "¸", "j", "y", "Yk", "Y", "G", "o", "Ok", "O",
		"'k", "'", "\"k", "\"", "l", "Lk", "L", "g",

		"È", "z",
		"Ì", "Í", "Î", "Ï", "Ñ", "Ò", "Ó", "Ô", "Ö", "Ø", "Ù", "Ük", "Ü",

		"‚", "ks", "kS", "k", "h", "q", "w", "`", "s", "S",
		"a", "¡", "%", "W", "•", "·", "∙", "·", "~j", "~", "\\", "+", " ः",
		"^", "*", "Þ", "ß", "(", "¼", "½", "¿", "À", "¾", "A", "-", "&", "&", "Œ", "]", "~ ", "@"};
	String[] arrayTwo = {"॰", "QZ+", "sa", "a", "र्द्ध", "Z", "\"", "\"", "'", "'",

			"०", "१", "२", "३", "४", "५", "६", "७", "८", "९",

	"फ़्", "क़", "ख़", "ख़्", "ग़", "ज़्", "ज़", "ड़", "ढ़", "फ़", "य़", "ऱ", "ऩ",    // one-byte nukta varNas
	"त्त", "त्त्", "क्त", "दृ", "कृ", "न्न", "न्न्", "=k", "f=",

	"ह्न", "ह्य", "हृ", "ह्म", "ह्र", "ह्", "द्द", "क्ष", "क्ष्", "त्र", "त्र्",
	"छ्य", "ट्य", "ठ्य", "ड्य", "ढ्य", "द्य", "ज्ञ", "द्व",
	"श्र", "ट्र", "ड्र", "ढ्र", "छ्र", "क्र", "फ्र", "र्द्र", "द्र", "प्र", "प्र", "ग्र", "रु", "रू",

	"ऑ", "ओ", "औ", "आ", "अ", "ईं", "ई", "ई", "इ", "उ", "ऊ", "ऐ", "ए", "ऋ",

	"क्क", "क", "क", "क्", "ख", "ख्", "ग", "ग", "ग्", "घ", "घ", "घ्", "ङ",
	"चै", "च", "च", "च्", "छ", "ज", "ज", "ज्", "झ", "झ्", "ञ",

	"ट्ट", "ट्ठ", "ट", "ठ", "ड्ड", "ड्ढ", "ड़", "ढ़", "ड", "ढ", "ण", "ण्",
	"त", "त", "त्", "थ", "थ्", "द्ध", "द", "ध", "ध", "ध्", "ध्", "ध्", "न", "न", "न्",

	"प", "प", "प्", "फ", "फ्", "ब", "ब", "ब्", "भ", "भ्", "म", "म", "म्",
	"य", "य्", "र", "ल", "ल", "ल्", "ळ", "व", "व", "व्",
	"श", "श्", "ष", "ष्", "स", "स", "स्", "ह",

	"ीं", "्र",
	"द्द", "ट्ट", "ट्ठ", "ड्ड", "कृ", "भ", "्य", "ड्ढ", "झ्", "क्र", "त्त्", "श", "श्",

	"ॉ", "ो", "ौ", "ा", "ी", "ु", "ू", "ृ", "े", "ै",
	"ं", "ँ", "ः", "ॅ", "ऽ", "ऽ", "ऽ", "ऽ", "्र", "्", "?", "़", ":",
	"‘", "’", "“", "”", ";", "(", ")", "{", "}", "=", "।", ".", "-", "µ", "॰", ",", "् ", "/"};
	/**
	 * This method is used to convert input string in specific language according to language code passed.
	 * @param legacyText languageCode
	 * @return String According to language code passed. 
	 */
	public String unicode(String legacyText,int languageCode) {
		//GetallPropertiesConstants getallProperties = new GetallPropertiesConstants();
	    if(languageCode == 1){
	        return formatString(legacyText);
	    	//return (legacyText);
	}else if (languageCode == 2 || languageCode == 4 || languageCode == 5 || languageCode == 6 || languageCode == 7 || languageCode == 8 || languageCode == 9) {
	    	String valueFromGetall = Util.getValuesFromDictionary(legacyText,languageCode);
	        if (valueFromGetall == null)
	        {
	        	return legacyText;
	        }
	        else
	        {
	        	return valueFromGetall;
	        }
	    	
	    	//String constantPropertiesFileName = "tamilproperties_ta";
	    	//local localobj = new local();
	    	//localobj.loadPropertiesFile(constantPropertiesFileName,languageCode);
	    	//return(legacyText);
	    }
	    else
	        return(legacyText);
	}
	/**
	 * This method is used to format String
	 * @param legacyText
	 * @return  String
	 */
	public String formatString(String legacyText) {
       
		String processedText = "";  //blank
		if(legacyText != null)
		{
        
        //Corrections for Spelling mistakes (see above under the first Array):
        // "sas","aa","ZZ","=kk","f=k",
        //
        // The following two characters are to be replaced through proper checking of locations:
        // "Z" )
        // "र्" (reph) 

        // "f" )
        // "ि"  


        arrayOneLength = arrayOne.length;

        modifiedSubstring = legacyText;

        //****************************************************************************************
        //  Break the long text into small bunches of max. max_text_size  characters each.
        //****************************************************************************************
        int textSize = legacyText.length();

        int sthiti1 = 0; int sthiti2 = 0; int chaleChalo = 1;

        int maxTextSize = 6000;

        while (chaleChalo == 1) {
            sthiti1 = sthiti2;

            if (sthiti2 < (textSize - maxTextSize)) {
                sthiti2 += maxTextSize;
                while (legacyText.charAt(sthiti2) != ' ') { 
                	sthiti2--; 
                	}
            }
            else { 
            	sthiti2 = textSize; 
            	chaleChalo = 0; 
			}
            }

            modifiedSubstring = legacyText.substring(sthiti1, sthiti2);

            replaceSymbols();

            processedText += modifiedSubstring;

            //****************************************************************************************
            //  Breaking part code over
            //****************************************************************************************
            //  processed_text = processed_text.replace( /mangal/g , "Krutidev010" ) ;   
		}
            return processedText;
        }
	/**
	 * This method is used to replace some specific Symbols
	 * @param 
	 * @return  
	 */
	public void replaceSymbols() {
		int idx,positionOfI;
		
        //substitute array_two elements in place of corresponding array_one elements

        if (modifiedSubstring != "")  // if string to be converted is non-blank then no need of any processing.
        {
            for (int inputSymbolIdx = 0; inputSymbolIdx < arrayOneLength; inputSymbolIdx++) {

                idx = 0;  // index of the symbol being searched for replacement

                while (idx != -1) //while-00
                {

                	modifiedSubstring = modifiedSubstring.replace(arrayOne[inputSymbolIdx], arrayTwo[inputSymbolIdx]);
                    idx = modifiedSubstring.indexOf(arrayOne[inputSymbolIdx]);

                } // end of while-00 loop
            } // end of for loop

            //**********************************************************************************
            // Code for Replacing five Special glyphs
            //**********************************************************************************

            //**********************************************************************************
            // Code for Glyph1 : ± (reph+anusvAr)
            //**********************************************************************************
            modifiedSubstring = modifiedSubstring.replaceAll("±", "Zं"); // at some places  ì  is  used eg  in "कर्कंधु,पूर्णांक".
            //
            //**********************************************************************************
            // Glyp2: Æ
            // code for replacing "f" with "ि" and correcting its position too. (moving it one position forward)
            //**********************************************************************************

            modifiedSubstring = modifiedSubstring.replaceAll("Æ", "र्f");  // at some places  Æ  is  used eg  in "धार्मिक".

            positionOfI = modifiedSubstring.indexOf("f");

            while (positionOfI != -1)  //while-02
            {
                char characterNextToI = modifiedSubstring.charAt(positionOfI + 1);
                String characterToBeReplaced = "f" + characterNextToI;
        		modifiedSubstring = modifiedSubstring.replace(characterToBeReplaced, characterNextToI + "ि");
        		positionOfI = modifiedSubstring.indexOf("f", positionOfI + 1); // search for i ahead of the current position.

            } // end of while-02 loop

            //**********************************************************************************
            // Glyph3 & Glyph4: Ç  É
            // code for replacing "fa" with "िं"  and correcting its position too.(moving it two positions forward)
            //**********************************************************************************

            modifiedSubstring = modifiedSubstring.replaceAll("Ç", "fa"); // at some places  Ç  is  used eg  in "किंकर".
            modifiedSubstring = modifiedSubstring.replaceAll("É", "र्fa"); // at some places  É  is  used eg  in "शर्मिंदा"

            positionOfI = modifiedSubstring.indexOf("fa");

            while (positionOfI != -1)  //while-02
            {
                char characterNextToIp2 = modifiedSubstring.charAt(positionOfI + 2);
                String characterToBeReplaced = "fa" + characterNextToIp2;
        		modifiedSubstring = modifiedSubstring.replace(characterToBeReplaced, characterNextToIp2 + "िं");
                positionOfI = modifiedSubstring.indexOf("fa", positionOfI + 2); // search for i ahead of the current position.                
            } // end of while-02 loop

            //**********************************************************************************
            // Glyph5: Ê
            // code for replacing "h" with "ी"  and correcting its position too.(moving it one positions forward)
            //**********************************************************************************

            modifiedSubstring = modifiedSubstring.replaceAll("Ê", "ीZ"); // at some places  Ê  is  used eg  in "किंकर".


            /*
            var position_of_i = modified_substring.indexOf( "h" )

while ( position_of_i != -1 )  //while-02
            {
            var charecter_next_to_i = modified_substring.charAt( position_of_i + 1 )
            var charecter_to_be_replaced = "h" + charecter_next_to_i
            modified_substring = modified_substring.replace( charecter_to_be_replaced , charecter_next_to_i + "ी" ) 
            position_of_i = modified_substring.search( /h/ , position_of_i + 1 ) // search for i ahead of the current position.

} // end of while-02 loop
            */


            //**********************************************************************************
            // End of Code for Replacing four Special glyphs
            //**********************************************************************************

            // following loop to eliminate 'chhotee ee kee maatraa' on half-letters as a result of above transformation.

            int positionOfWrongEe = modifiedSubstring.indexOf("ि्");

            while (positionOfWrongEe != -1)  //while-03
            {
                char consonentNextToWrongEe = modifiedSubstring.charAt(positionOfWrongEe + 2);
                String characterToBeReplaced = "ि्" + consonentNextToWrongEe;
        		modifiedSubstring = modifiedSubstring.replace(characterToBeReplaced, "्" + consonentNextToWrongEe + "ि");
        		positionOfWrongEe = modifiedSubstring.indexOf("ि्", positionOfWrongEe + 2); // search for 'wrong ee' ahead of the current position. 

            } // end of while-03 loop

            //**************************************
            // 
            //**************************************
            //   alert(modified_substring);
            //**************************************

            // Eliminating reph "Z" and putting 'half - r' at proper position for this.
            String setOfMatras = "अ आ इ ई उ ऊ ए ऐ ओ औ ा ि ी ु ू ृ े ै ो ौ ं : ँ ॅ";
            int positionOfR = modifiedSubstring.indexOf("Z");

            while (positionOfR > 0)  // while-04
            {
                int probablePositionOfHalfR = positionOfR - 1;
                char characterAtProbablePositionOfHalfR = modifiedSubstring.charAt(probablePositionOfHalfR);


                // trying to find non-maatra position left to current O (ie, half -r).

                while (setOfMatras.matches("(.*)"+String.valueOf(characterAtProbablePositionOfHalfR)+"(.*)"))  // while-05
                {
                	probablePositionOfHalfR = probablePositionOfHalfR - 1;
                	characterAtProbablePositionOfHalfR = modifiedSubstring.charAt(probablePositionOfHalfR);

                } // end of while-05


                //String characterToBeReplaced = modifiedSubstring.substring(probablePositionOfHalfR, (positionOfR - probablePositionOfHalfR));
                String characterToBeReplaced = modifiedSubstring.substring(probablePositionOfHalfR, positionOfR);
                String newReplacementString = "र्" + characterToBeReplaced;
                characterToBeReplaced = characterToBeReplaced + "Z";
                modifiedSubstring = modifiedSubstring.replace(characterToBeReplaced, newReplacementString);
                positionOfR = modifiedSubstring.indexOf("Z");

            } // end of while-04

        } // end of IF  statement  meant to  supress processing of  blank  string.

        //**************************************
        //   alert(modified_substring);
        //**************************************


    } // end of the function  Replace_Symbols


} // end of class hindi


