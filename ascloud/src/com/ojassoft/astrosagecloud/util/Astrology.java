package com.ojassoft.astrosagecloud.util;

import com.cslsoftware.desktophoro.DesktopHoro;
import com.cslsoftware.util.SUtil;
import com.ojassoft.astrosagecloud.localization.MyProperties;
import com.ojassoft.astrosagecloud.localization.MyResourceBundle;

public class Astrology
{
	/**
	 * This method returns the houseLord
	 * @param houseNumber, myAstrologyObject
	 * @return int houseLordSign
	 */
	public static int getHouseLord(int houseNumber, DesktopHoro myAstrologyObject)
	{
	    int lagnaNumber = myAstrologyObject.getLagna();
	    int houseLordSign = lagnaNumber + houseNumber;
	    if(houseLordSign > 12) 
	    {
	    	houseLordSign = houseLordSign - 12;
		}
	    int [] SignLord = new int[]{3,6,4,2,1,4,6,3,5,7,7,5};
	    return SignLord[houseLordSign-1];
	    
	}

	/*
	 * 
//********************************************Code For Select Lord Rashi Number********************************************************

//Calculate rasiToBhava Position in a Traditional Chart**/
	/**
	 * Calculate rasiToBhava Position in a Traditional Chart
	 * @param lagnaRasi, planetRasi
	 * @return int rasiToBhava
	 */
public static int rasiToBhava(int lagnaRasi, int planetRasi){
        int bhava ;
        bhava = planetRasi - lagnaRasi;
        if(bhava < 0 ){ bhava = bhava + 12;}
        int rasiToBhava = bhava + 1;
        return(rasiToBhava);
}
/**
 * This method is returns planetbhav.
 * @param AscendentPosition, planetPosition
 * @return int tempBhava
 */
public static int GetPlanetInBhava(int AscendentPosition , int planetPosition ) 
{
    int tempBhava = planetPosition - AscendentPosition + 1;
    if (tempBhava <= 0) 
    {
    	tempBhava = tempBhava + 12;
    }
    return tempBhava;
}


//Function For get KalsarpaYoga name
/**
 * This method is returns the type of kalsarpa Yoga details.
 * Parameter returnEnglish indicates, that we do not need the other language versions, 
 * we just need the parameter name in english, so that it can be used in getKalsarpaYogaIntroduction
 * @param RahuHouse, KetuHouse, rbKalsarpaYoga 
 * @return String KalsarpaYoga
 */
public static String getTypesofKalsarpaYoga(String RahuHouse,String KetuHouse,MyResourceBundle rbKalsarpaYoga, boolean returnEnglish){
   String PlantPos = RahuHouse+","+KetuHouse;
   String KalsarpaYoga="";
   
   if(PlantPos.equals("1,7"))
		   {
	   if (returnEnglish)
		   KalsarpaYoga = "ANNANT_KALSARPA_YOGA";
	   else
		   KalsarpaYoga = rbKalsarpaYoga.getString("ANNANT_KALSARPA_YOGA");
		   }
   else if(PlantPos.equals("2,8")){
	   if (returnEnglish)
		   KalsarpaYoga = "KULIK_KALSARPA_YOGA";
	   else
		   KalsarpaYoga = rbKalsarpaYoga.getString("KULIK_KALSARPA_YOGA");
   }
   else if(PlantPos.equals("3,9")){
	   if (returnEnglish)
		   KalsarpaYoga = "VASUKI_KALSARPA_YOGA";
	   else
		   KalsarpaYoga = rbKalsarpaYoga.getString("VASUKI_KALSARPA_YOGA");
   }
   else if(PlantPos.equals("4,10")){
	   if (returnEnglish)
		   KalsarpaYoga = "SHANKPAAL_KALSARPA_YOGA";
	   else
		   KalsarpaYoga = rbKalsarpaYoga.getString("SHANKPAAL_KALSARPA_YOGA");
   }
   else if(PlantPos.equals("5,11")){
	   if (returnEnglish)
		   KalsarpaYoga = "PADAM_KALSARPA_YOGA";
	   else
		   KalsarpaYoga = rbKalsarpaYoga.getString("PADAM_KALSARPA_YOGA");
   }
   else if(PlantPos.equals("6,12")){
	   if (returnEnglish)
		   KalsarpaYoga = "MAHAPADAM_KALSARPA_YOGA";
	   else
		   KalsarpaYoga = rbKalsarpaYoga.getString("MAHAPADAM_KALSARPA_YOGA");
   }
   else if(PlantPos.equals("7,1")){
	   if (returnEnglish)
		   KalsarpaYoga = "TAKSHAK_KALSARPA_YOGA";
	   else
		   KalsarpaYoga = rbKalsarpaYoga.getString("TAKSHAK_KALSARPA_YOGA");
   }
   else if(PlantPos.equals("8,2")){
	   if (returnEnglish)
		   KalsarpaYoga = "KARKOTAK_KALSARPA_YOGA";
	   else
		   KalsarpaYoga = rbKalsarpaYoga.getString("KARKOTAK_KALSARPA_YOGA");
   }
   else if(PlantPos.equals("9,3")){
	   if (returnEnglish)
		   KalsarpaYoga = "SHANKACHOOD_KALSARPA_YOGA";
	   else
		   KalsarpaYoga = rbKalsarpaYoga.getString("SHANKACHOOD_KALSARPA_YOGA");
   }
   else if(PlantPos.equals("10,4")){
	   if (returnEnglish)
		   KalsarpaYoga = "GHATAK_KALSARPA_YOGA";
	   else
		   KalsarpaYoga = rbKalsarpaYoga.getString("GHATAK_KALSARPA_YOGA");
   }
   else if(PlantPos.equals("11,5")){
	   if (returnEnglish)
		   KalsarpaYoga = "VISHDHAR_KALSARPA_YOGA";
	   else
		   KalsarpaYoga = rbKalsarpaYoga.getString("VISHDHAR_KALSARPA_YOGA");
   }
   else if(PlantPos.equals("12,6")){
	   if (returnEnglish)
		   KalsarpaYoga = "SHESHNAG_KALSARPA_YOGA";
	   else
		   KalsarpaYoga = rbKalsarpaYoga.getString("SHESHNAG_KALSARPA_YOGA");
   }
  
   
   return KalsarpaYoga;
}
/**
 * This method is gives kalsarpa Yoga details.
 * @param userid kalsarpaYogaHeading rBKalsarpaYogaObj 
 * @return String resultOfKalsarpaYoga
 */
public static String getKalsarpaYogaIntroduction(String kalsarpaYogaHeading, MyResourceBundle rBKalsarpaYogaObj){
	String resultOfKalsarpaYoga = "",kalsarpaYogaHeadingTemp="",kalsarpaYogaRemedy="";
	if(kalsarpaYogaHeading != null && !kalsarpaYogaHeading.equals(""))
	{
		kalsarpaYogaHeadingTemp = kalsarpaYogaHeading.toUpperCase().replace(" ", "_");
		kalsarpaYogaHeading = kalsarpaYogaHeadingTemp+"_INTRO_TEXT";
		kalsarpaYogaRemedy = kalsarpaYogaHeadingTemp+"_REMEDY";
		resultOfKalsarpaYoga = rBKalsarpaYogaObj.getString(kalsarpaYogaHeading)+"#"+rBKalsarpaYogaObj.getString(kalsarpaYogaRemedy);
	}
	return(resultOfKalsarpaYoga);
}
/*
Function GetKalsarpaYogaIntroduction(KalsarpaYogaHeading)
       Dim IntrocuctionText, Remedy, ResultofKalsarpaYoga
       Select case KalsarpaYogaHeading
        case GetString("ANNANT_KALSARPA_YOGA")
                'ANNANT_KALSARPA_YOGA_INTRO_TEXT = "This kalsarp dosh or yog is identified when Rahu is in lagna, Ketu is posited in seventh house and all planets are posited in between of these two-Rahu & Ketu. Due to influence of this dosh on lagna chart the native will have to work hard to be an impressive person. Person with Kalsarp dosh will put more emphasis and do hard approaches to achieve success in business and literature. Gradually the person becomes unromantic or sarcastic towards material comforts of life due to mental troubles shown by this dosh. Anant Kalsarp dosh person likes business or trading full of risks and adventures that always shows possibility of harms. The native's physical and financial conditions are not well with this dosh. He will face obstacles in obtaining properties of his father and forefathers. He can bitterly face legal cases and swindles. His social image can become weak. However, despite having unfavorable events, the person with ananta kalsarp dosh certainly experience a miraculous time when his all problems automatically get disappeared. And miracle does not come by efforts but happened suddenly. However the person with this dosh has bulk of troubles he never feels shortages of anything in life. If any person is facing huge of problems in life due to Ananta Kalsarp dosh he should apply the following remedies: "
                'ANNANT_KALSARPA_YOGA_REMEDY = "<li>In case of troubles in achieving knowledge and hurdles in studies Chant Saraswati Beej Mantra till one year and pray Goddess Saraswati with full of ritual and devotions.</li><li>Recite Maha Mrityunjaya Mantra or tell other person to recite it for you.</li><li>Float the coal in water during 3 auspicious times. </li><li>Recite Hanuman Chalisa 108 times</li><li>Boil a litter amount of water mixed with devdaru, sarso (mustard), and lohavan. Mix this boiled water in your bathing water, and take bath using this water till 37 days. </li>"
                ResultofKalsarpaYoga = GetString("ANNANT_KALSARPA_YOGA_INTRO_TEXT") &"#"& GetString("ANNANT_KALSARPA_YOGA_REMEDY")
        case GetString("KULIK_KALSARPA_YOGA")
                'KULIK_KALSARPA_YOGA_INTRO_TEXT = "when Rahu is seated in 2nd house, Ketu is seated in 8th house, and all planets are seated in middle of rahu and ketu, it is Kulik Kalsarp yog. It is believed that this yog causes defamation or disgrace. It also adversely affects studies of the person. It is also reason of unstable or weak financial position that can bring disharmony, separations in married life of the person. His friends can deceive him. It causes mental and physical imbalances that make that person old before his age. Due to this Kalsarp yog he is also far from enthusiasm and courage. However the person with this yog can attain success by hard and devotion but that success is only for some time. At such situation the person should apply the following remedies: "
                'KULIK_KALSARPA_YOGA_REMEDY = "<li>In case of troubles in achieving knowledge and literacy Chant Saraswati Beej Mantra till one year and pray Goddess Saraswati with full of ritual and devotions.</li><li>Recite Hanuman Chalisa 108 times.</li><li>Float the coal in water during 3 auspicious times. </li><li>Offer abhishek (coronation) to Mahadev till 30 days during Shravan month. </li><li>Boil a litter amount of water mixed with devdaru, sarso (mustard), and lohavan. Mix this boiled water in your bathing water, and take bath using this water till 37 days. </li><li>Keep fast during Saturday and Tuesday and if facing obstacles in work then visit temples and offer mustard oil to Shani dev.</li><li>During the influence of Rahu period, chant one chain of Rahu Mantra daily and when you complete it 18000 times, perform havan for Rahu and donate udad daal and cloth of blue color to needy person. Performing this is very auspicious. </li>"
                ResultofKalsarpaYoga = GetString("KULIK_KALSARPA_YOGA_INTRO_TEXT") &"#"& GetString("KULIK_KALSARPA_YOGA_REMEDY")
        case GetString("VASUKI_KALSARPA_YOGA")
                'VASUKI_KALSARPA_YOGA_INTRO_TEXT = "When in one's kundali or birth-chart Rahu is in 3rd house,  Ketu is in 9th house, and all other planets are between in these two houses make Vasunki Kalsarp Yog. This kalsarp yog in one's kundali indicates problems associated to siblings and other mates. The person with this yog can face swindles of friends and other near people. The home and family life of this person is full of tensions and violence.  If such kind of person start earning or survive outside from his native place can become more successful. However this person gets success late but gets sure. During the troubling time following remedies can be applied: "
                'VASUKI_KALSARPA_YOGA_REMEDY = "<li>Recite daily Nav Nag Strota till one year.</li><li>Possess Nag Pash Yantra durig any auspicious time.</li><li>Donate one fist Udad daal or Moong daal inside a black cloth to a beggar in every Wednesday after reciting Rahu Mantra. In case you don't find beggar can float it in water. Performing this act till 72 Wednesday is very beneficial. </li><li>Recite 11 chains of Maha Mrityunjay Mantra daily during Rahu dasha or antardasha. Offer coronation with oil to Shani dev and offer cloth to Hanuman ji during Tuesday.</li>"
                ResultofKalsarpaYoga = GetString("VASUKI_KALSARPA_YOGA_INTRO_TEXT") &"#"& GetString("VASUKI_KALSARPA_YOGA_REMEDY")
        case GetString("SHANKPAAL_KALSARPA_YOGA")
                'SHANKPAAL_KALSARPA_YOGA_INTRO_TEXT = "When in a birth-chart, Rahu is seated in 4th house and Kutu is situated in 10th house and rest of the planets are between in these houses make Shankh pal Kalsarp yog. This kalsarp yog causes problems related to plot or estate, castle, and troubles related to vehicles. The person with this kalpsarp yog has intentions to do multiple works at one time.  And this is why most of the work of that person is complete. This person also faces disharmony in married life. Financial deficits are one major indication of this yog. Although this person gets fair achievements in the field of politics, services, and business, and attain social dignity.At the time of problems following remedies can be applied: "
                'SHANKPAAL_KALSARPA_YOGA_REMEDY = "<li>Attach Silver Swastik in your main gate. Paste metal nag in two sides of swastik.</li><li>Offer coronation with mustard oil to Shani dev during Saturdays. </li><li>Recite Hanuman chalisa daily and eat your daily meals only at bhojnalaya (dining room). Chant Hanuman Chalisa 108 times and keep fast of five Tuesdays for Hanuman ji and offer him Chameli-oil, paste of sindur and bundi-laddoo. </li><li>Rotate a coin 3 times around your head while seeing your face in a small bowl of mustard oil, keep this coin in this bowl and donate it to a poor man or offer it to the root of peepal tree. </li><li>Worship 'Sarvtobhadramandal Yantra' during in auspicious time and after worshiping wear it. </li><li>Rotate seven times the one-eye coconut around your upper side during an auspicious time and and float it in Ganga or Jamuna river till seven Wednesday. </li><li>Feed jau dana to birds till 37 days.</li>"
                ResultofKalsarpaYoga = GetString("SHANKPAAL_KALSARPA_YOGA_INTRO_TEXT") &"#"& GetString("SHANKPAAL_KALSARPA_YOGA_REMEDY")
        case GetString("PADAM_KALSARPA_YOGA")
                'PADAM_KALSARPA_YOGA_INTRO_TEXT = "when in one's birth-chart, Rahu is situated in 5th house and Ketu is situated in 11the house, and all other planets are seated between these two houses it makes Padam Kalsarp Yog. Due to association with fifth house, this kalsarp yog indicates hurdles in studies, late birth of child, and troubles related to children. Often health and married life become unordinary due to this yog. The person with this kalsarp yoga always fears about disgrace in family.  The life of this person becomes struggling because of tensions arises from this yog. His friends become selfish. Besides facing numbers of problems this person gets good and strong financial positing, respective social status, and well run of business. If person with this yog is good by his behavior and nature, if he does not consume alcohol and if he does not seize property of his friend, then the above mentioned bad influences of Padam Kalsarp yog will not be effective. "
                'PADAM_KALSARPA_YOGA_REMEDY = "<li>Recite Daily Hanuman Chalisa 11 times a day.</li><li>Every Saturday keep 8 fists moist gram (8 muthi bhigoya chana) and 11 bananas in front of you and recite Hanuman chalisa 108 times, and offer these bananas to monkeys.</li><li>Offer Bundi Laddoo, Sindur dissolved in Chameli (jasmine) oil to Hanuman ji. Also offer coronation with oil to Shanidev.</li><li>Attach Silver Swastik in your main gate. Paste metal nag in two sides of swastik.</li><li>In Shravan month, after bath, recite 11 chains 'Om Namah Shivay'  and offer bel patram cow milk and gangajal to Shivji.</li><li>    Start keeping fast fast from 1st Saturday of shukla paksh till 18th Saturday and wear black cloth, recite 3 chains or 18 chains of Bij Mantra of Rahu. Then take jal durva and kusha in a bowl and offer it to root of Peepal tree. Eat Sweet food during your fast and donate the same. Ignite diya with ghee and keep it at root of Peepal tree. </li><li>Also keep fast during Nag Panchami.</li>"
                ResultofKalsarpaYoga = GetString("PADAM_KALSARPA_YOGA_INTRO_TEXT") &"#"& GetString("PADAM_KALSARPA_YOGA_REMEDY")
        case GetString("MAHAPADAM_KALSARPA_YOGA")
                'MAHAPADAM_KALSARPA_YOGA_INTRO_TEXT = "when in one's birth-chart, Rahu is situated in 6th house, ketu is situated in 12th house, and all other planets are seated between these two houses, make Mahapadam Kalsarp Yog. Person with this yog are enemy-winner and earns huge money in foreign countries. But he is always deprived of peace at home. This person travels a lot, but many of his journey is successful while some other are not. This person can only get one thing either wealth or happiness. Person with this yog also experience horrible night dreams. This person suffers in late age. However, good time also comes in his life. Person of this kalsarp yog are mostly successful being an advocate or a political leader. At the time of troubles following remedies can be performed. "
                'MAHAPADAM_KALSARPA_YOGA_REMEDY = "<li>During Shravan month offer Abhishek (coronation) to Shivji till 30 days.</li><li>Worship silver idol of Nag-Nagin with full of devotions and rituals at Sangam tat of any pious river and float it in that river. </li><li>Recite Sundar kand of Ramcharit Manas 108 times during each  Saturday and Tuesday. </li><li>Start keeping fast from 1st Saturday of shukla paksh till 18th Saturday and wear black cloth, recite 3 chains or 18 chains of Bij Mantra of Rahu. Then take jal durva and kusha in a bowl and offer it to root of Peepal tree. Eat Sweet food during your fast and donate the same. Ignite diya with ghee and keep it at root of Peepal tree. </li>"
                ResultofKalsarpaYoga = GetString("MAHAPADAM_KALSARPA_YOGA_INTRO_TEXT") &"#"& GetString("MAHAPADAM_KALSARPA_YOGA_REMEDY")
        case GetString("TAKSHAK_KALSARPA_YOGA")
                'TAKSHAK_KALSARPA_YOGA_INTRO_TEXT = "According to prevalent definition , when Rahu is present in the 7th house of a native's birth chart , and Ketu in the 1st house with all remaining planets in the middle of Rahu and Ketu , that is all remaining planets are placed between the first and seventh house then the birth chart is said to be afflicted with Takshak Kaal Sarp Dosha .  In this case the native does not enjoy the pleasure of ancestral property inheritance, love relationships end in failure and the native experiences treachery in close relationships. Moreover, the native experiences disturbance in married life to an extent of possible separation. The native may possibly have an interest in gambling and lottery and lives in a constant state of disturbance thinking about his children and money lent. However, in case the native is charitable and respects others then he does not face these problems. Here are some remedies that you can follow to overcome these problems:"
                'TAKSHAK_KALSARPA_YOGA_REMEDY = "<li>Offer Masoor Dal in flowing water at an auspicious Muhurta</li><li>Observe fast for five Tuesdays, and offer vermillion mixed in Chameli along with laddu to Hanumanjee and distribute the same. On the last Tuesday, offer one fourth grams vermillion, a red cloth of one fourth metres, one fourth kilos of Batasha and one fourth kilo of Bundi Laddus as prasad and distribute the same.</li><li>Feed birds with for one fourth of a month with Jaw</li><li>Boil Devdaro, mustard and lohvan and take a bath with the same.</li>"
                ResultofKalsarpaYoga = GetString("TAKSHAK_KALSARPA_YOGA_INTRO_TEXT") &"#"& GetString("TAKSHAK_KALSARPA_YOGA_REMEDY")
        case GetString("KARKOTAK_KALSARPA_YOGA")
                'KARKOTAK_KALSARPA_YOGA_INTRO_TEXT = "According to prevalent definition , if a native's birth chart has Rahu in the eighth house, ketu in the second house with remaining planets between Rahu and Ketu that is between the eighth and second house then the birth chart is said to be afflicted with Karkotak Kaal Sarpa Dosha . In this case the native is never destinies favourite, promotions are difficult, there are obstacles in inheritance of property, treachery from friends and get half the reward for all the effort put in .Due to mental and physical problems such a native faces obstacles at home and among relatives. Almost always irritated and disturbed, they suffer a lot due to debt taken. Chances of accidental death surround them all through. In case you are suffering from the same, follow the remedies mentioned below:"
                'KARKOTAK_KALSARPA_YOGA_REMEDY = "<li>Use Red coloured curtains, bed sheet and pillow cover in your bedroom.</li><li>For quarter a month feed birds with Jaw and every Saturday feed ant by sprinkling a mixture of sugar and sattu .</li><li>Read Hanuman Chalisa 108 times and observe fast for five Tuesdays offering vermillion mixed in chameli and bundi laddu</li><li>On a Saturday, see your image in a bowl full of mustard oil, and then take a coin and move it around like a circle above your forehead three times. Put the coin in the bowl full of oil and donate the same to a beggar or offer the same at peepal trees roots.</li><li>In an auspicious muhurta offer dry coconut in flowing water three times.</li><li>On a Saturday offer coal n flowing water three times.</li>"
                ResultofKalsarpaYoga = GetString("KARKOTAK_KALSARPA_YOGA_INTRO_TEXT") &"#"& GetString("KARKOTAK_KALSARPA_YOGA_REMEDY")
        case GetString("SHANKACHOOD_KALSARPA_YOGA")
                'SHANKACHOOD_KALSARPA_YOGA_INTRO_TEXT = "According to prevalent definition , if a native's birth chart has Rahu in the ninth house, ketu in the third house with remaining planets between Rahu and Ketu that is between the ninth and third house then the birth chart is said to be afflicted with Shankhachur Kaal Sarpa Dosha. . In this case the native faces obstacles in getting destinies favour.  Be is in business, promotion or education, the native faces many obstacles in getting the desired result.  They suffer loss due to their over confidence and argumentative nature. Lack of happiness from father's side along with treachery from grandparents (Mother's side) and sisters husband, is seen as a result of this Dosha. Married life is torn between conflicts and misunderstanding, not does the native enjoy respect and honour. Such a native should try being spiritual and fight the malice in his heart alongside doing these remedies:"
                'SHANKACHOOD_KALSARPA_YOGA_REMEDY = "<li>On an auspicious Muhurta , place a swastika on the main door and get your name carved in metal pasted on both sides of the door.</li><li>Do a Mahamrityunjay Kavach paath, and perform Shiv Rudra Abhishek every Monday</li><li>Get a silver of â€œAstdhatu Naagâ€� made and wear it in your middle finger.</li><li>From the first Saturday of a month till 86 Saturdays observe a fast, with a firm resolve to reduce the effect of this Dosha . During the fast wear a black colour clothes and perform â€œtilabhishekâ€� of Shani dev.Also perform Rahu Beej Mantra Jaap. After the Jaap fill water in a vessel and using Dhruv and Kush offer it at peepal tree roots.</li><li>In your diet include sweet mixture, sweet chapatti, revri and tilkoot etc.Before using these also donate the same and at night light a ghee lamp and place it at a peepal trees root.</li>"
                ResultofKalsarpaYoga = GetString("SHANKACHOOD_KALSARPA_YOGA_INTRO_TEXT") &"#"& GetString("SHANKACHOOD_KALSARPA_YOGA_REMEDY")
        case GetString("GHATAK_KALSARPA_YOGA")
                'GHATAK_KALSARPA_YOGA_INTRO_TEXT = "According to prevalent definition , if a native's birth chart has Rahu in the tenth house, Ketu in the fourth house with remaining planets between Rahu and Ketu that is between the tenth and fourth house then the birth chart is said to be afflicted with Ghatak Kaal Sarpa Dosha. All his life through the native is in search of happiness but he is never happy no matter whatever joys come and go in his life. Native faces departure of his dad. Married life remains unhappy, in business there will be unpleasant issues and obstacles but there is never a scarcity of wealth or money. In case the native is in a job or service, fear of suspension, discharge and demotion prevail almost always. Friends also keep cheating. If the native gets out of bribery or illegal doings then he never has scarcity of anything in life. The native gets social and political fame. Perform the following remedies to safeguard yourself :"
                'GHATAK_KALSARPA_YOGA_REMEDY = "<li>For a year perform Ganpati Atharvashish Paath</li><li>Observe fast on Monday and visit a Shiv mandir , perform silver Naag puja and remembering your forefathers offer that silver naag in flowing water with devotion.</li><li>Observe a fast every Tuesday and read Hanuman Chalisa , offer vermillion mixed In chameli along with Bundi laddus as bhog to Hanumanjee</li><li>Observe fast on Saturday , perform 'tilabhishek' of Shani dev  and donate catseye, gold, til, grains , oil, clothes , dry coconut and blankets to needy from time to time.</li>"
                ResultofKalsarpaYoga = GetString("GHATAK_KALSARPA_YOGA_INTRO_TEXT") &"#"& GetString("GHATAK_KALSARPA_YOGA_REMEDY")
        case GetString("VISHDHAR_KALSARPA_YOGA")
                'VISHDHAR_KALSARPA_YOGA_INTRO_TEXT = "According to prevalent definition, when Rahu is present in the 11th house of a native's birth chart , and Ketu in the 5th house with all remaining planets in the middle of Rahu and Ketu , that is all remaining planets are placed between the 11th  and 5th  house then the birth chart is said to be afflicted with Vishdhar Kaal Sarp Dosha .  In this case the native faces problems in education, obstacles in higher education and the memorizing capacity of such a native is generally less. Conflict with paternal uncles, their son and elder brothers along with long distance travel are some issues that may arise. Physical ailment and issues related to childbirth are a cause of trouble. To deal with these problems, here are few remedies:"
                'VISHDHAR_KALSARPA_YOGA_REMEDY = "<li>Feed birds with Jaw for quarter a month</li><li>During Shravan month perform Mahadev Abhishek</li><li>On a Monday visit Shiv Mandir , offer prayers to silver Naag recalling your forefathers and with complete devotion bid a farewell to Naag Devta immersing them in flowing water.</li><li>Every Monday sprinkle curd on Lord Shiva and perform abhishek, chanting the mantra 'om har har mahadev'</li><li>Boil Devdaro, mustard and lohvan and take a bath with the same."
                ResultofKalsarpaYoga = GetString("VISHDHAR_KALSARPA_YOGA_INTRO_TEXT") &"#"& GetString("VISHDHAR_KALSARPA_YOGA_REMEDY")
        case GetString("SHESHNAG_KALSARPA_YOGA")
                'SHESHNAG_KALSARPA_YOGA_INTRO_TEXT = "According to prevalent definition, when Rahu is present in the 12th house of a native's birth chart, and Ketu in the 6th house with all remaining planets in the middle of Rahu and Ketu , that is all remaining planets are placed between the 12th  and 6th  house then the birth chart is said to be afflicted with Sheshnag Kaal Sarp Dosha .  In this case the native's desires get fulfilled after a long time, for livelihood he has to travel far and beyond, lives in the fear of defame and conflict. Due to certain behavior the native becomes a victim of ridicule. However once in his lifetime he receives a position of authority and earns the desired fame. To deal with these problems, here are few remedies:"
                'SHESHNAG_KALSARPA_YOGA_REMEDY = "<li>On an auspicious Muhurta , place a swastika on the main door and get your name carved in metal pasted on both sides of the door.</li><li>Read Hanuman Chalisa 108 times and observes a fast for five Tuesdays offering vermillion mixed in chameli and bundi laddu</li><li>Feed birds with Jaw for quarter a month and then start anything new</li><li>On an auspicious occasion, start a 11 times Jaap of a rosary, chanting â€œom namah shivay â€œ, then perform an abhishek of the shivling with cow's milk and bel patra . Then after these rituals are performed adorn the shivling with a copper Naag.</li><li>On a proper occasion offer masoor daal to beggars and have your meal at a restraint.</li><li>On an auspicious occasion wear a Naag Paash Yantra after invocation. Use red curtains and red coloured bed sheet in your bedroom.</li>"
                ResultofKalsarpaYoga = GetString("SHESHNAG_KALSARPA_YOGA_INTRO_TEXT") &"#"& GetString("SHESHNAG_KALSARPA_YOGA_REMEDY")
      End Select         
    GetKalsarpaYogaIntroduction = ResultofKalsarpaYoga
End Function

%>
<%
Function GetSwarNakshatraPadaFromName(name)
Dim ArrayNakshatra(27,3), AlternativArrayNakshatra(27,3), Nakshatra, SecondCase, FirstCase

'Get Name from User and hold in getName variable
getName = name

'****************************** ArrayNakshatra is an array which have Swar values based on Nakshatra-Charan
ArrayNakshatra(0,0) = "Chu"
ArrayNakshatra(0,1) = "Che"
ArrayNakshatra(0,2) = "Cho"
ArrayNakshatra(0,3) = "La"
ArrayNakshatra(1,0) = "Li"
ArrayNakshatra(1,1) = "Lu"
ArrayNakshatra(1,2) = "Le"
ArrayNakshatra(1,3) = "Lo"
ArrayNakshatra(2,0) = "A"
ArrayNakshatra(2,1) = "I"
ArrayNakshatra(2,2) = "U"
ArrayNakshatra(2,3) = "E"
ArrayNakshatra(3,0) = "O"
ArrayNakshatra(3,1) = "Va"
ArrayNakshatra(3,2) = "Vi"
ArrayNakshatra(3,3) = "Vu"
ArrayNakshatra(4,0) = "Ve"
ArrayNakshatra(4,1) = "Vo"
ArrayNakshatra(4,2) = "Ka"
ArrayNakshatra(4,3) = "Ki"
ArrayNakshatra(5,0) = "Ku"
ArrayNakshatra(5,1) = "Gha"
ArrayNakshatra(5,2) = "Nga"
ArrayNakshatra(5,3) = "Chha"
ArrayNakshatra(6,0) = "Ke"
ArrayNakshatra(6,1) = "Ko"
ArrayNakshatra(6,2) = "Ha"
ArrayNakshatra(6,3) = "Hi"
ArrayNakshatra(7,0) = "Hu"
ArrayNakshatra(7,1) = "He"
ArrayNakshatra(7,2) = "Ho"
ArrayNakshatra(7,3) = "Da"
ArrayNakshatra(8,0) = "Di"
ArrayNakshatra(8,1) = "Du"
ArrayNakshatra(8,2) = "De"
ArrayNakshatra(8,3) = "Do"
ArrayNakshatra(9,0) = "Ma"
ArrayNakshatra(9,1) = "Mi"
ArrayNakshatra(9,2) = "Mu"
ArrayNakshatra(9,3) = "Me"
ArrayNakshatra(10,0) = "Mo"
ArrayNakshatra(10,1) = "Ta"
ArrayNakshatra(10,2) = "Ti"
ArrayNakshatra(10,3) = "Tu"
ArrayNakshatra(11,0) = "Te"
ArrayNakshatra(11,1) = "To"
ArrayNakshatra(11,2) = "Pa"
ArrayNakshatra(11,3) = "Pi"
ArrayNakshatra(12,0) = "Pu"
ArrayNakshatra(12,1) = "Sha"
ArrayNakshatra(12,2) = "Na"
ArrayNakshatra(12,3) = "Tha"
ArrayNakshatra(13,0) = "Pe"
ArrayNakshatra(13,1) = "Po"
ArrayNakshatra(13,2) = "Ra"
ArrayNakshatra(13,3) = "Ri"
ArrayNakshatra(14,0) = "Ru"
ArrayNakshatra(14,1) = "Re"
ArrayNakshatra(14,2) = "Ro"
ArrayNakshatra(14,3) = "Ta"
ArrayNakshatra(15,0) = "Tee"
ArrayNakshatra(15,1) = "Tu"
ArrayNakshatra(15,2) = "Te"
ArrayNakshatra(15,3) = "To"
ArrayNakshatra(16,0) = "Na"
ArrayNakshatra(16,1) = "Ni"
ArrayNakshatra(16,2) = "Nu"
ArrayNakshatra(16,3) = "Ne"
ArrayNakshatra(17,0) = "No"
ArrayNakshatra(17,1) = "Ya"
ArrayNakshatra(17,2) = "Yi"
ArrayNakshatra(17,3) = "Yu"
ArrayNakshatra(18,0) = "Ye"
ArrayNakshatra(18,1) = "Yo"
ArrayNakshatra(18,2) = "Bha"
ArrayNakshatra(18,3) = "Bhi"
ArrayNakshatra(19,0) = "Bhu"
ArrayNakshatra(19,1) = "Dha"
ArrayNakshatra(19,2) = "Pha"
ArrayNakshatra(19,3) = "Rha"
ArrayNakshatra(20,0) = "Bhe"
ArrayNakshatra(20,1) = "Bho"
ArrayNakshatra(20,2) = "Ja"
ArrayNakshatra(20,3) = "Ji"
ArrayNakshatra(21,0) = "Khee"
ArrayNakshatra(21,1) = "Khu"
ArrayNakshatra(21,2) = "Khe"
ArrayNakshatra(21,3) = "Kho"
ArrayNakshatra(22,0) = "Ga"
ArrayNakshatra(22,1) = "Gi"
ArrayNakshatra(22,2) = "Gu"
ArrayNakshatra(22,3) = "Ge"
ArrayNakshatra(23,0) = "Go"
ArrayNakshatra(23,1) = "Sa"
ArrayNakshatra(23,2) = "Si"
ArrayNakshatra(23,3) = "Su"
ArrayNakshatra(24,0) = "Se"
ArrayNakshatra(24,1) = "So"
ArrayNakshatra(24,2) = "Daa"
ArrayNakshatra(24,3) = "Dai"
ArrayNakshatra(25,0) = "Du"
ArrayNakshatra(25,1) = "Tha"
ArrayNakshatra(25,2) = "Jh"
ArrayNakshatra(25,3) = "Nja"
ArrayNakshatra(26,0) = "Dae"
ArrayNakshatra(26,1) = "Dao"
ArrayNakshatra(26,2) = "Cha"
ArrayNakshatra(26,3) = "Chi"

'****************************** AlternativArrayNakshatra is an alternativ array which have Swar values based on Nakshatra-Charan	
AlternativArrayNakshatra(0,0) = "Choo"
AlternativArrayNakshatra(0,1) = "Chai"
AlternativArrayNakshatra(0,2) = "Chau"
AlternativArrayNakshatra(0,3) = "Laa"
AlternativArrayNakshatra(1,0) = "Lee"
AlternativArrayNakshatra(1,1) = "loo"
AlternativArrayNakshatra(1,2) = "Lai"
AlternativArrayNakshatra(1,3) = "Lau" 
AlternativArrayNakshatra(2,0) = "AA"
AlternativArrayNakshatra(2,1) = "EE"
AlternativArrayNakshatra(2,2) = "OO"
AlternativArrayNakshatra(2,3) = "AI"
AlternativArrayNakshatra(3,0) = "O"
AlternativArrayNakshatra(3,1) = "Vaa"
AlternativArrayNakshatra(3,2) = "Bi"
AlternativArrayNakshatra(3,3) = "Voo"
AlternativArrayNakshatra(4,0) = "Vai"
AlternativArrayNakshatra(4,1) = "Vao"
AlternativArrayNakshatra(4,2) = "Ka"
AlternativArrayNakshatra(4,3) = "Kee"
AlternativArrayNakshatra(5,0) = "Koo"
AlternativArrayNakshatra(5,1) = "Ghaa"
AlternativArrayNakshatra(5,2) = "Chh"
AlternativArrayNakshatra(5,3) = "Chh"
AlternativArrayNakshatra(6,0) = "Kae"
AlternativArrayNakshatra(6,1) = "Kao"
AlternativArrayNakshatra(6,2) = "Haa"
AlternativArrayNakshatra(6,3) = "Hee"
AlternativArrayNakshatra(7,0) = "Hoo"
AlternativArrayNakshatra(7,1) = "Hr"
AlternativArrayNakshatra(7,2) = "Hao"
AlternativArrayNakshatra(7,3) = "Daa"
AlternativArrayNakshatra(8,0) = "Dai"
AlternativArrayNakshatra(8,1) = "Doo"
AlternativArrayNakshatra(8,2) = "Dee"
AlternativArrayNakshatra(8,3) = "Dau"
AlternativArrayNakshatra(9,0) = "Ma" 
AlternativArrayNakshatra(9,1) = "Mee"
AlternativArrayNakshatra(9,2) = "Moo" 
AlternativArrayNakshatra(9,3) = "Me"
AlternativArrayNakshatra(10,0) = "Mao"
AlternativArrayNakshatra(10,1) = "Taa"
AlternativArrayNakshatra(10,2) = "Tee"
AlternativArrayNakshatra(10,3) = "Too"
AlternativArrayNakshatra(11,0) = "Te"
AlternativArrayNakshatra(11,1) = "Teo"
AlternativArrayNakshatra(11,2) = "Paa"
AlternativArrayNakshatra(11,3) = "Pr"
AlternativArrayNakshatra(12,0) = "Poo"
AlternativArrayNakshatra(12,1) = "Sha"
AlternativArrayNakshatra(12,2) = "Na"
AlternativArrayNakshatra(12,3) = "Tha"
AlternativArrayNakshatra(13,0) = "Pae"
AlternativArrayNakshatra(13,1) = "Pao"
AlternativArrayNakshatra(13,2) = "Ra"
AlternativArrayNakshatra(13,3) = "Ree"
AlternativArrayNakshatra(14,0) = "Roo"
AlternativArrayNakshatra(14,1) = "Rae"
AlternativArrayNakshatra(14,2) = "Rao"
AlternativArrayNakshatra(14,3) = "Taa"
AlternativArrayNakshatra(15,0) = "Ti"
AlternativArrayNakshatra(15,1) = "Too"
AlternativArrayNakshatra(15,2) = "Tae"
AlternativArrayNakshatra(15,3) = "Tao"
AlternativArrayNakshatra(16,0) = "Na"
AlternativArrayNakshatra(16,1) = "Nee"
AlternativArrayNakshatra(16,2) = "Noo"
AlternativArrayNakshatra(16,3) = "Ne"
AlternativArrayNakshatra(17,0) = "Nao"
AlternativArrayNakshatra(17,1) = "Ya"
AlternativArrayNakshatra(17,2) = "Yee"
AlternativArrayNakshatra(17,3) = "Yoo"
AlternativArrayNakshatra(18,0) = "Yae"
AlternativArrayNakshatra(18,1) = "Yao"
AlternativArrayNakshatra(18,2) = "Bha"
AlternativArrayNakshatra(18,3) = "Bhee"
AlternativArrayNakshatra(19,0) = "Bhoo"
AlternativArrayNakshatra(19,1) = "Dha"
AlternativArrayNakshatra(19,2) = "Pha"
AlternativArrayNakshatra(19,3) = "Rha"
AlternativArrayNakshatra(20,0) = "Bhe"
AlternativArrayNakshatra(20,1) = "Bho"
AlternativArrayNakshatra(20,2) = "Za"
AlternativArrayNakshatra(20,3) = "Jee"
AlternativArrayNakshatra(21,0) = "Khi"
AlternativArrayNakshatra(21,1) = "Khoo"
AlternativArrayNakshatra(21,2) = "Khai"
AlternativArrayNakshatra(21,3) = "Kho"
AlternativArrayNakshatra(22,0) = "Ga"
AlternativArrayNakshatra(22,1) = "Gee"
AlternativArrayNakshatra(22,2) = "Goo"
AlternativArrayNakshatra(22,3) = "Gay"
AlternativArrayNakshatra(23,0) = "Go"
AlternativArrayNakshatra(23,1) = "Sh"
AlternativArrayNakshatra(23,2) = "See"
AlternativArrayNakshatra(23,3) = "Soo"
AlternativArrayNakshatra(24,0) = "she"
AlternativArrayNakshatra(24,1) = "So"
AlternativArrayNakshatra(24,2) = "Daa"
AlternativArrayNakshatra(24,3) = "Dee"
AlternativArrayNakshatra(25,0) = "Doo"
AlternativArrayNakshatra(25,1) = "Tha"
AlternativArrayNakshatra(25,2) = "Jha"
AlternativArrayNakshatra(25,3) = "Jha"
AlternativArrayNakshatra(26,0) = "De"
AlternativArrayNakshatra(26,1) = "Do"
AlternativArrayNakshatra(26,2) = "Cha"
AlternativArrayNakshatra(26,3) = "Chee"

dim SwarNakshatraCharan(4), Charan
Nakshatra = Array("Aswini", "Bharani", "Krithika", "Rohini", "Mrigashiras", "Aardhra /Arudra (Telugu)", "Punarvasu", "Pushyami", "Ashlesha", "Magha/Makha", "Poorva Phalguni", "Uthraphalguni", "Hastha", "Chitra", "Swaathi", "Vishaakha", "Anuraadha", "Jyeshta", "Moola", "Poorvashaada", "Uthrashaada", "Shraavan", "Dhanishta", "Shathabhisha", "Poorvabhadra", "Uthrabhadra", "Revathi")
Charan = Array (1,2,3,4)

	For i = 0 To 26
		For j = 0 To 3
			ArrayNakshatra(i,j) = Lcase(ArrayNakshatra(i,j)) 'Now ArrayNakshatra named array have all swar in small case
			AlternativArrayNakshatra(i,j) = Lcase(AlternativArrayNakshatra(i,j)) 'Now AlternativArrayNakshatra named array have all swar in small case
			
            FirstCase = Left (getName,len(ArrayNakshatra(i,j)))
            SecondCase = Left (getName,len(AlternativArrayNakshatra(i,j)))
            
           'To check which index of i and j is matched from given name, i => Nakashatra and j => Charan
           If (Lcase(FirstCase)   = ArrayNakshatra(i,j)) Then
                Swar = ArrayNakshatra(i,j)
                NakshatraNumber = i
                CharanNumber = j
                NakshatraName = Nakshatra(i)
                CharanName = Charan(j)
                flag = 1
           elseif (Lcase(SecondCase)  = AlternativArrayNakshatra(i,j)) Then
                Swar1 = AlternativArrayNakshatra(i,j)
                NakshatraNumber1 = i
                CharanNumber1 = j
                NakshatraName1 = Nakshatra(i)
                CharanName1 = Charan(j)
                flag = 1
           end if
           
           If Swar1 <> "" Then
              SwarNakshatraCharan(0) = Swar1
              SwarNakshatraCharan(1) = NakshatraNumber1
              SwarNakshatraCharan(2) = CharanNumber1
              SwarNakshatraCharan(3) = NakshatraName1
              SwarNakshatraCharan(4) = CharanName1
             Else
              SwarNakshatraCharan(0) = Swar
              SwarNakshatraCharan(1) = NakshatraNumber
              SwarNakshatraCharan(2) = CharanNumber
              SwarNakshatraCharan(3) = NakshatraName
              SwarNakshatraCharan(4) = CharanName
           End if
           
           if (flag = 1) then
            exit for
           end if
           
		Next
	Next
	GetSwarNakshatraPadaFromName = SwarNakshatraCharan
End Function


Function GetRasiFromName(swar)
dim ArrAries, ArrTaurus, ArrGemini, ArrCancer, ArrLeo, ArrVirgo, ArrLibra, ArrScorpio,  ArrSagittarius, ArrCapricorn, ArrAquarius, ArrPisces
ArrAries       = Array ( "Chu", "Che", "Cho", "La", "Li", "Lu", "Le", "Lo", "A", "Choo", "Chai", "Chau", "Laa", "Lee", "loo", "Lai", "Lau", "AA" )
ArrTaurus      = Array ( "I", "U", "E", "O", "Va", "Vi", "Vu", "Ve", "Vo", "EE", "OO", "AI", "Wa", "ba", "Bi", "Voo", "Vai", "Vao" )
ArrGemini      = Array ( "Ka", "Ki", "Ku", "Gha", "Nga", "Chha", "Ke", "ko", "Ha", "Ka", "Kee", "Koo", "Ghaa", "Chh", "Chh", "Kae", "Kao", "Haa" )
ArrCancer      = Array ( "Hi", "Hu", "He", "Ho", "Da", "Di", "Du", "De", "Do", "Hee", "Hoo", "Hr", "Hao", "Daa", "Dai", "Doo", "Dee", "Dau" )
ArrLeo         = Array ( "Ma", "Mi", "Mu", "Me", "Mo", "Ta", "Ti", "Tu", "Te", "Ma", "Mee", "Moo", "Me", "Mao", "Taa", "Tee", "Too", "Te" )
ArrVirgo       = Array ( "To", "Pa", "Pi", "Pu", "Sha", "Na", "Tha", "Pe", "Po", "Teo", "Paa", "Pr", "Poo", "Sha", "Na", "Tha", "Pae", "Pao" )
ArrLibra       = Array ( "Ra", "Ri", "Ru", "Re", "Ro", "Ta", "Tee", "Tu", "Te", "Ra", "Ree", "Roo", "Rae", "Rao", "Taa", "Ti", "Too", "Tae" )
ArrScorpio     = Array ( "To", "Na", "Ni", "Nu", "Ne", "No", "Ya", "Yi", "Yu", "Tao", "Na", "Nee", "Noo", "Ne", "Nao", "Ya", "Yee", "Yoo" )
ArrSagittarius = Array ( "Ye", "Yo", "Bha", "Bhi", "Bhu", "Dha", "Pha", "Rha", "Bhe", "Yae", "Yao", "Bha", "Bhee", "Bhoo", "Dha", "Fa","Fi", "Bhe" )
ArrCapricorn   = Array ( "Bho", "Ja", "Ji", "Khee", "Khu", "Khe", "Kho", "Ga", "Gi", "Bho", "Za", "Jee", "Khi", "Khoo", "Khai", "Kho", "Ga", "Gee" )
ArrAquarius    = Array ( "Gu", "Ge", "Go", "Sa", "Si", "Su", "Se", "So", "Daa", "Goo", "Gay", "Go", "Sh", "See", "Soo", "She", "So", "Daa" )
ArrPisces      = Array ( "Dai", "Du", "Tha", "Jh", "Nja", "Dae", "Dao", "Cha", "Chi", "Dee", "Doo", "Tha", "Jha", "Jha", "De", "Do", "Cha", "Chee" )

Swar = Lcase(Swar)
for icountRasi = 0 to ubound(ArrAries)
   If  Lcase(ArrAries(icountRasi)) = Swar Then
        RashiName = "Aries"
        exit for
    ElseIf Lcase(ArrTaurus(icountRasi)) = Swar Then
        RashiName = "Taurus"
        exit for
    ElseIf Lcase(ArrGemini(icountRasi)) = Swar Then
        RashiName =  "Gemini"
        exit for
    ElseIf Lcase(ArrCancer(icountRasi)) = Swar Then
        RashiName =  "Cancer"
        exit for
    ElseIf Lcase(ArrLeo(icountRasi)) = Swar Then
        RashiName =  "Leo"
        exit for
    ElseIf Lcase(ArrVirgo(icountRasi)) = Swar Then
        RashiName =  "Virgo"
        exit for
    ElseIf Lcase(ArrLibra(icountRasi)) = Swar Then
        RashiName =  "Libra"
        exit for
    ElseIf Lcase(ArrScorpio(icountRasi)) = Swar Then
        RashiName =  "Scorpio"
        exit for
    ElseIf Lcase(ArrSagittarius(icountRasi)) = Swar Then
        RashiName =  "Sagittarius"
        exit for
    ElseIf Lcase(ArrCapricorn(icountRasi)) = Swar Then
        RashiName =  "Capricorn"
        exit for
    ElseIf Lcase(ArrAquarius(icountRasi)) = Swar Then
        RashiName =  "Aquarius"
        exit for
    ElseIf Lcase(ArrPisces(icountRasi)) = Swar Then
        RashiName =  "Pisces"
        exit for
    End If
next
GetRasiFromName = RashiName
End Function*/

//**************Nakshtra name based on their number 
public String getNakshtraName(int nakNum){
	String AryNakshatraName[]=new String[27];

    //'Name of Nakshatra
    AryNakshatraName[0] = "ASHVINI";
    AryNakshatraName[1] = "BHARANI";
    AryNakshatraName[2] = "KRITTIKA";
    AryNakshatraName[3] = "ROHINI";
    AryNakshatraName[4] = "MRIGASIRA";
    AryNakshatraName[5] = "ARDRA";
    AryNakshatraName[6] = "PUNARVASU";
    AryNakshatraName[7] = "PASHYAMI";
    AryNakshatraName[8] = "ASHLESHA";
    AryNakshatraName[9] = "MAGHA";
    AryNakshatraName[10] = "PURVAPHALGINI";
    AryNakshatraName[11] = "UTTARAPHAL";
    AryNakshatraName[12] = "HASTA";
    AryNakshatraName[13] = "CHITRA";
    AryNakshatraName[14] = "SWATI";
    AryNakshatraName[15] = "VISHAKHA";
    AryNakshatraName[16] = "ANURADHA";
    AryNakshatraName[17] = "JYESHTHA";
    AryNakshatraName[18] = "MULA";
    AryNakshatraName[19] = "PURVASHADHA";
    AryNakshatraName[20] = "UTTARASHADHA";
    AryNakshatraName[21] = "SRAVANA";
    AryNakshatraName[22] = "DHANISHTA";
    AryNakshatraName[23] = "SATABHISA";
    AryNakshatraName[24] = "PURVABHADRA";
    AryNakshatraName[25] = "UTTARABHADRA";
    AryNakshatraName[26] = "REVATI";
    return AryNakshatraName[nakNum-1];
}


//************Calculate nakshatra pada based on degree************************
  public int getPadaOfGrahUpGrah(double Deg)
  {
    return (int)(4.0D * SUtil.fract(Deg * 3.0D / 40.0D) + 1.0D);
 
  } 

}