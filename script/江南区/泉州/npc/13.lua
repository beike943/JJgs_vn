--µØµã£ºãê¾© ÈÎÎñ£ºÌìÃÅÕóÈÎÎñ£¬½áµã12
--²ß»®£º·®ÍòËÉ  2004.02.28

function main()
	UWorld1401 = GetTask(1401)
if ( UWorld1401 == 80  )  then
				Talk(2,"say1401_12","Lµm g× cã tªn ng­êi H¸n nµo? PhÝa tr­íc lµ <color=yellow>Bé L¹c V­¬ng Kú<color> nh­ng ng­¬i kh«ng dÔ dµng vµo ®­îc ®ã ®©u!","Ta ®­îc mét ng­êi ñy th¸c ®Õn ®©y t×m ng­êi th©n vµ b¹n bÌ cña hä.")

elseif ( UWorld1401  == 85 ) then
				Talk(1,"","NÕu vËy th× ta cµng ph¶i gi÷ ng­¬i l¹i.")
				
elseif ( UWorld1401  >= 100 ) then
				Talk(1,"","Lµm vËy cã cßn lµ c«ng b»ng kh«ng?")
else
				Talk(1,"","PhÝa tr­íc lµ <color=yellow>Bé L¹c V­¬ng Kú<color>! Ng­êi H¸n kh«ng thÓ vµo ®ã ®­îc!")
end
end;

function  say1401_12()
	Say("Th× ra lµ vËy!",2,"Quay vÒ gÆp Nhiªu L©n nghÜ c¸ch/yes1401_12","Dïng 50 l­îng hèi lé./grease1401_12")
end;


function  grease1401_12()
	Say("B¹n quyÕt ®Þnh dïng 50 l­îng hèi lé thñ vÖ bé l¹c?",2,"§­îc/grease1401_12yes","Ta suy nghÜ l¹i!/grease1401_12no")
end;

function  grease1401_12no()
	Talk(1,"","§Ó ta nghÜ l¹i ®·!")
end;

function  grease1401_12yes()
			if ( GetCash() >= 500000  )  then
				    Talk(2,"","VÊt v¶ cho c¸c huynh ®Ö qu¸, chót tiÒn trµ n­íc xin nhËn cho!","Ng­êi H¸n c¸c ng­¬i xem ra còng cã t×nh cã nghÜa! Sao ta nì tõ chèi ®­îc, ng­¬i mau ®Õn <color=yellow>Bé L¹c V­¬ng Kú<color> hái th¨m tin tøc cña hä.")
						Pay(500000)
				    SetTask(1401,100)
    				AddNote("§Õn Bé L¹c V­¬ng Kú hái th¨m tin tøc cña Tiªu YÕn YÕn vµ Hµn §øc Nh­îng.")
    				Msg2Player("§Õn Bé L¹c V­¬ng Kú hái th¨m tin tøc cña Tiªu YÕn YÕn vµ Hµn §øc Nh­îng.")
			elseif ( GetCash() < 500000  ) then
						Talk(1,"","Háng råi, ta quªn ®em theo ng©n l­îng.")						
			end
end;

function  yes1401_12()
		Talk(1,"","§Ó ta quay vÒ hái <color=red>Nhiªu L©n<color>, xem cã c¸ch nµo v­ît ¶i kh«ng.")
    SetTask(1401,85)
		AddNote("Quay l¹i hái Nhiªu L©n t×m c¸ch v­ît ¶i.")
		Msg2Player("Quay l¹i hái Nhiªu L©n t×m c¸ch v­ît ¶i.")
		
end;
