--ÈÎÎñ
--µØµã£ºãê¾© ÈÎÎñ£ºÌìÃÅ¹ØÈÎÎñ½áµã7
--²ß»®£º·®ÍòËÉ  2004.03.
Include("\\script\\task\\world\\task_award.lua");
Include("\\script\\online_activites\\head\\activity_kill_npc_task.lua")

function main(bTag)
	if g_akct_GetTaskStep(bTag) then
		return
	end
	UWorld1401 = GetTask(1401)
	if ( UWorld1401 == 45  )  then
		Talk(5,"","Ng­¬i lµ ai? Sao tù tiÖn vµo ®©y?","<color=green>ng­êi ch¬i<color>: ta võa míi ®Õn, võa vµo ®éi ngò. NhËn lÖnh Th¸i Qu©n ®Õn b¸o danh qu©n D­¬ng Gia, cßn n÷a, L·o Th¸i Qu©n cã nhê ta chuyªn ®Õn cho ngµi 1 c©u, chİnh lµ “TiÓu nh©n ®­¬ng ®¹o, cÈn thËn hµnh ®éng.”","<color=green>D­¬ng NghiÖp<color>: Phu nh©n thËt cã lßng! §­îc råi, tiÓu anh hïng ®©y lÇn ®Çu ®Õn Nh¹n M«n Quan, còng kh«ng tiÖn lªn tiÒn tuyÕn ngay, tr­íc tiªn h·y gióp ta trõng trŞ nh÷ng tªn t­íng kh«ng gi÷ luËt tù tiÖn hµnh ®éng.!","§Õn <color=red>Nh¹n M«n quan<color> trõng trŞ mét sè <color=red>Kiªu binh<color> thu vÒ <color=red> 10 Méc Bµi<color>.","<color=green>Ng­êi ch¬i<color>: ®­îc, tiÓu nh©n sÏ ®i ngay!")
		SetTask(1401,50)
		GivePlayerExp(SkeyTianmenzhen,"yangjiajiang")
		TaskTip("Gióp D­¬ng NghiÖp trõng trŞ Kiªu binh thu vÒ 10 Méc Bµi.")
	elseif ( UWorld1401  == 50 and GetItemCount(2,1,64) >= 10 ) then
				if  DelItem(2,1,64,10) == 1 then
						    GivePlayerExp(SkeyTianmenzhen,"shumupai")
						    --Earn(1500)
						    ModifyReputation(18,0)						    
								--AddNote("³ÍÖÎ±øÆ¦µÄÈÎÎñÍê³É¡£")
						    TaskTip("NhiÖm vô trõng trŞ Kiªu binh hoµn thµnh.")
						    Msg2Player("NhiÖm vô trõng trŞ Kiªu binh hoµn thµnh.")
		    
								Talk(6,"","<color=green>D­¬ng NghiÖp<color>: qu¶ nhiªn th©n thñ bÊt phµm, hoµn thµnh nhiÖm vô nhanh nh­ vËy! thÕ th×, xÕp cho ng­¬i mét <color=red>nhiÖm vô khã kh¨n <color> vËy!","<color=green>D­¬ng NghiÖp<color>: Ng­¬i võa míi ®Òn, qu©n Liªu ch­a gÆp qua ng­¬i, thÕ th× ng­¬i h·y gióp ta qua qu©n doanh phe Liªu th¸m thİnh tin tøc ®i.","Nh­ng ta lµ ng­êi H¸n lµm sao tiÕp cËn ®­îc víi ng­êi KhiÕt §an?","Nghe nãi <color=red>BiÖn Kinh phñ<color> cã mét ng­êi H¸n tªn lµ <color=red>Hµn Trİ Nh­îng<color> kÕt h«n cïng víi mét thiÕu n÷ ng­êi KhiÕt §an.","§Õn t×m <color=red>Hµn Trİ Nh­îng<color>, nãi ng­¬i lµ th«ng gia cña «ng Êy, ch¾c ch¾n sÏ ®­îc hËu ®·i. Tranh thñ thu thËp tin tøc!","§­îc! T¹i h¹ sÏ ®Õn <color=red>BiÖn Kinh phñ <color> t×m <color=red>Hµn Trİ Nh­îng l·o nh©n<color>.")
								SetTask(1401,55)
			else
							 Talk(1,"","ChuyÓn giao vËt phÈm kh«ng thµnh c«ng")
			end
		elseif ( UWorld1401  == 50 and GetItemCount(2,1,19) < 10 ) then
						Talk(1,"","§Õn <color=red>Nh¹n M«n quan<color> trõng trŞ mét sè <color=red>Kiªu binh<color> thu vÒ <color=red> 10 Méc Bµi<color>.")
		elseif ( UWorld1401  == 55  ) then
						Talk(1,"","Mau ®Õn <color=red>BiÖn Kinh phñ<color> t×m <color=red>Hµn Trİ Nh­îng<color> l·o nh©n.")
--ÒÔÏÂÊÇÑîËÄÀÉÈÎÎñ---------------------------------------------
		elseif ( UWorld1401  == 105 ) then
						Talk(5,"","<color=green>Ng­êi ch¬i<color>: BÈm t­íng qu©n, t¹i h¹ th¸m thİnh ®­îc ng­êi KhiÕt §an ®· chuÈn bŞ 10 v¹n tinh binh bè trİ t¹i Thiªn M«n §¹i TrËn! Mong t­íng qu©n cã kÕ s¸ch chuÈn bŞ!","Cã thËt kh«ng? Ng­¬i nghe tõ ®©u vËy?","T¹i h¹ võa tõ chç <color=red>D­¬ng Diªn Huy<color> trë vÒ.","<color=green>D­¬ng NghiÖp<color>: ta hiÖn vÉn cßn sèng trªn thÕ gian, cßn lµm phß m· n­íc Liªu, «ng trêi ®èi ®·i ta thËt qu¸ tèt råi! Ng­¬i h·y nhanh chãng quay vÒ b¸o víi <color=red>§×nh Huy<color> r»ng h·y yªn t©m, ta ®· suy tİnh, nhÊt ®Şnh sÏ chuÈn bŞ tr­íc. Cßn n÷a göi lêi nh¾n cña mÑ anh Êy rÊt nhí anh Êy, cã thêi gian h·y quay l¹i th¨m bµ Êy.","T¹i h¹ sÏ lËp tøc ®Õn <color=red>Bé L¹c V­¬ng Kú<color> b¸o cho <color=red>D­¬ng ®¹i nh©n <color>!")
						  GivePlayerExp(SkeyTianmenzhen,"zhunbeichutao")
						  --Earn(1500)
						  ModifyReputation(18,0)
							SetTask(1401,110)	    
							--AddNote("»ØÍõÆì²¿Âä¸øÑîÑÓ»Ô£¨ÄÂÒå£©»Ø»°¡£")
							TaskTip("Quay l¹i Bé L¹c V­¬ng Kú håi b¸o phß m· Môc NghÜa")
		elseif ( UWorld1401  == 110 ) then
							Talk(1,"","PhiÒn b»ng h÷u håi b¸o l¹i cho nhi tö <color=red>D­¬ng Diªn Huy<color>.")
							
--ÒÔÏÂÊÇÑãÃÅ¹ØÈÎÎñµÄ´ó½á¾Ö---------------------------------------
		elseif ( UWorld1401  == 130 ) then
				Talk(3,"","BÈm b¸o T­íng qu©n, t¹i h¹ võa tõ chç <color=red>Tiªu Thiªn Hùu<color> biÕt ®­îc <color=yellow>B¶n ®å S¬n Hµ X· T¾c<color> hiÖn ë Thiªn M«n trËn. V× quyÕt ®o¹t ®­îc nã, KhiÕt §an ®· chuÈn bŞ 10 v¹n tinh binh.","<color=green>D­¬ng NghiÖp <color>: A! <color=yellow>S¬n Hµ X· T¾c §å <color> qu¶ nhiªn ®· xuÊt hiÖn råi, thËt lµ nghiÖp ch­íng! L·o phu hi väng thiÕu hiÖp h·y nhanh chãng ®Õn <color=red>Thiªn M«n TrËn<color> ®o¹t lÊy <color=yellow>S¬n Hµ X· T¾c §å<color>","<color=green>Ng­êi ch¬i<color>: ®­îc! T¹i h¹ ®i lËp tøc ®Õn <color=red>Thiªn M«n TrËn<color> ®o¹t lÊy <color=yellow>S¬n Hµ X· T¾c §å <color>#")
		    SetTask(1401,135)
		    GivePlayerExp(SkeyTianmenzhen,"huibao")
		    --Earn(2000)
		    ModifyReputation(25,0)
		    AddNote("Víi danh nghÜa t­íng lÜnh qu©n Tèng vµo Thiªn M«n trËn ®o¹t tÊm B¶n ®å S¬n Hµ X· T¾c. (sau nµy cã thÓ ®æi l¹i)")
		    TaskTip("Víi danh nghÜa t­íng lÜnh qu©n Tèng vµo Thiªn M«n trËn ®o¹t tÊm B¶n ®å S¬n Hµ X· T¾c. (sau nµy cã thÓ ®æi l¹i)")
		
		elseif ( UWorld1401  == 125 or UWorld1401  == 135 ) then
				Talk(1,"","Sao råi? Cã tin tøc g× cña qu©n Liªu kh«ng?")
		
		else
								Talk(1,"","Chç So¸i Tr­íng kh«ng ®­îc tïy tiÖn!")
	end
end;
