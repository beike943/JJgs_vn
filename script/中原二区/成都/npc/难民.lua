--ÈÎÎñ
--µØµã£º ÈÎÎñ£º
--²ß»®£º·®ÍòËÉ  2004.03.
Include("\\script\\task\\world\\task_award.lua");


function main()
	UWorld1402 = GetTask(1402)
	if UWorld1402 == 100 then
		UWorld1402 = 0
	end
	if ( UWorld1402 == 0 and GetLevel() >= 40 )  then
			Talk(4,"","GÇn ®©y sao cã nhiÒu n¹n d©n thÕ?","Lµm ¬n cho t«i <color=red>2 c¸i b¸nh ng«<color>! MÊy ngµy nay t«i ch¼ng cã g× ®Ó ¨n.","C¸c ng­êi tõ ®©u ®Õn?","Lµm ¬n cho t«i <color=red>2 c¸i b¸nh ng«<color>! MÊy ngµy nay t«i ch¼ng cã g× ®Ó ¨n.")
			SetTask(1402,5)
	elseif ( UWorld1402 == 5 and GetItemCount(1,1,1) > 1  )  then
			Talk(2,"","Xin ®a t¹! Chóng t«i ®Òu lµ ng­êi cña <color=red>Giang T©n th«n<color>, n¬i ®ã ®ét nhiªn xuÊt hiÖn nhiÒu yªu ma quû qu¸i, mong ®¹i hiÖp ra tay gióp ®ì! Cã vŞ ®¹i hiÖp tªn lµ <color=red>Tr­¬ng §×nh<color> ®ang chiÕn diÖt trõ bän yªu qu¸i ë ®ã, cã viÖc g× cø hái y.","§­îc! §Ó ta ®Õn ®ã mét chuyÕn xem sao.")
			if  DelItem(1,1,1,2) == 1 then 
				 SetTask(1402,10)
				 --AddItem(0,0,0)
				 Earn(500)
				 GivePlayerExp(SkeyFDGC,"fengduguicheng1")		--·á¶¼¹í³Ç1
				 ModifyReputation(5,0)
				 --AddNote("Ö÷Ïß¾çÇé¡ª¡ª¹íÓòÈÎÎñ£¬Æô¶¯£¡È¥½­½ò´åÎÊÎÊÕÅöª¾ßÌåÇé¿ö¡£")
				 TaskTip("NhiÖm vô Hoµng Kim--nhiÖm vô Quû Thµnh, b¾t ®Çu! §Õn Giang T©n th«n hái Tr­¬ng §×nh t×nh h×nh cô thÓ.")
			else
			 Talk(1,"","ChuyÓn giao vËt phÈm kh«ng thµnh c«ng")
			end
	elseif ( UWorld1402 == 5 and GetItemCount(1,1,1) < 2 and GetItemCount(1,1,1) >= 0 )  then
			Talk(1,"","Lµm ¬n cho t«i <color=red>2 c¸i b¸nh ng«<color>! MÊy ngµy nay t«i ch¼ng cã g× ®Ó ¨n.")
	elseif ( UWorld1402 == 10 )  then
			Talk(1,"","<color=red>Giang T©n th«n<color> cã vŞ ®¹i hiÖp tªn <color=red>Tr­¬ng §×nh<color> ®ang diÖt trõ ma qu¸i, cã viÖc g× cø hái y.")
	elseif ( GetLevel() <40 ) then
			Talk(1,"","§îi ®Õn lóc vâ c«ng cña §¹i hiÖp tiÕn bé thªm h·y ®Õn <color=red>Giang T©n th«n<color> gióp bän t«i!")
	else
			Talk(1,"","Lµm ¬n cho tiÓu nh©n xin 2 c¸i b¸nh ng« ¨n ®i!")
	end
end;
