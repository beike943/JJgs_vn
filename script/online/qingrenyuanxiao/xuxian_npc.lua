--filename:xuxian.lua
--create date:2006-01-22
--author:yanjun
--describe:ĞíÏÉ½Å±¾
Include("\\script\\online\\qingrenyuanxiao\\qryx_head.lua")

function main()
	if CanAcceptTask(TASK_LOVESTORY2,2) == 1 then
		Talk(5,"","ThËt phiÒn qu¸!",
				"Høa c«ng tö, B¹ch Tè Trinh nhê ta hái c«ng tö h«m nay cã r¶nh ®Õn nhµ lÊy dï ®­îc kh«ng?",
				"Ta v× viÖc nµy mµ buån phiÒn, muèn chuÈn bŞ 1 sè lÔ vËt nh­ng l¹i thiÕu <color=red>Hïng Hoµng töu<color>.",
				"§©u khã, ®Ó ta ®Õn töu lÇu ch¾c ch¾n sÏ cã.",
				"VËy phiÒn nhŞ vŞ qu¸.")
		local OldPlayerIndex = PlayerIndex
		for i=1,2 do
			PlayerIndex = GetTeamMember(i)
			SetTask(TASK_LOVESTORY2,3)
			TaskTip("§Õn töu lÇu mua cho Høa Tiªn 1 b×nh Hïng Hoµng töu")
		end
		PlayerIndex = OldPlayerIndex
	elseif CanAcceptTask(TASK_LOVESTORY2,3) == 1 then
		Say("B»ng h÷u kh«ng ph¶i gióp ta mua r­îu sao?",0)
	elseif CanAcceptTask(TASK_LOVESTORY2,4) == 1 then
		Talk(4,"","Cã thÓ mua ®­îc Hïng Hoµng töu kh«ng?",
				"Høa c«ng tö ®õng lo l¾ng, sÏ mua ®­îc mµ.",
				"ThËt lµ tèt qu¸, lÔ phÈm c¬ b¶n ®· ®Çy ®ñ, ®Ó ta chuÈn bŞ 1 chót sÏ ®Õn B¹ch phñ.",
				"VËy ®Ó ta vÒ nãi l¹i víi B¹ch c« n­¬ng.")
		DelItem(2,0,359,1)
		local OldPlayerIndex = PlayerIndex
		for i=1,2 do
			PlayerIndex = GetTeamMember(i)
			SetTask(TASK_LOVESTORY2,5)
			TaskTip("Th«ng b¸o cho B¹ch Tè Trinh tin tøc cña Høa Tiªn")
		end
		PlayerIndex = OldPlayerIndex
	elseif CanAcceptTask(TASK_LOVESTORY2,5) == 1 then
		Say("C¸c vŞ vÉn ch­a gÆp B¸ch c« n­¬ng sao?",0)
	elseif CanAcceptTask(TASK_LOVESTORY2,6) == 1 then
		Talk(6,"","C«ng tö ®· chuÈn bŞ mang sè lÔ phÈm ®Õn B¹ch c« n­¬ng ch­a?",
				"õ, ta ®ang chuÈn bŞ mang ®i, sao thÕ?",
				"Ta ®­îc biÕt B¹ch Tè Trinh kh«ng biÕt uèng r­îu, c«ng tö mang Hïng Hoµng töu chØ thªm mÊt høng, hay lµ thay thø kh¸c ®i.",
				"§a t¹ B»ng h÷u ®· nh¾c nhë, nÕu kh«ng th× háng viÖc, nh­ng kh«ng biÕt nªn mang g× theo?",
				"ThÕ nµy ®i, <color=red>D­¬ng Trung ®éng tÇng 2<color> cã mét sè <color=red>b¸nh lÔ<color> mïi vŞ rÊt ngon, thİch hîp lµm quµ tÆng. Ta sÏ mang vÒ 12 c¸i cho c«ng tö.",
				"Xin ®a t¹ c¸c vŞ.")
		local OldPlayerIndex = PlayerIndex
		for i=1,2 do
			PlayerIndex = GetTeamMember(i)
			SetTask(TASK_LOVESTORY2,7)
			CreateTrigger(0,1203,3111)
			TaskTip("§Õn D­¬ng Trung ®éng tÇng 2 thu thËp 12 b¸nh lÔ cho Høa Tiªn")
		end
		PlayerIndex = OldPlayerIndex			
	elseif CanAcceptTask(TASK_LOVESTORY2,7) == 1 then
		if GetItemCount(2,0,360) >= 12 then
			DelItem(2,0,360,12)
			Talk(4,"","§©y lµ b¸nh lÔ, c«ng tö h·y gãi l¹i mang tÆng B¹ch c« n­¬ng.",
					"§a t¹ nhŞ vŞ.",
					"Ta ph¶i trë vÒ th«ng b¸o cho B¹ch c« n­¬ng.",
					"§­îc! §Ó ta chuÈn bŞ ngùa råi sÏ ®i liÒn.")
			local OldPlayerIndex = PlayerIndex
			for i=1,2 do
				RemoveTrigger(GetTrigger(3111))
				PlayerIndex = GetTeamMember(i)
				SetTask(TASK_LOVESTORY2,8)
				TaskTip("VÒ b¸o tin cho B¹ch Tè Trinh")
			end
			PlayerIndex = OldPlayerIndex
		else
			Say("C¸c vŞ kh«ng ph¶i nãi ë <color=red>D­¬ng Trung ®éng tÇng 2<color> cã mét sè <color=red>b¸nh lÔ<color> mïi vŞ rÊt ngon, thİch hîp lµm quµ tÆng, muèn gióp ta t×m 12 c¸i ®ã sao?",0)
		end
	elseif CanAcceptTask(TASK_LOVESTORY2,8) == 1 then
		Say("C¸c vŞ vÉn ch­a gÆp B¸ch c« n­¬ng sao?",0)
	elseif GetTask(TASK_LOVESTORY2) == 9 then
		Say("Chóc ®«i t×nh nh©n sím thµnh phu thª.",0)
	elseif GetTask(TASK_LOVESTORY2) == 0 or GetTask(TASK_LOVESTORY2) == 1 then
		Say("Nªn tÆng thø g×?",0)
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