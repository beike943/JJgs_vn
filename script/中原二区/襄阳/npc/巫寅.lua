Include("\\script\\task\\world\\task_award.lua")
function main()
	UWorld1512 = GetTask(1512)
	if ( UWorld1512 == 0 and  GetLevel() > 29 )  then
		Say("Cã thÓ gióp ta ®Õn ThiÕu L©m Tù t×m 15 méc thñ kh«ng?",2,"§ång ı/yes1512","Kh«ng gióp/no1512")
	elseif ( UWorld1512  == 5 and  GetItemCount(2,1,31) > 14)  then	
		Talk(1,"","Tèt qu¸, tèt qu¸! Sù thµnh t©m cña ng­¬i lÏ nµo l¹i kh«ng nhËn.")
		SetTask(1512,10)
		DelItem(2,1,31,15)
		--AddItem(2,1,1,1)
		Earn(800)
		GivePlayerExp(SkeyShiJieChongFu,"mushou")
		ModifyReputation(20,0)
		  --AddNote("°ïÎ×ÒúÊÕ¼¯Ä¾ÊÖµÄÈÎÎñÍê³É")
		TaskTip("Hoµn thµnh nhiÖm vô gióp Vu DÇn thu thËp Méc Thñ")
	elseif ( UWorld1512  ==5  and  GetItemCount(2,1,31)<= 14  )  then
		Talk(1,"","§ång Nh©n ë ThiÕu L©m mËt thÊt kh«ng ®¬n gi¶n, ph¶i cÈn thËn.")
	elseif ( UWorld1512  == 10 and GetLevel() > 34 )  then										Say("Cã thÓ gióp ta h¹ §ång Nh©n ë ThiÕu L©m mËt thÊt lÊy 15 miÕng ®ång kh«ng?",2,"§­¬ng nhiªn lµ ®­îc råi!/yes1512_2","Xin lçi, n¨ng lùc cã h¹n!/no1512")	
	elseif ( UWorld1512  == 15 and GetItemCount(2,1,42) > 14 )  then								Talk(1,"","Bİ mËt cña §ång Nh©n, Méc Nh©n ta ®Òu biÕt c¶ råi.")
		DelItem(2,1,42,15)
		SetTask(1512,20)
		--AddItem(2,1,1,1)
		GivePlayerExp(SkeyShiJieChongFu,"tongkuai")
		Earn(1000)
		ModifyReputation(28,0)
		-- AddNote("°ïÎ×ÒúÊÕ¼¯Í­¿éµÄÈÎÎñÍê³É")
		TaskTip("Hoµn thµnh nhiÖm vô gióp Vu DÇn thu thËp m¶nh §ång.")
	elseif ( UWorld1512  == 15 and GetItemCount(2,1,42) <=14  )  then
		Talk(1,"","§ång Nh©n r¬i ra m¶nh ®ång mµ ta cÇn.")								else
		Talk(1,"","Ta nãi ra nhiÒu nh­ vËy e lµ kh«ng tiÖn, th«i ng­¬i tù t×m lÊy ®i.")
	end
end;

function yes1512 ()
		Talk(1,"","PhiÒn b»ng h÷u gióp ta ®Õn ThiÕu L©m mËt thÊt t×m 15 Méc Thñ")
		SetTask(1512,5)
		--AddNote("½ÓÊÜ°ïÎ×ÒúÊÕ¼¯Ä¾ÊÖµÄÈÎÎñ")
		TaskTip("NhËn nhiÖm vô gióp Vu DÇn t×m Méc Thñ")
end;

function yes1512_2 ()
		Talk(1,"","PhiÒn b»ng h÷u gióp ta ®Õn ThiÕu L©m mËt thÊt t×m 15 m¶nh §ång")
		SetTask(1512,15)
		--AddNote("½ÓÊÜ°ïÎ×ÒúÊÕ¼¯Í­¿éµÄÈÎÎñ")
		TaskTip("NhËn nhiÖm vô gióp Vu DÇn t×m m¶nh §ång")
end;


function no1512 ()
		Talk(1,"","Xem ra ph¶i nhê ®Õn ng­êi kh¸c th«i.")
end;
