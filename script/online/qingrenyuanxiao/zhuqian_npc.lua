--filename:zhuqian_npc.lua
--create date:2006-01-22
--author:yanjun
--describe:ÖìÇx½Å±¾
Include("\\script\\online\\qingrenyuanxiao\\qryx_head.lua")

function main()
	if CanAcceptTask(TASK_LOVESTORY4,7) == 1 then
		Talk(5,"","Xin hái ®¹i n­¬ng cã ph¶i lµ Chu XuyÕn? Chu LÖ vµ La MËt yªu nhau, ®¹i n­¬ng biÕt kh«ng?",
				"Ta biÕt chø! Nh­ng hai gia ®×nh lµ kÎ thï kh«ng ®éi trêi chung, chóng kh«ng thÓ nµo yªu nhau!",
				"§¹i n­¬ng biÕt kh«ng, nh©n duyªn ®«i trÎ lµ do «ng trêi s¾p ®Æt, NguyÖt l·o se duyªn! HiÒm khİch cña ®êi tr­íc, hµ tÊt ®Ó ®êi sau g¸nh chŞu? Ngay c¶ thuèc ®éc hä còng ®· chuÈn bŞ. Xin ®¹i n­¬ng ®õng chia loan rÏ phông.",
				"Th«i ®­îc! Ta hy väng mèi t×nh nµy cã thÓ hãa gi¶i ©n o¸n hai nhµ.",
				"Nh­ thÕ lµ ®¹i n­¬ng ®· ®ång ı? Ta sÏ mang tin mõng nµy vÒ b¸o cho g· si t×nh La MËt.")
		local OldPlayerIndex = PlayerIndex 
		for i=1,2 do
			PlayerIndex = GetTeamMember(i)
			SetTask(TASK_LOVESTORY4,8)
			TaskTip("B¸o tin mõng cho La MËt")
		end
		PlayerIndex = OldPlayerIndex
	else
		if GetCash() == 928 then
			Say("Nh©n lÔ t×nh nh©n, chóc mäi ng­êi vui vÎ, chóc nh÷ng ®«i t×nh nh©n sím thµnh phu thª.",0)
		else
			Say("Ng­¬i lµ ai vËy?",0)
		end
	end
	
	if AllTaskComplete() ==1 then
		TaskTip("H·y ®Õn NguyÖt l·o l·nh th­ëng.")
		Msg2Player("Cuèi cïng ®· gióp NguyÖt l·o t¸c hîp cho 4 cÆp t×nh nh©n, h·y mau gÆp NguyÖt l·o l·nh th­ëng.")
	end
end
