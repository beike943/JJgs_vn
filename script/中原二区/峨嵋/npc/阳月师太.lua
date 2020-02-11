--ÈÎÎñ
--µØµã£º ÈÎÎñ£º
--²ß»®£º·®ÍòËÉ  2004.03.
Include("\\script\\task\\world\\task_award.lua");
Include("\\script\\online_activites\\head\\activity_kill_npc_task.lua")

function main(bTag)
	if g_akct_GetTaskStep(bTag) then
		return
	end
	UWorld1402 = GetTask(1402)
	---------------ÒÔÏÂÊÇ´ò¿ª·âÄ§¶´µØÍ¼µÄÈÎÎñ------------------------------------
	if ( UWorld1402 == 20 )  then
			Talk(3,"","Ng­êi lµ D­¬ng NguyÖt S­ Th¸i? V·n bèi thÊy yªu ma hoµnh hµnh ë Giang T©n th«n, ®Şnh ra tay t­¬ng trî nh­ng kh«ng biÕt lµm thÕ nµo nªn ®Õn ®©y thØnh gi¸o s­ th¸i.","§óng lµ nghiÖp ch­íng! §¸m yªu nghiÖt nµy nhÊt ®Şnh lµ tõ d­íi <color=red>Phong Ma ®éng<color> ch¹y ra. N¨m x­a L·o ni ®· giam chóng ë ®ã nªn míi ®Ó l¹i hËu ho¹n cho th«n d©n! Ng­¬i h·y ®i lÊy <color=red>1 viªn X¸ Lîi Kim §¬n<color>, ta sÏ lµm phĞp gióp ng­¬i ®Õn <color=red>Phong Ma ®éng<color> diÖt trõ yªu ma.","T¹i h¹ ®i ngay!")
			SetTask(1402,25)
			--AddNote("È¡1¸öÉáÀû½ğµ¤À´£¬ÒÔ±ãµÃµ½ÑôÔÂÊ¦Ì«µÄ°ïÖú¶øÄÜ¹»×ÔÓÉ³öÈë·âÄ§¶´¡£")
			TaskTip("T×m 1 viªn X¸ Lîi Kim §¬n vÒ nhê D­¬ng NguyÖt S­ Th¸i dÉn vµo Phong Ma ®éng.")
	elseif ( UWorld1402  == 25 and GetItemCount(2,3,7) < 1 ) then
			Talk(1,"","H·y t×m <color=red>1 viªn X¸ Lîi Kim §¬n<color> vÒ, ta sÏ lµm phĞp gióp ng­¬i vµo <color=red>Phong Ma ®éng<color>.")
	elseif ( UWorld1402  == 25 and GetItemCount(2,3,7) >= 1  ) then
		if  DelItem(2,3,7,1) == 1 then 
				 Talk(4,"","N¨m x­a khi ta giam chóng trong ®éng ®· mÊt rÊt nhiÒu ch©n khİ, b©y giê kh«ng thÓ trùc tiÕp ®èi ®Çu víi chóng.","VËy t¹i h¹ ph¶i lµm sao?","HiÖn giê ng­¬i ®· cã thÓ tù do ra vµo <color=red>Phong Ma ®éng<color>, trong ®éng cã con yªu qu¸i tªn lµ <color=red>Du Hån<color>, khi nã bŞ tiªu diÖt sÏ dån tÊt c¶ søc m¹nh kÕt thµnh <color=red>U Hån<color>, ng­¬i h·y lÊy <color=red>10 viªn<color> cho ta, ta cã thÓ biÕt ®­îc t×nh h×nh cña bän chóng ®Ó tİnh b­íc tiÕp theo. NÕu thùc lùc cña ng­¬i ch­a ®ñ th× h·y ®Õn <color=red>Giang T©n th«n t×m §¹i hiÖp Tr­¬ng §×nh (191.167)<color> nhê gióp ®ì.","§Ö tö xin ®i ngay!")
				 SetTask(1402,30)
				 --AddItem(1,1,1,1)
				 Earn(1000)
				 GivePlayerExp(SkeyFDGC,"fengduguicheng3")		--·á¶¼¹í³Ç3
				 ModifyReputation(15,0)
				 --AddNote("È¥·âÄ§¶´È¡Ê®¿ÅÓÎ»êµÄÓÄ»ê£¬ÒÔ±ãµÃÖªÏÂÒ»²½µÄĞĞ¶¯·½·¨¡£")
				 TaskTip("Vµo Phong Ma ®éng lÊy 10 viªn U Hån ®Ó biÕt hµnh ®éng tiÕp theo")
		else
		 Talk(1,"","ChuyÓn giao vËt phÈm kh«ng thµnh c«ng")
		end
	---------------------ÒÔÏÂÊÇ´ò¿ª·á¶¼¹í³ÇÈÎÎñµÄµÚÒ»²½------------------------------------
	elseif ( UWorld1402  == 30 and GetItemCount(2,1,51) < 10 ) then
			Talk(1,"","<color=red>Du Hån<color> trong <color=red>Phong Ma ®éng<color> khi bŞ tiªu diÖt sÏ ng­ng tô thµnh <color=red>U Hån<color>, ng­¬i lÊy <color=red>10 viªn<color> vÒ cho ta, tõ ®ã ta cã thÓ biÕt t×nh h×nh cña bän chóng ®Ó nghÜ b­íc tiÕp theo.")
	elseif ( UWorld1402  == 30 and GetItemCount(2,1,51) > 9  ) then
			if  DelItem(2,1,51,10) == 1 then 
					 Talk(4,"","Hay l¾m! Ta cã c¶m thÊy trong ®ã cã chót søc m¹nh nhá nhoi.","VËy cã thÓ chøng tá ®iÒu g×?","§iÒu ®ã chøng tá nhÊt ®Şnh cã kÎ kh¸c më cöa ®éng Phong Ma. Ng­¬i mau ®Õn Phong Ma ®éng hái <color=red>Lam D· Quû<color> kÎ nµo ®· më cöa ®éng.","§Ö tö xin ®i ngay!")
					 SetTask(1402,35)
					 --AddItem(1,1,1,1)
					 Earn(800)
					 GivePlayerExp(SkeyFDGC,"fengduguicheng4")		--·á¶¼¹í³Ç4
					 ModifyReputation(10,0)
					 --AddNote("È¥·âÄ§¶´ÕÒÒ»¸öÒ°¹íÎÊÎÊµ½µ×ÊÇË­´ò¿ªµÄ·âÄ§¶´¿Ú¡£")
					 TaskTip("§Õn Phong Ma ®éng hái Lam D· Quû (202.180) ai ®· më cöa ®éng.")
			else
			 Talk(1,"","ChuyÓn giao vËt phÈm kh«ng thµnh c«ng")
			end
	elseif ( UWorld1402  == 35  ) then
					Talk(1,"","NhÊt ®Şnh cã kÎ kh¸c më cöa ®éng Phong Ma. Ng­¬i mau ®Õn Phong Ma ®éng hái <color=red>Lam D· Quû<color> kÎ nµo ®· më cöa ®éng.")
	
	---------------------ÒÔÏÂÊÇ´ò¿ª¹í³ÇÈÎÎñµÚÈı²½----------------------------------------------
	
	elseif ( UWorld1402  == 40  ) then
					    Talk(5,"","Ta dß la ®­îc tin Phong §« Quû Thµnh ®· xuÊt hiÖn ë phİa §«ng Giang T©n th«n, cã thÓ mét tªn ma t­íng nµo ®ã cña Quû Thµnh ®· më cöa ®éng Phong Ma.","Kh«ng thÓ nµo! Ma t­íng cña Quû Thµnh kh«ng thÓ cã søc m¹nh lín ®Õn nh­ vËy. Trõ phi chóng cã <color=red>b¶n ®å S¬n Hµ X· T¾c<color>. Ng­¬i mau ®i ®iÒu tra râ!","T¹i h¹ ®i ngay!","HiÖn giê ng­¬i ch­a thÓ vµo Quû Thµnh ®­îc. H·y ®i lÊy <color=red>2 viªn X¸ Lîi Kim §¬n<color> ®Õn ®©y.","T¹i h¹ ®i ngay!")
					    SetTask(1402,45)
					    --AddItem(1,1,1,1)
					    Earn(800)
						GivePlayerExp(SkeyFDGC,"fengduguicheng5")		--·á¶¼¹í³Ç5
					    ModifyReputation(10,0)
					    --AddNote("È¡Á½¿ÅÉáÀû½ğµ¤ÖÁÑôÔÂÊ¦Ì«´¦¡£")
					    TaskTip("§em 2 viªn X¸ Lîi Kim §¬n ®Õn gÆp D­¬ng NguyÖt S­ Th¸i.")
	elseif ( UWorld1402  == 45 and GetItemCount(2,3,7) < 2 ) then
			Talk(1,"","HiÖn giê ng­¬i ch­a thÓ vµo Quû Thµnh ®­îc. H·y ®i lÊy <color=red>2 viªn X¸ Lîi Kim §¬n<color> ®Õn ®©y.")
	
	-----------------ÒÔÏÂÊÇ´ò¿ª¹í³ÇÈÎÎñµÄµÚËÄ²½-----------------------------------------------------
	elseif ( UWorld1402  == 45 and GetItemCount(2,3,7) >= 2 ) then
				if  DelItem(2,3,7,1) == 1 then
							Talk(2,"","S­ Th¸i! §©y lµ X¸ Lîi Kim §¬n.","Hay l¾m! Hai viªn kim ®¬n nµy ng­¬i gi÷ mét viªn ®Ó tr¸nh yªu khİ nhËp thÓ. Ngoµi ra víi c«ng lùc cña ta kh«ng ®ñ gióp ng­¬i x©m nhËp Quû Thµnh an toµn. h·y ®Õn <color=red>ThiÕu L©m Tù<color> t×m <color=red>HuyÒn DiÖt T«n Gi¶<color>, «ng ta ë trong <color=red>Th¸p L©m<color>, víi c«ng lùc cña «ng ta cã thÓ gióp ng­¬i vµo Quû Thµnh.") 
							SetTask(1402,50)
							--AddItem(1,1,1,1)
							Earn(800)
							GivePlayerExp(SkeyFDGC,"fengduguicheng6")		--·á¶¼¹í³Ç6
							ModifyReputation(10,0)
							--AddNote("È¥ÉÙÁÖËÂµÄÉÙÁÖËşÁÖÕÒĞşÃğ×ğÕß£¬ÒÔ±ãÄÜ¹»Æ½°²µÄ½øÈë·á¶¼¹í³Ç¡£")
							TaskTip("§Õn ThiÕu L©m Tù t×m HuyÒn DiÖt T«n Gi¶ gióp ®ì")
				else
							Talk(1,"","ChuyÓn giao vËt phÈm kh«ng thµnh c«ng")
				end
	elseif ( UWorld1402  == 50 ) then
				Talk(1,"","Ng­¬i ®Õn <color=red>ThiÕu L©m Tù<color> t×m <color=red>HuyÒn DiÖt T«n Gi¶<color>, «ng ta ë trong <color=red>Th¸p L©m<color>. Víi c«ng lùc cña «ng ta cã thÓ gióp ng­¬i x©m nhËp Quû Thµnh an toµn. H·y nhí khi vµo Quû Thµnh Phong §« nhí ®em theo <color=red>1 viªn X¸ Lîi Kim §¬n<color> ®Ó phßng th©n.")
	
	------------------ÒÔÏÂÊÇ´ò¿ªÌìÊ¦¶´µÄÈÎÎñ------------------------------------------------------
	elseif ( UWorld1402 == 75 )  then
			Talk(7,"","S­ Th¸i! T¹i h¹ võa tõ Phong §« Quû Thµnh trë vÒ. N¬i ®ã kh¸ nguy hiÓm, giê ph¶i lµm sao ®©y?","Xem ra ®µnh ph¶i t×m <color=yellow>c« ta råi<color>.","<color=yellow>C« ta<color> lµ ai?","C« ta chİnh lµ s­ muéi cña ta, mÆc dï vâ c«ng cao h¬n ta rÊt nhiÒu nh­ng n¨m x­a c« ta ®· cùc lùc ph¶n ®èi ta giam bän yªu ma ë Phong Ma ®éng. N¨m x­a ta trÎ tuæi cè chÊp kh«ng nghe c« ta khuyªn nªn g©y ra ®¹i häa h«m nay.","Xin hái quı t¸nh cña c« ta? T¹i h¹ ®Õn ®©u míi cã thÓ t×m ®­îc c« ta?","C« ta ®· bŞ ta trôc xuÊt khái s­ m«n, lóc tr­íc cã ng­êi thÊy c« ta ë <color=red>Thµnh §«<color>, tªn tôc gia cña c« ta lµ <color=red>V­¬ng CÈn<color>. Ng­¬i h·y ®i t×m c« ta vµ nãi n¨m x­a lµ do ta kh«ng ®óng víi c« ta, mong c« ta h·y lÊy viÖc cøu sinh linh ®å th¸n lµm träng vµ chØ c¸ch ®uæi bän Quû Thµnh khái nh©n gian.","T¹i h¹ ®i ngay!")
			SetTask(1402,80)		
			--AddItem(1,1,1,1)
			Earn(1200)
			GivePlayerExp(SkeyFDGC,"fengduguicheng10")		--·á¶¼¹í³Ç10
			ModifyReputation(18,0)
			--AddNote("È¥³É¶¼¸®ÕÒÍõèª°ïÃ¦¡£")
			TaskTip("§Õn Thµnh §« t×m V­¬ng CÈn.")
	else
			Talk(1,"","Nam M« A Di §µ PhËt!")
	end
end;
