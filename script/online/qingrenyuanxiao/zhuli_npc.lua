--filename:zhuli.lua
--create date:2006-01-21
--author:yanjun
--describe:ÖìÀö½Å±¾
Include("\\script\\online\\qingrenyuanxiao\\qryx_head.lua")

function main()
	if CanAcceptTask(TASK_LOVESTORY4,2) == 1 then
		Talk(5,"","Chu LÖ c« n­¬ng, c«ng tö La MËt, quen ë ®ªm d¹ yÕn lÇn tr­íc, nhê ta chuyÓn lêi víi n÷ hiÖp.",
				"ChuyÖn g× thÕ?",
				"Quªn råi, ®Ó ta nghÜ l¹i ®·.",
				"Ta nghÜ r»ng chØ cã ta kh«ng ngñ §­îc! Th× ra Chu LÖ c« n­¬ng còng kh«ng ngñ ®­îc sao?",
				"Ta nghÜ r»ng chØ cã ta kh«ng ngñ §­îc! Th× ra Tinh Tinh c« n­¬ng còng kh«ng ngñ ®­îc sao?")
		Talk(5,"","Ta nghÜ r»ng chØ cã ta kh«ng ngñ ®­îc, kh«ng biÕt Chu LÖ c« n­¬ng cã ngñ ®­îc hay kh«ng?",
				"Ta nghÜ r»ng chØ cã ta kh«ng ngñ ®­îc, kh«ng biÕt Tinh Tinh c« n­¬ng cã ngñ ®­îc hay kh«ng?",
				"B»ng h÷u nãi g×? Sao ta kh«ng hiÓu?",
				"Th× ra chµng còng yªu ta? Ch¶ tr¸ch tim ta còng xao ®éng, thiÕu hiÖp biÕt kh«ng mçi khi ta gÆp mÆt chµng, ta kh«ng biÕt nãi g×? Chµng thËt th«ng minh! Ta cßn ®ang nghÜ, nÕu chµng kh«ng thİch ta th× lµm sao? Chµng cã vî råi th× lµm sao ®©y?",
				"Th× ra nµng còng yªu La MËt µ! Qu¸ dÔ! §Ó ta vÒ nãi l¹i víi La MËt!")
		local OldPlayerIndex = PlayerIndex 
		for i=1,2 do
			PlayerIndex = GetTeamMember(i)
			SetTask(TASK_LOVESTORY4,3)
			TaskTip("VÒ gÆp La MËt chuyÓn ®¹t t×nh ı cña Chu LÖ")
		end
		PlayerIndex = OldPlayerIndex
	elseif CanAcceptTask(TASK_LOVESTORY4,3) == 1 then
		Say("Tim ta ®ang ®Ëp th×nh thŞch...",0)
	elseif CanAcceptTask(TASK_LOVESTORY4,4) == 1 then
		Talk(7,"","Ta ®· truyÒn ®¹t t×nh ı cho hai ng­êi yªu nhau, mong ®«i uyªn ­¬ng gi÷ chÆt mèi t×nh nµy!",
				"§­îc! Ta sÏ tr©n träng mèi t×nh nµy.",
				"La MËt c«ng tö nãi mÊy lÇn hÑn víi c« n­¬ng, sao c« n­¬ng ®Òu cù tuyÖt vËy?",
				"huhu…",
				"C« n­¬ng h·y tõ tõ nãi!",
				"Bµ Chu XuyÕn nãi, La MËt lµ ch¸u cña §o¹t mÖnh th­ sinh, kÎ thï kh«ng ®éi trêi chung cña nhµ ta. H¾n ®· ®¸nh b¹i §­êng Thiªn Hµo, phu qu©n cña bµ bµ, ®o¹t lÊy binh khİ phæ vµ v­¬n lªn hµng thø hai, ®Èy §­êng M«n B¸ V­¬ng Th­¬ng xuèng hµng thø 3, cho nªn nghiªm cÊm ta kh«ng ®­îc qua l¹i víi La MËt.",
				"Th× ra nh­ thÕ, ®Ó ta vÒ nãi l¹i víi La MËt.")
		local OldPlayerIndex = PlayerIndex 
		for i=1,2 do
			PlayerIndex = GetTeamMember(i)
			SetTask(TASK_LOVESTORY4,5)
			TaskTip("Trë vÒ nãi víi La MËt mèi thï gi÷a hai nhµ")
		end
		PlayerIndex = OldPlayerIndex		
	elseif CanAcceptTask(TASK_LOVESTORY4,5) == 1 then
		Say("B»ng h÷u kh«ng ph¶i gióp ta nghÜ c¸ch ®ã sao?",0)
	elseif CanAcceptTask(TASK_LOVESTORY4,6) == 1 then
		Talk(5,"","Nghe nãi hai ng­êi muèn tù tö v× t×nh?",
				"§óng thÕ! Lµm ng­êi kh«ng vui cho dï cã tr­êng sinh bÊt tö còng v« dông!",
				"ThÕ nµy ®i, ®Ó ta thuyÕt phôc Chu XuyÕn, sau ®ã c« n­¬ng giao ®éc d­îc cho ta.",
				"Xin có lÊy! Nh­ng nhí tr¶ cho ta nhĞ!",
				"Yªn t©m! Thuèc ®éc nµy ta gi÷ lµm g×. Th«i ®Ó ta nãi chuyÖn víi Chu XuyÕn.")
		AddItem(2,0,358,1)
		local OldPlayerIndex = PlayerIndex 
		for i=1,2 do
			PlayerIndex = GetTeamMember(i)
			SetTask(TASK_LOVESTORY4,7)
			TaskTip("Cè g¾ng thuyÕt phôc Chu XuyÕn")
		end
		PlayerIndex = OldPlayerIndex
	elseif CanAcceptTask(TASK_LOVESTORY4,7) == 1 then
		Say("Hy väng thiÕu hiÖp thuyÕt phôc ®­îc <color=yellow>Chu XuyÕn<color> bµ bµ.",0)
	elseif GetTask(TASK_LOVESTORY4) == 8 or GetTask(TASK_LOVESTORY4) == 9 then
		DelItem(2,0,358,1)
		Say("§a t¹! Chóc thiÕu hiÖp vui vÎ.",0)
	elseif GetTask(TASK_LOVESTORY4) == 0 or GetTask(TASK_LOVESTORY4) == 1 then
		if GetCash() == 214 then
			Say("Trêi!",0)
		elseif GetSex() == 1 and GetCash() == 521 then
			Say("ThiÕu hiÖp cßn ®Ñp trai h¬n c¶ La MËt, xem ra ta v­ît qua bao thÕ kû ®Õn víi thÕ giíi vâ l©m 2 lµ ®Ó héi ngé cïng thiÕu hiÖp.",0)
		else
			Say("Chµng còng yªu ta ­?",0)
		end
	elseif GetTeamSize() == 2 then
		Say("Tho¹t ®Çu lµ ®«i b¹n, sao b©y giê lµ ®«i t×nh nh©n vËy?",0)
	else
		Say("D­êng nh­ 1 m×nh ng­¬i kh«ng thÓ gióp ta, ph¶i lµ 1 ®«i t×nh nh©n míi ®­îc.",0)
	end
	
	if AllTaskComplete() ==1 then
		TaskTip("H·y ®Õn NguyÖt l·o l·nh th­ëng.")
		Msg2Player("Cuèi cïng ®· gióp NguyÖt l·o t¸c hîp cho 4 cÆp t×nh nh©n, h·y mau gÆp NguyÖt l·o l·nh th­ëng.")
	end
end