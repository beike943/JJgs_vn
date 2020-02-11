--ÈÎÎñ  
--µØµã£ºãê¾© ÈÎÎñ£ºÌìÃÅÕóÈÎÎñ£¬½áµã1
--²ß»®£º·®ÍòËÉ  2004.02.28
szNpcName = "<color=green>TiÓu nhŞ<color>: "

Include("\\script\\online\\chuyen_sinh\\translife_npc.lua");

function main()
	if GetWorldPos() == 200 then
		if GetTaskTrans() == 1 then		
			trans_talk_03()
			return
		end
	end	
	UWorld1401 = GetTask(1401)
	if ( UWorld1401 == 0 and  GetLevel() >= 15  )  then
		Talk(1,"say1401_1","GÇn ®©y sao nghiÒu ng­êi qua l¹i vËy?")
	elseif ( UWorld1401  == 5 ) then
		Talk(1,"","Ng­¬i nh×n ta lµm g×? §i hái <color=red>Nh©n sÜ giang hå<color> bªn kia ®i!")
	elseif ( GetLevel() < 15  )  then
		Talk(1,"","Nh×n ng­¬i lµ biÕt míi chËp ch÷ng b­íc ch©n vµo giang hå, luyÖn thªm mét thêi gian ta sÏ nãi ng­¬i nghe mét <color=red>bİ mËt ®éng trêi<color>!")
	else
		Talk(1,"","Nh×n ng­¬i lµ biÕt ®i t×m kho b¸u ë Nh¹n M«n quan, cßn muèn giÊu ta ­? §Õn bæn tiÖm ta sÏ nãi ng­¬i nghe tin tøc vÒ kho b¸u.")
	end
end;

function  say1401_1()
	Say("VŞ kh¸ch quan nµy qu¶ nhiªn tinh m¾t, kh«ng giÊu g× ®©y lµ bİ mËt lín nh­ng ph¶i tèn <color=red>15 Kim<color>!",2,"§­a 15 Kim cho h¾n/yes1401_1","TiÓu nhŞ g× kú vËy!/no1401_1")
end;

function  yes1401_1()
	if ( GetCash() >= 150000  )  then
	    Talk(2,"","Bİ mËt lín vËy mµ cã 15 Kim th«i sao!","Kh¸ch quan! Sè tiÒn ®ã kh«ng oan uæng chót nµo. Nghe nãi <color=yellow>m¶nh S¬n Hµ X· T¾c<color> ®ét nhiªn l¹i xuÊt hiÖn, cô thÓ tiÓu nh©n kh«ng râ, ngµi thö hái <color=red>Nh©n sÜ giang hå<color> xem!")
			Pay(150000)
	    SetTask(1401,5)
	    ModifyReputation(4,0)
			--AddNote("Ö÷ÏßÈÎÎñ--ÌìÃÅÕóÈÎÎñ£¬¿ªÊ¼£¡")
			Msg2Player("NhiÖm vô chñ tuyÕn - Thiªn M«n trËn")
	elseif ( GetCash() < 150000  ) then
			Talk(1,"","Trêi! Xem bé d¹ng ng­¬i mét xu dİnh tói còng kh«ng cã µ?")						
	end
end;

function  no1401_1()
		Talk(2,"","ChuyÖn nhá vËy sao ®¸ng 15 Kim!","Uæng qu¸ bİ mËt lín nãi ai nghe b©y giê?")
end;
