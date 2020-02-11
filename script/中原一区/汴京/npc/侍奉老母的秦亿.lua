function main (sel)
		UWorld1505 = GetTask(1505)
			if (UWorld1505 == 5) then 
			  Talk(1,"","L©m gi¸o ®Çu kªu ng­¬i tíi thuyÕt phôc ta ph¶i kh«ng? Ta còng muèn häc vâ nh­ng ph¶i ch¨m sãc mÑ giµ sao an t©m b¸i s­ ®­îc!")
			  Talk(1,"","VËy ph¶i lµm sao?")
			  Talk(1,"","ViÖc nµy kh«ng khã ta cã mét huynh tr­ëng tªn TÇn Khiªm hiÖn ë phñ ®«ng BiÖn Kinh, nÕu ng­¬i khuyªn ®­îc anh ta vÒ ch¨m sãc mÑ giµ th× ta an t©m b¸i s­.")
			  Talk(1,"","§­îc th«i!")
			  SetTask(1505,10)
						elseif ( UWorld1505  ==  10)  then
								Talk(1,"","Nhí ®õng lµm ta thÊt väng nhÐ!")
									elseif ( UWorld1505  == 15 )  then	
											Talk(1,"","Tèt qu¸! Huynh tr­ëng ®ång ý viÖc ch¨m sãc mÑ råi µ? Ta cã thÓ yªn t©m b¸i s­ råi. §©y cã chót lÔ vËt xin nhËn cho!")
													SetTask(1505,20)
													    --AddItem(0,0,0)
 													    Earn(300)
													    ModifyExp(300)
													    ModifyReputation(3,0)
													    
													    else
													    		Talk(1,"","B¸ch thiÖn, hiÕu vi tiªn.")
end
end;
		  	
