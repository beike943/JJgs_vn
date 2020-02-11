--filename:luomi.lua
--create date:2006-01-21
--author:yanjun
--describe:ÂÞÃÜ½Å±¾
Include("\\script\\online\\qingrenyuanxiao\\qryx_head.lua")

function main()
	local selTab = {
				"Ta ®ång ý/ok",
				"§Ó ta suy nghÜ l¹i/nothing"
				}
	if NoTaskBegin() == 1 then
		Say("4 nhiÖm vô nµy cÇn ph¶i tæ ®éi, b¹n cã ®ång ý cïng lµm víi ®éi h÷u kh«ng?",2,selTab)
	else
		ok()
	end
end

function ok()
	if GetTask(TASK_LOVESTORY4) == 0 then
		if GetCash() == 214 then
			Say("¤i!...",0)
		elseif GetSex() == 2 and GetCash() == 521 then
			Say("C« n­¬ng cßn ®Ñp h¬n c¶ Chu LÖ, xem ra ta v­ît qua bao thÕ kû ®Õn víi thÕ giíi vâ l©m 2 lµ ®Ó héi ngé cïng n÷ hiÖp.",0)
		else
			Say("Nµng còng yªu ta ­?",0)
		end
	elseif CanAcceptTask(TASK_LOVESTORY4,1) == 1 then
		Talk(5,"","Cã chuyÖn g× vËy? Sao c«ng tö buån b· thÕ?",
				"D¹ yÕn lÇn tr­íc ta cã quen víi <color=yellow>Chu LÖ<color>, kh«ng biÕt nµng cã thÝch ta kh«ng? Ta l¹i ng¹i hái.",
				"ThÕ nµy ®i, ta sÏ lµm mai giïm hai ng­êi.",
				"Tèt qu¸, nhê n÷ hiÖp nãi giïm: ta nghÜ r»ng chØ cã ta kh«ng ngñ ®­îc, kh«ng biÕt Chu LÖ cã ngñ ®­îc hay kh«ng?",
				"VËy ®Ó ta chuyÓn lêi giïm.")
		local OldPlayerIndex = PlayerIndex 
		local maleIndex,femaleIndex = GetLoversIndex()
		local teamIndex = CreateTeamIndex(maleIndex,femaleIndex)
		if teamIndex == 0 then
			Say("TiÕp nhËn nhiÖm vô thÊt b¹i, xin h·y thö l¹i!",0)
			return 0
		end		
		for i=1,2 do
			PlayerIndex = GetTeamMember(i)
			SetTask(TASK_LOVESTORY4,2)
			SetTask(TASK_TEAM_INDEX,teamIndex)
			TaskTip("ChuyÓn lêi cña La MËt cho Chu LÖ ë BiÖn Kinh")
		end
		PlayerIndex = OldPlayerIndex
	elseif CanAcceptTask(TASK_LOVESTORY4,2) == 1 then
		Say("Nhê n÷ hiÖp nãi giïm: ta nghÜ r»ng chØ cã ta kh«ng ngñ ®­îc, kh«ng biÕt Chu LÖ cã ngñ ®­îc hay kh«ng?",0)
	elseif CanAcceptTask(TASK_LOVESTORY4,3) == 1 then
		Talk(6,"","Sao råi? Cã håi ©m ch­a?",
				"§· truyÒn ®¹t råi, th× ra c« Êy còng thÝch c«ng tö!",
				"Th× ra nh©n duyªn nµy lµ do «ng trêi s¾p ®Æt!",
				"¤ng trêi ®· s¾p ®Æt, vÉn ch­a tèt ®Ñp hay sao?",
				"MÊy lÇn ta hÑn nµng, nh­ng nµng ®Òu tõ chèi, t¹i sao vËy?",
				"§­îc råi, ®Ó ta hái l¹i.")
		local OldPlayerIndex = PlayerIndex 
		for i=1,2 do
			PlayerIndex = GetTeamMember(i)
			SetTask(TASK_LOVESTORY4,4)
			TaskTip("GÆp Chu LÖ hái nguyªn nh©n")
		end
		PlayerIndex = OldPlayerIndex
	elseif CanAcceptTask(TASK_LOVESTORY4,4) == 1 then
		Say("Nhê c« n­¬ng hái giïm ta, t¹i sao mçi lÇn hÑn, nµng ®Òu tõ chèi thÕ?",0)
	elseif CanAcceptTask(TASK_LOVESTORY4,5) == 1 then
		Talk(9,"","ChuyÖn lµ nh­ thÕ nµy……",
				"Hai bªn hËn nhau nh­ thÕ, nÕu thiªn h¹ nµy chØ cã ta vµ nµng th× tèt biÕt mÊy, sÏ kh«ng ph¶i xÊu mÆt! ",
				"Sao l¹i xÊu mÆt?",
				"Hai bªn lµm rïm ben lªn cßn kh«ng xÊu mÆt sao? §Ó chøng tá t×nh yªu cña ta ®èi víi nµng, ta sÏ tù tö!",
				"Tù tö?",
				"Ta kh«ng chØ muèn tù tö, mµ ta ®Þnh cïng chÕt víi nµng! ",
				"ThËt lµ c¶m ®éng! ",
				"Th«i, kh«ng cÇn khuyªn ta n÷a? Ta ®· chuÈn bÞ thuèc ®éc, thuèc nµy cßn ®éc h¬n hãa cèt miªn ch­ëng.",
				"§Ó ta vÒ khuyªn Chu LÖ.")
		local OldPlayerIndex = PlayerIndex 
		for i=1,2 do
			PlayerIndex = GetTeamMember(i)
			SetTask(TASK_LOVESTORY4,6)
			TaskTip("Khuyªn Chu LÖ")
		end
		PlayerIndex = OldPlayerIndex		
	elseif CanAcceptTask(TASK_LOVESTORY4,6) == 1 or CanAcceptTask(TASK_LOVESTORY4,7) == 1 then
		Say("Sèng trªn ®êi kh«ng ®­îc vui thµ chÕt cßn h¬n!",0)
	elseif CanAcceptTask(TASK_LOVESTORY4,8) == 1 then
		Talk(2,"","§õng uèng! Ta ®· thuyÕt phôc gia ®×nh nµng chÊp nhËn cho c«ng tö vµ Chu LÖ kÕt thµnh vî chång!",
				"Chóc b»ng h÷u vui vÎ! §©y lµ mãn quµ t¹ lÔ, xin b»ng h÷u ®õng tõ chèi!")
		local OldPlayerIndex = PlayerIndex 
		for i=1,2 do
			DelItem(2,0,358,1)
			PlayerIndex = GetTeamMember(i)
			SetTask(TASK_LOVESTORY4,9)
			if GetSex() == 1 then
				AddItem(2,0,351,1)
			end
		end
		PlayerIndex = OldPlayerIndex
	elseif GetTask(TASK_LOVESTORY4) == 9 then
		Say("§a t¹, chóc b»ng h÷u vui vÎ.",0)
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

function nothing()

end
